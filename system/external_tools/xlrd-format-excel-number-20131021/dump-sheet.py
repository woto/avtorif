# $Id: dump-sheet.py,v 1.4 2013/10/21 07:49:20 olpa Exp $
import xlrd
import numfmt
import locale

locale.setlocale(locale.LC_ALL, '')
l = locale.localeconv()
div1    = l['decimal_point'] or '.'
div1000 = l['thousands_sep'] or ','

def format_number(f, cell, wb):
  xf = wb.xf_list[cell.xf_index]
  fmt_key = xf.format_key
  fmt = wb.format_map[fmt_key]
  s_fmt = fmt.format_str
  a_fmt = numfmt.extract_number_format(s_fmt)
  if a_fmt:
    s_f = numfmt.format_number(f, a_fmt, div1000, div1)
  else:
    s_f = str(f)
  return s_f

def as_display_string(cell):
  if 2 == cell.ctype:
    s = format_number(cell.value, cell, wb)
  else:
    s = str(cell.value)
    if '' == s:
      s = '-'
  return s

wb = xlrd.open_workbook('invoice.xls', formatting_info=1) # f_i is important
sh = wb.sheets()[0]
for i_row in range(sh.nrows):
  for i_col in range(sh.ncols):
    ce = sh.cell(i_row,i_col)
    s = as_display_string(ce)
    print s,
    print " "*(14-len(s)) + "|",
  print
