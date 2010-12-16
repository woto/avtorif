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

if(os.path.getsize(in_file)):
    csvfile = open(in_file, 'rb')
    f = open(out_file, 'wt')
    writer = csv.writer(f)

    dialect = csv.Sniffer().sniff(csvfile.read(10240), [',', '\t', ';', ' ', ':', '|'])
    csvfile.seek(0)
    reader = csv.reader(csvfile, dialect)
    counter = 0
    for row in reader:
        if counter == 0:
            print row

        counter += 1
        writer.writerow(row)
