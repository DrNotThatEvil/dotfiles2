#!/bin/sh

DEVICE="$(cat $HOME/.dotfiles/scripts/device)"
export BACKUP_DEVICE="${DEVICE%.*}"

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO="ssh://backup@192.168.1.214:50683/~/${BACKUP_DEVICE}-backup"

# Setting this, so you won't be asked for your repository passphrase:
# or this to ask an external program to supply the passphrase:
export BORG_PASSCOMMAND="pass show ${BACKUP_DEVICE}-backup"

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
    --exclude '/home/*/Stack'       \
    --exclude '/home/*/Downloads/*' \
    --exclude '/home/*/.cache/*'    \
    --exclude '/home/*/.local/share/Steam' \
    --exclude '/home/*/.dotfiles'   \
    --exclude '*blocks*'            \
    --exclude '/var/cache/*'        \
    --exclude '/var/tmp/*'          \
                                    \
    "$BORG_REPO"::'{hostname}-{now}'            \
    /etc                            \
    /home                           \
    /root                           \
    /var                            \

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \
    "$BORG_REPO"                    \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 1 ];
then
    info "Backup and/or Prune finished with a warning"
fi

if [ ${global_exit} -gt 1 ];
then
    info "Backup and/or Prune finished with an error"
fi

exit ${global_exit}
