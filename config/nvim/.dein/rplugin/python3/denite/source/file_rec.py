# ============================================================================
# FILE: file_rec.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from .base import Base
import subprocess


class Source(Base):

    def __init__(self, vim):
        Base.__init__(self, vim)

        self.name = 'file_rec'
        self.kind = 'jump_list'

    def on_init(self, context):
        directory = context['args'][0] if len(
            context['args']) > 0 else self.vim.call('getcwd')
        context['__directory'] = self.vim.call('expand', directory)

    def gather_candidates(self, context):
        args = ['find', '-L', context['__directory'],
                '-path', '*/.git/*', '-prune', '-o',
                '-type', 'l', '-print', '-o', '-type', 'f', '-print']
        return [{'word': x, 'action__path': x}
                for x in subprocess.check_output(args).decode(
                        'utf-8').split('\n')]
