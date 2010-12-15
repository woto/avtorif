#!/usr/bin/env python
# -*- coding: windows-1251 -*-

import sys
import csv
from StringIO import StringIO
import textwrap
import pprint

#print sys
#print 'hello wfrom python'
in_file, out_file = sys.argv[0], sys.argv[1]

csvfile = open(in_file, 'rb')
f = open(out_file, 'wt')
writer = csv.writer(f)

dialect = csv.Sniffer().sniff(csvfile.read(1024))
csvfile.seek(0)
reader = csv.reader(csvfile, dialect)
counter = 0
for row in reader:
    counter += 1
    writer.writerow(row)
    if counter % 100 == 0:
        print row
