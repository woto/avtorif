#!/usr/bin/env python
# -*- coding: windows-1251 -*-

import sys
import csv
from StringIO import StringIO
import textwrap
import pprint
import os
import pdb

#pdb.set_trace()

in_file, out_file = sys.argv[1], sys.argv[2]
size = os.path.getsize(in_file)
size_to_detect = 10240
max_size = size if size < size_to_detect else size_to_detect
if(size):
    csvfile = open(in_file, 'rb')
    f = open(out_file, 'wt')
    writer = csv.writer(f)

    try:
        dialect = csv.Sniffer().sniff(csvfile.read(max_size), [',', '\t', ';', ' ', ':', '|'])
        csvfile.seek(0)
        reader = csv.reader(csvfile, dialect)
        counter = 0
        for row in reader:
            #if counter == 0:
                #print row

            counter += 1
            #print counter
            writer.writerow(row)
    except:
        #pdb.set_trace()
        raise Exception("\r\n\r\n" + str(sys.exc_info()[1]) + "\r\n\r\n. In line: " + str(counter))
