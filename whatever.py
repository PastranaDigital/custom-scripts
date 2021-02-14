#!/usr/bin/env python3
# place Python in folder: force-app/main/default/class
# make sure the terminal is navigated to this folder
# run by: python3 filename.py
import os
import sys

className = 'ApexBash_'
classNumber = 1
fullName = className + str(classNumber)

for x in range(5): #5 runs 5 times (0,1,2,3,4)
    # creates the Apex Class
    with open(className+str(classNumber)+'.cls', 'w') as file:
        # \n = new line       # \t = tab     # \ escape character
        file.write('global class '+className+str(classNumber)+' implements Database.Bathable<SObject>, Schedulable{\n')
        file.write('\tglobal Database.QueryLocator start(Database.BatchableContext bContext){\n')
        file.write('\t\treturn Database.getQueryLocator(\'SELECT Id FROM Account Limit 1\');\n')
        file.write('\t}\n')
        file.write('\tglobal void execute(Database.BatchableContext bContext, List<SObject> records){\n')
        file.write('\t\tInteger start = System.Now().millisecond();\n')
        file.write('\t\twhile(System.now().millisecond()< start+10){\n')
        file.write('\t\t}\n')
        file.write('\t}\n')
        file.write('\tglobal void finish(Database.BatchableContext bContext){\n')
        file.write('\t}\n')
        file.write('\tglobal void execute(SchedulableContext sc){\n')
        file.write('\t\tDatabase.executebatch(new '+className+str(classNumber)+'(),10);\n')
        file.write('\t}\n')
        file.write('}\n')

    # creates the Apex XML files
    with open(className+str(classNumber)+'.cls-meta.xml','w') as file:
        # \n = new line       # \t = tab     # \ escape character
        file.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        file.write('<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">\n')
        file.write('\t<apiVersion>50.0</apiVersion>\n')
        file.write('\t<status>Active</status>\n')
        file.write('</ApexClass>\n')

    classNumber=classNumber+1