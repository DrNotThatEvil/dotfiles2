with open('colors') as infile:
    for i, line in enumerate(infile):
        print("color"+str(i)+" = "+line)
