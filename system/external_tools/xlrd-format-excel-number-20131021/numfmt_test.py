# -*- coding: utf-8 -*-
# $Id: numfmt_test.py,v 1.4 2013/10/21 06:59:21 olpa Exp $
import unittest
import numfmt

class NumberFormatTestCase(unittest.TestCase):

  def test_parse(self):
    self.assertEqual(None, numfmt.extract_number_format('No number inside'))
    self.assertEqual(None, numfmt.extract_number_format('x#,###0.00x'))
    self.assertEqual(None, numfmt.extract_number_format('#,#0.00'))
    self.assertEqual(None, numfmt.extract_number_format('#.##0,00'))
    self.assertEqual(None, numfmt.extract_number_format('x#.##0.00x'))
    self.assertEqual(None, numfmt.extract_number_format('#,##0,00'))
    self.assertEqual(None, numfmt.extract_number_format('#,####'))
    self.assertEqual(('#', '###', None), numfmt.extract_number_format('#,###'))
    # Currency
    self.assertEqual(('#', '##0', '00'), numfmt.extract_number_format('#,##0.00\ [$€-407];[RED]\-#,##0.00\ [$€-407]'))
    # Some number
    self.assertEqual((None, '#', '#'), numfmt.extract_number_format('GENERAL'))
    # Integer
    self.assertEqual((None, '0', None), numfmt.extract_number_format('0'))
    # Two digits after comma
    self.assertEqual((None, '0', '00'), numfmt.extract_number_format('0.00'))
    # From "Number format codes"
    # http://office.microsoft.com/en-us/excel-help/number-format-codes-HP005198679.aspx
    self.assertEqual((None, '####', '#'), numfmt.extract_number_format('####.#'))
    self.assertEqual((None, '#', '000'), numfmt.extract_number_format('#.000'))
    self.assertEqual((None, '0', '#'), numfmt.extract_number_format('0.#'))
    self.assertEqual((None, '#', '0#'), numfmt.extract_number_format('#.0#'))
    # not supported: '???.???'
    # not supported: '# ???/???'
    self.assertEqual(('#', '###', None), numfmt.extract_number_format('#,###'))
    # not supported: '#,'
    # not supported: '0.0,,'

  def test_apply(self):
    def one_test(f, s_fmt, s_expected):
      a = numfmt.extract_number_format(s_fmt)
      s_f = numfmt.format_number(f, a, div1000=',', div1='.')
      self.assertEqual(s_f, s_expected)
    # From "Number format codes"
    one_test(1234.59,  '####.#',   '1234.6')
    one_test(8.9,      '#.000',    '8.900')
    one_test(.631,     '0.#',      '0.6')
    one_test(12,       '#.0#',     '12.0')
    one_test(1234.568, '#.0#',     '1234.57')
    one_test(12000,    '#,###',    '12,000')
    # more tests
    one_test(8.9,      '00#.000',   '008.900')
    one_test(8.9,      '#,#0#.000', '08.900')
    one_test(8.9,      '0,###.000', '0,008.900')
    one_test(8.9,      '00000.000', '00008.900')
    one_test(8.9,      '#.#',       '8.9')
    one_test(8,        '#.#',       '8')
    # with negative sign
    one_test(-8.9,     'GENERAL',   '-8.9')
    one_test(-8.9,     '#,#0#.000', '-8.900')
    one_test(8.9,      '0',         '9') # OpenOffice also makes 9
    one_test(-8.9,     '0',         '-9')
    one_test(8.239,    '0.00',      '8.24')
    one_test(-8.239,   '0.00',      '-8.24')

if __name__ == '__main__':
  unittest.main()
