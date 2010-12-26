#!/usr/bin/env python
# -*- coding: windows-1251 -*-

import csv
from datetime import datetime

csvfile = open('in.csv', 'rb')
f = open('python_out.csv', 'wt')
writer = csv.writer(f)

print(datetime.now())
reader = csv.reader(csvfile)
for row in reader:
    writer.writerow(row)
print(datetime.now())
