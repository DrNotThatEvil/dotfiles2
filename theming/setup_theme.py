import json
import sys
import yaml

def x_to_theme(fn, raw):
    with open('import_{}.json'.format(fn), 'r') as f:
        data = json.load(f)

    with open('{}.yaml'.format(fn), 'w') as wf:
        newdata = {'scheme': data['name'], 'author': data['author']}
        color_data = {}
        map_data = [0, 8, 11, 10, 13, 14, 12, 5, 3, 9, 1, 2, 4, 6, 15, 7] 
        if raw:
            map_data = range(16)

        for i, color in enumerate(data['color']):
            ibase = "{:02x}".format(map_data[i]).upper()
            newdata['base{}'.format(ibase)] = color[1:]
            print("color{}: {} => base{:02x}".format(i, color, map_data[i]))
        yaml.safe_dump(newdata, wf, default_flow_style=False, default_style='"')

def theme_to_x(fn):
    print("DEPRICATED")
    return
    '''
    print("Writing to symlink file")
    with open('theme_{}.json'.format(fn), 'r') as f:
        data = json.load(f)

    if 'theme_format' not in data.keys():
        print("Can't import not in base16 format")
        return

    if data['theme_format'] != 'base16':
        print("Can't import not in base16 format")
        return

    with open('Xresources.template', 'r') as tf:
        with open('Xresources.symlink', 'w') as wf:
            for i, line in enumerate(tf):
                if line == "! INSERT HERE !\n":
                    wf.write("! Based on Base16 theme rules\n")
                    wf.write("! .Xresources generation based on chriskempson/base16-xresources\n")
                    base_keys = sorted(data['color'], key=lambda baseid: int(baseid))
                    
                    for i in base_keys:
                        ibase = "{:02x}".format(int(i)).upper()
                        wf.write("#define base{} {}\n".format(ibase,
                                 data['color'][i]))
                    continue

                wf.write(line)
    '''


if __name__ == "__main__":
    arg = sys.argv[1:]

    if arg[0] == 'x_to_theme':
        raw = (arg[2] == 'raw')
        print(raw)
        x_to_theme(arg[1], raw)

    if arg[0] == 'theme_to_x':
        theme_to_x(arg[1])
