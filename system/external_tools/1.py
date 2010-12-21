import xlrd
book = xlrd.open_workbook("Novline.xls")
print "The number of worksheets is", book.nsheets
print "Worksheet name(s):", book.sheet_names()
sh = book.sheet_by_index(0)
#print sh.name, sh.nrows, sh.ncols
print sh.cell(rowx=0, colx=0).text
#for rx in range(sh.nrows):
#            print sh.row(rx)
# Refer to docs for more details.
# Feedback on API is welcomed.
