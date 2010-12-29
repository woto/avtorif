#!/usr/bin/env python
# -*- coding: windows-1251 -*-
# Copyright (C) 2005 Kiseliov Roman

__rev_id__ = """$Id: xls2csv.py,v 1.1 2005/10/26 07:44:24 rvk Exp $"""


from pyExcelerator import *
from optparse import OptionParser
import sys
import csv
import pdb
parser = OptionParser()
parser.add_option("-i", "--input-file", dest="input_file", help="input file name to parse", metavar="INPUT")
parser.add_option("-t", "--temp-path", dest="temp_path", help="temp path", metavar="TEMP_PATH")
parser.add_option("-e", "--encoding", dest="encoding", help="encoding to", metavar="ENCODING")

(options, args) = parser.parse_args()
#pdb.set_trace()

#me, temp_path, encoding, args = sys.argv[0], sys.argv[1], sys.argv[2], sys.argv[3:]
temp_path = options.temp_path
encoding = options.encoding
arg = options.input_file

#if args:
#    for arg in args:
        #print >>sys.stderr, 'extracting data from', arg
for sheet_name, values in parse_xls(arg, str(encoding)): # parse_xls(arg) -- default encoding
    matrix = [[None]]

    #print 'Sheet = "%s"' % sheet_name.encode('cp866', 'backslashreplace')
    #print '----------------'

    sheet_file = csv.writer(open(temp_path + "/" + sheet_name.encode('UTF-8', 'backslashreplace'), 'wb'), delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
#    once = True
#    first_idx = 0

    for row_idx, col_idx in sorted(values.keys()):
#        if(once):
#            once = False
#            first_idx = col_idx
#        pdb.set_trace()
        v = values[(row_idx, col_idx)]
        #pdb.set_trace()
        if isinstance(v, unicode):
            v = v.encode(str(encoding), 'backslashreplace')
            v = '%s' % v.strip()
        elif isinstance(v, float):
            v = int(v)
        else:
            v = `v`
            v = '%s' % v.strip()

        last_row, last_col = len(matrix), len(matrix[-1])
        while last_row <= row_idx:
            matrix.extend([[]])
            last_row = len(matrix)
            last_col = 0

        while last_col < col_idx:
            matrix[-1].extend([''])
            last_col = len(matrix[-1])

        matrix[-1].extend([v])
            
    for row in matrix:
        #csv_row = ', '.join(row)
        sheet_file.writerow(row)
    #sheet_file.close

#else:
#print 'usage: %s (inputfile)+' % me

