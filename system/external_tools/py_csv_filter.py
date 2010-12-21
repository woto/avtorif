#!/usr/bin/env python
# -*- coding: windows-1251 -*-

import sys
import csv
from StringIO import StringIO
import textwrap
import pprint
from optparse import OptionParser
import os
import pdb

#pdb.set_trace()

parser = OptionParser()
parser.add_option("-c", "--column-separator", dest="column_separator", help="column separator", metavar="COLUMN_SEPARATOR")
parser.add_option("-q", "--quote-char", dest="quote_char", help="quote_char", metavar="QUOTE_CHAR")
parser.add_option("-a", "--autodetect", action="store_true", dest="autodetect", help="autodetecting format", metavar="AUTODETECT")
parser.add_option("-i", "--input-file", dest="input_file", help="input file name to parse", metavar="INPUT")
parser.add_option("-o", "--output-file", dest="output_file", help="output file where to save results", metavar="OUTPUT")

(options, args) = parser.parse_args()

quote_char = options.quote_char
column_separator = options.column_separator
autodetect = options.autodetect
in_file = options.input_file
out_file = options.output_file

#pdb.set_trace()

if(quote_char == '1'):
    quote_char = '\x07'
elif(quote_char == '2'):
    quote_char = '"'

if(column_separator == '1'):
    column_separator = ';'
elif(column_separator == '2'):
    column_separator = '\t'
elif(column_separator == '3'):
    column_separator = ','
elif(column_separator == '4'):
    column_separator = '|'


#in_file, out_file = sys.argv[1], sys.argv[2]

size = os.path.getsize(in_file)
bytes_to_detect = 10240
skip_bytes = 1024
#pdb.set_trace()
if(size):
    csvfile = open(in_file, 'rb')
    f = open(out_file, 'wt')
    writer = csv.writer(f)
    counter = 0

    try:
        #pdb.set_trace()
        if(size < bytes_to_detect + skip_bytes):
            max_size = size
        else:
            max_size = bytes_to_detect
            csvfile.seek(1024)

        dialect = csv.Sniffer().sniff(csvfile.read(max_size), [',', '\t', ';', ' ', ':', '|'])
        if not autodetect:
            dialect.quotechar = quote_char
            dialect.delimiter = column_separator

        csvfile.seek(0)
        reader = csv.reader(csvfile, dialect)
        for row in reader:
            #if counter == 0:
                #print row

            counter += 1
            if len(str(row)) > 3500:
                print str(row) + "------- \r\n"
            writer.writerow(row)
    except:
        #pdb.set_trace()
        raise Exception("" + str(sys.exc_info()[1]) + " in parsing file on line: " + str(counter))
