#!/usr/bin/env python

# xls.py - Provides the same API for reading CSV or XLS spreadsheet files
# 20090928 raf <raf@raf.org>

'''
xls - Provides the same API for reading CSV or XLS spreadsheet files
20090928 raf <raf@raf.org>

This module provides the reader() function which returns an iterator
over the rows contained in either a CSV file or the first sheet (by
default) of an XLS file whose name is given as an argument.

Example:

	import xls
	for row in xls.reader('example.xls'):
		print('%r' % row)
'''

import csv, xlrd, re, decimal

def reader(fname, i=0):
	'''If fname ends in ".csv" or ".txt", return a CSV reader for the
	corresponding file. Otherwise, return an equivalent XLS reader.
	For XLS files:
	 - If i is supplied, it is the zero-based index of the sheet to read.
	 - If i is negative, all sheets are read (each separated by an empty row).
	 - All cell values are returned as strings (consistent with csv module).
	 - Numbers are rounded according to their display format.
	 '''
	if fname[-4:].lower() in ['.csv', '.txt']:
		return csv.reader(open(fname, 'rb'))
	book = xlrd.open_workbook(fname, formatting_info=True)
	def iter():
		for j in [i] if i >= 0 else range(book.nsheets):
			# Separate multiple worksheets with a blank line
			if i < 0 and j > 0:
				yield []
			sheet = book.sheet_by_index(j)
			for r in range(sheet.nrows):
				row = []
				for type, value in zip(sheet.row_types(r), sheet.row_values(r)):
					# Types:
					# 0 = empty u''
					# 1 = unicode text
					# 2 = float (convert to int if possible, then convert to string)
					# 3 = date (convert to unambiguous date/time string)
					# 4 = boolean (convert to string "0" or "1")
					# 5 = error (convert from code to error text)
					# 6 = blank u''
					if type == 2:
						xf_index = sheet.cell_xf_index(r, len(row))
						xf = book.xf_list[xf_index]
						fmt = book.format_map[xf.format_key]
						match = re.compile('\.(0+)').search(fmt.format_str)
						digits = len(match.group(1)) if match else None
						if digits != None:
							value = decimal.Decimal(str(value)).quantize(decimal.Decimal((0, (1,), -digits)), rounding=decimal.ROUND_HALF_UP)
						if value == int(value): value = int(value)
						value = str(value)
					elif type == 3:
						t = xlrd.xldate_as_tuple(value, book.datemode)
						if t[0] == 0 and t[1] == 0 and t[2] == 0:
							value = "%02d:%02d:%02d" % t[3:6]
						elif t[3] == 0 and t[4] == 0 and t[5] == 0:
							value = "%04d-%02d-%02d" % t[0:3]
						else:
							value = "%04d-%02d-%02dT%02d:%02d:%02d" % t
					elif type == 4:
						value = str(value)
					elif type == 5:
						value = xlrd.error_text_from_code[value]
					row.append(value)
				# Strip trailing empty cells
				while len(row) and row[-1] == '': row = row[:-1]
				yield row
	return iter()

def _csv(value):
	'''Return value quoted as needed for inclusion in a CSV file.'''
	if value == None: return ''
	if not isinstance(value, basestring): value = str(value)
	return '"' + value.replace('"', '""') + '"' if any([_ in value for _ in '",\r\n\v\f']) else value

#ifdef TEST
def main():
	'''Test reader() by reading the csv or xls file whose name is given
	on the command line and printing out its contents in csv format.
	It is up to the user to verify that it really worked.'''
	import sys
	if len(sys.argv) not in [2, 3]:
		print('usage: %s filename [sheetnumber]' % sys.argv[0])
		sys.exit(1)
	i = int(sys.argv[2])-1 if len(sys.argv) == 3 else 0
	for row in reader(sys.argv[1], i):
		print('%s' % ','.join([_csv(unicode(cell).encode('utf8')) for cell in row]))

if __name__ == '__main__':
	main()
#endif TEST

# vi:set ts=4 sw=4:
