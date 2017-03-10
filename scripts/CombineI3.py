import os.path
from os import listdir 

script_dir = os.path.dirname(os.path.realpath(__file__))
devicefile = script_dir + '/device'
i3_dir = os.path.realpath(script_dir + '/../config/i3')

if os.path.isfile(devicefile) and os.access(devicefile, os.R_OK):
    content = ''
    with open(devicefile, 'r') as f:
        content = f.readlines()
    content = [x.strip() for x in content]
    content = content[0]
    
    i3_base = i3_dir + '/config.base'
    i3_output = i3_dir + '/config'
    
    i3_content = i3_dir + '/' + content
    if os.path.isfile(i3_output) and os.access(i3_output, os.R_OK):

        if os.path.isfile(i3_content) and os.access(i3_content, os.R_OK):
            if os.path.isfile(i3_base) and os.access(i3_base, os.R_OK):
                with open(i3_output, 'w') as i3_output_obj:
                    with open(i3_base, 'r') as i3_base_obj:
                        for line in i3_base_obj:
                            i3_output_obj.write(line)

                    i3_output_obj.write('\n')

                    with open(i3_content, 'r') as i3_content_obj:
                        for line in i3_content_obj:
                            i3_output_obj.write(line)
                    
                    i3_output_obj.write('\n')
            else:
                raise Exception("Could not open i3 base config Sorry...")
        else:
            raise Exception("Could not find device i3 file just using the base.") 
            if os.path.isfile(i3_base) and os.access(i3_base, os.R_OK):
                with open(i3_output, 'w') as i3_output_obj:
                    with open(i3_base, 'r') as i3_base_obj:
                        for line in i3_base_obj:
                            i3_output_obj.write(line)
            else:
                raise Exception("Could not open i3 base config Sorry...")
    else:
        raise Exception("Could not open output file sorry!") 
else:
    print("Sorry.. but what i3 config should be used on this device? \n")
    print("What i3 extension to the base i3 do you want to use:")
    dont_show = ['config.base']
    onlyfiles = [
        f for f in listdir(i3_dir) if os.path.isfile(i3_dir + '/' + f) and f.endswith('.base') and not f in dont_show
    ]
    
    print("options:")
    for f in onlyfiles:
        print("    \'" + os.path.splitext(f)[0]  + "\'")
    print("Please select a option by typing your selection")
    print("To create a new i3 base extension just type something new")
    print("A new i3.base file will be created for you")
    selection = input("Please type your selection: ") + '.base'
    selection = selection.lower().strip() 
    
    if selection not in onlyfiles:
        # new file creation.
        with open(i3_dir + '/' + selection, 'w+') as new_base_obj:
            new_base_obj.write("### NEW BASE FILE STARTS HERE ###")

    with open(devicefile, 'w+') as device_file_obj:
        device_file_obj.write(selection)

