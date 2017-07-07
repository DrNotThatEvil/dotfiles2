import webbrowser

firefox = webbrowser.get('firefox')

with open('colors') as infile:
    for i, line in enumerate(infile):
        url = "http://www.color-hex.com/color/"+line[1:]
        firefox.open_new_tab(url)
