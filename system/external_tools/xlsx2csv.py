#!/usr/bin/python

__author__ = "Dilshod Temirkhodjaev <tdilshod@gmail.com>"

import csv, datetime, zipfile, sys
import xml.parsers.expat
from xml.dom import minidom
from optparse import OptionParser

# see also ruby-roo lib at: http://github.com/hmcgowan/roo
FORMATS = {
  'general' : 'float',
  '0' : 'float',
  '0.00' : 'float',
  '#,##0' : 'float',
  '#,##0.00' : 'float',
  '0%' : 'percentage',
  '0.00%' : 'percentage',
  '0.00e+00' : 'float',
  'mm-dd-yy' : 'date',
  'd-mmm-yy' : 'date',
  'd-mmm' : 'date',
  'mmm-yy' : 'date',
  'h:mm am/pm' : 'date',
  'h:mm:ss am/pm' : 'date',
  'h:mm' : 'time',
  'h:mm:ss' : 'time',
  'm/d/yy h:mm' : 'date',
  '#,##0 ;(#,##0)' : 'float',
  '#,##0 ;[red](#,##0)' : 'float',
  '#,##0.00;(#,##0.00)' : 'float',
  '#,##0.00;[red](#,##0.00)' : 'float',
  'mm:ss' : 'time',
  '[h]:mm:ss' : 'time',
  'mmss.0' : 'time',
  '##0.0e+0' : 'float',
  '@' : 'float',
  'yyyy\\-mm\\-dd' : 'date',
  'dd/mm/yy' : 'date',
  'hh:mm:ss' : 'time',
  "dd/mm/yy\\ hh:mm" : 'date',
  'yy-mm-dd' : 'date',
  'd-mmm-yyyy' : 'date',
  'm/d/yy' : 'date',
  'm/d/yyyy' : 'date',
  'dd-mmm-yyyy' : 'date',
  'mm/dd/yy hh:mm am/pm' : 'date',
  'mm/dd/yyyy hh:mm:ss' : 'date',
}
STANDARD_FORMATS = { 
  0 : 'general',
  1 : '0',
  2 : '0.00',
  3 : '#,##0',
  4 : '#,##0.00',
  9 : '0%',
  10 : '0.00%',
  11 : '0.00e+00',
  12 : '# ?/?',
  13 : '# ??/??',
  14 : 'mm-dd-yy',
  15 : 'd-mmm-yy',
  16 : 'd-mmm',
  17 : 'mmm-yy',
  18 : 'h:mm am/pm',
  19 : 'h:mm:ss am/pm',
  20 : 'h:mm',
  21 : 'h:mm:ss',
  22 : 'm/d/yy h:mm',
  37 : '#,##0 ;(#,##0)',
  38 : '#,##0 ;[red](#,##0)',
  39 : '#,##0.00;(#,##0.00)',
  40 : '#,##0.00;[red](#,##0.00)',
  45 : 'mm:ss',
  46 : '[h]:mm:ss',
  47 : 'mmss.0',
  48 : '##0.0e+0',
  49 : '@',
}

#
# usage: xlsx2csv("test.xslx", open("test.csv", "w+"))
# parameters:
#   sheetid - sheet no to convert (0 for all sheets)
#   dateformat - override date/time format
#   delimiter - csv columns delimiter symbol
#   sheet_delimiter - sheets delimiter used when processing all sheets
#
def xlsx2csv(infilepath, outfile, sheetid=1, dateformat=None, delimiter=",", sheetdelimiter="--------"):
    writer = csv.writer(outfile, quoting=csv.QUOTE_MINIMAL, delimiter=delimiter)
    ziphandle = zipfile.ZipFile(infilepath)
    try:
        shared_strings = parse(ziphandle, SharedStrings, "xl/sharedStrings.xml")
        styles = parse(ziphandle, Styles, "xl/styles.xml")
        workbook = parse(ziphandle, Workbook, "xl/workbook.xml")

        if sheetid > 0:
            sheet = None
            for s in workbook.sheets:
                if s['id'] == sheetid:
                    sheet = Sheet(shared_strings, styles, ziphandle.read("xl/worksheets/sheet%i.xml" %s['id']))
                    break
            if not sheet:
                raise Exception("Sheet %i Not Found" %sheetid)
            sheet.set_dateformat(dateformat)
            sheet.to_csv(writer)
        else:
            for s in workbook.sheets:
                if sheetdelimiter != "":
                    outfile.write(sheetdelimiter + " " + str(s['id']) + " - " + s['name'] + "\r\n")
                sheet = Sheet(shared_strings, styles, ziphandle.read("xl/worksheets/sheet%i.xml" %s['id']))
                sheet.set_dateformat(dateformat)
                sheet.to_csv(writer)
    finally:
        ziphandle.close()

def parse(ziphandle, klass, filename):
    instance = klass()
    if filename in ziphandle.namelist():
        instance.parse(ziphandle.read(filename))
    return instance

class Workbook:
    sheets = []

    def parse(self, data):
        workbookDoc = minidom.parseString(data)
        sheets = workbookDoc.firstChild.getElementsByTagName("sheets")[0]
        for sheetNode in sheets.childNodes:
            attrs = sheetNode._attrs
            name = attrs["name"].value
            if attrs.has_key('sheetId'):
                id = int(attrs['sheetId'].value)
            else:
                id = int(attrs["r:id"].value[3:])
            self.sheets.append({'name': name, 'id': id})

class Styles:
    numFmts = {}
    cellXfs = []

    def parse(self, data):
        styles = minidom.parseString(data).firstChild
        # numFmts
        numFmtsElement = styles.getElementsByTagName("numFmts")
        if len(numFmtsElement) == 1:
            for numFmt in numFmtsElement[0].childNodes:
                numFmtId = int(numFmt._attrs['numFmtId'].value)
                formatCode = numFmt._attrs['formatCode'].value.lower().replace('\\', '')
                self.numFmts[numFmtId] = formatCode
        # cellXfs
        cellXfsElement = styles.getElementsByTagName("cellXfs")
        if len(cellXfsElement) == 1:
            for cellXfs in cellXfsElement[0].childNodes:
                numFmtId = int(cellXfs._attrs['numFmtId'].value)
                self.cellXfs.append(numFmtId)

class SharedStrings:
    parser = None
    strings = []
    si = False
    t = False
    value = ""

    def parse(self, data):
        self.parser = xml.parsers.expat.ParserCreate()
        self.parser.CharacterDataHandler = self.handleCharData
        self.parser.StartElementHandler = self.handleStartElement
        self.parser.EndElementHandler = self.handleEndElement
        self.parser.Parse(data)

    def handleCharData(self, data):
        if self.t:
            self.value+= data

    def handleStartElement(self, name, attrs):
        if name == 'si':
            self.si = True
        elif name == 't' and self.si:
            self.t = True
            self.value = ""

    def handleEndElement(self, name):
        if name == 'si':
            self.si = False
            self.strings.append(self.value)
        elif name == 't':
            self.t = False

class Sheet:
    parser = None
    writer = None
    sharedString = None
    styles = None

    in_sheet = False
    in_row = False
    in_cell = False
    in_cell_value = False
    in_cell_formula = False

    columns = {}
    rowNum = None
    colType = None
    s_attr = None
    data = None

    dateformat = None

    def __init__(self, sharedString, styles, data):
        self.data = data
        self.sharedStrings = sharedString.strings
        self.styles = styles

    def set_dateformat(self, dateformat):
        self.dateformat = dateformat

    def to_csv(self, writer):
        self.writer = writer
        self.parser = xml.parsers.expat.ParserCreate()
        self.parser.CharacterDataHandler = self.handleCharData
        self.parser.StartElementHandler = self.handleStartElement
        self.parser.EndElementHandler = self.handleEndElement
        self.parser.Parse(self.data)

    def handleCharData(self, data):
        if self.in_cell_value:
            self.data = data # default value
            if self.colType == "s": # shared string
                self.data = self.sharedStrings[int(data)]
            elif self.colType == "b": # boolean
                self.data = (int(data) == 1 and "TRUE") or (int(data) == 0 and "FALSE") or data
            elif self.s_attr:
                s = int(self.s_attr)

                # get cell format
                format = None
                xfs_numfmt = self.styles.cellXfs[s]
                if self.styles.numFmts.has_key(xfs_numfmt):
                    format = self.styles.numFmts[xfs_numfmt]
                elif STANDARD_FORMATS.has_key(xfs_numfmt):
                    format = STANDARD_FORMATS[xfs_numfmt]
                # get format type
                if format and FORMATS.has_key(format):
                    format_type = FORMATS[format]

                    if format_type == 'date': # date/time
                        try:
                            date = datetime.date(1899, 12, 30) + datetime.timedelta(float(data))
                            if self.dateformat:
                                # str(dateformat) - python2.5 bug, see: http://bugs.python.org/issue2782
                                self.data = date.strftime(str(self.dateformat))
                            else:
                                dateformat = format.replace("yyyy", "%Y").replace("yy", "%y"). \
                                  replace("hh:mm", "%h:%M").replace("hh", "%h").replace("ss", "%S"). \
                                  replace("d", "%e").replace("%e%e", "%d"). \
                                  replace("mmmm", "%B").replace("mmm", "%b").replace("mm", "%m"). \
                                  replace("am/pm", "%p")
                                self.data = date.strftime(str(dateformat)).strip()
                        except (ValueError, OverflowError):
                            # invalid date format
                            self.data = data
                    elif format_type == 'time': # time
                        self.data = str(float(data) * 24*60*60)
        # does not support it
        #elif self.in_cell_formula:
        #    self.formula = data

    def handleStartElement(self, name, attrs):
        if self.in_row and name == 'c':
            self.colType = attrs.get("t")
            self.s_attr = attrs.get("s")
            cellId = attrs.get("r")
            self.colNum = cellId[:len(cellId)-len(self.rowNum)]
            #self.formula = None
            self.data = ""
            self.in_cell = True
        elif self.in_cell and name == 'v':
            self.in_cell_value = True
        #elif self.in_cell and name == 'f':
        #    self.in_cell_formula = True
        elif self.in_sheet and name == 'row' and attrs.has_key('r'):
            self.rowNum = attrs['r']
            self.in_row = True
            self.columns = {}
        elif name == 'sheetData':
            self.in_sheet = True

    def handleEndElement(self, name):
        if self.in_cell and name == 'v':
            self.in_cell_value = False
        #elif self.in_cell and name == 'f':
        #    self.in_cell_formula = False
        elif self.in_cell and name == 'c':
            t = 0
            for i in self.colNum: t = t*26 + ord(i) - 64
            self.columns[t - 1] = self.data
            self.in_cell = False
        if self.in_row and name == 'row':
            if len(self.columns.keys()) > 0:
                d = [""] * (max(self.columns.keys()) + 1)
                for k in self.columns.keys():
                    d[k] = self.columns[k].encode("utf-8")
                self.writer.writerow(d)
            self.in_row = False
        elif self.in_sheet and name == 'sheetData':
            self.in_sheet = False

if __name__ == "__main__":
    parser = OptionParser(usage = "%prog [options] infile [outfile]", version="0.11")
    parser.add_option("-s", "--sheet", dest="sheetid", default=1, type="int",
      help="sheet no to convert (0 for all sheets)")
    parser.add_option("-d", "--delimiter", dest="delimiter", default=",",
      help="delimiter - csv columns delimiter, 'tab' or 'x09' for tab (comma is default)")
    parser.add_option("-p", "--sheetdelimiter", dest="sheetdelimiter", default="--------",
      help="sheets delimiter used to separate sheets, pass '' if you don't want delimiters (default '--------')")
    parser.add_option("-f", "--dateformat", dest="dateformat",
      help="override date/time format (ex. %Y/%m/%d)")

    (options, args) = parser.parse_args()

    if len(options.delimiter) == 1:
        delimiter = options.delimiter
    elif options.delimiter == 'tab':
        delimiter = '\t'
    elif options.delimiter == 'comma':
        delimiter = ','
    elif options.delimiter[0] == 'x':
        delimiter = chr(int(options.delimiter[1:]))
    else:
        raise Exception("Invalid delimiter")

    kwargs = {
      'sheetid' : options.sheetid,
      'delimiter' : delimiter,
      'sheetdelimiter' : options.sheetdelimiter,
      'dateformat' : options.dateformat
    }

    if len(args) == 1:
        xlsx2csv(args[0], sys.stdout, **kwargs)
    elif len(args) == 2:
        f = open(args[1], "w+")
        xlsx2csv(args[0], f, **kwargs)
        f.close()
    else:
        parser.print_help()