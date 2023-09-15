// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

class TableSerializer extends JsonConverter<String, String> {
  const TableSerializer();

  @override
  String fromJson(String json) => json
      .replaceAll('&quot;', '"')
      .replaceAll('quot;', '"')
      .replaceAll('&nbsp;', '')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll(r'\r', '')
      .replaceAll('<nobr>', '<p>')
      .replaceAll('</nobr>', '</p>')
      .replaceAll('<td style=""><p>&nbsp;</p></td>', '')
      .replaceAll(
        '<td style="font-family:Times New Roman;font-size:11px;color:#000000;font-weight:bold;">',
        '<td style="font-family:Times New Roman;font-size:11px;color:#000000;font-weight:bold;" colspan="6">',
      )
      .replaceAll(
        '<td style="font-family:Times New Roman;font-size:11px;color:#000000;">',
        '<td style="font-family:Times New Roman;font-size:11px;color:#000000;" colspan="6">',
      )
      .replaceAll(
        '<td style="font-family:Times New Roman;font-size:11px;color:#000000;font-style:italic;">',
        '<td style="font-family:Times New Roman;font-size:11px;color:#000000;font-style:italic;" colspan="6">',
      )
      .replaceAll(
        '<td style="font-family:Calibri;font-size:10px;color:#000000;">',
        '<td style="font-family:Calibri;font-size:10px;color:#000000;" colspan="4">',
      )
      .replaceAll(
        '<td style="font-family:Calibri;font-size:10px;color:#000000;font-style:italic;">',
        '<td style="font-family:Calibri;font-size:10px;color:#000000;font-style:italic;" colspan="4">',
      )
      .replaceAll(
        '<td style="font-family:Calibri;font-size:8px;color:#000000;">',
        '<td style="font-family:Calibri;font-size:8px;color:#000000;" colspan="2">',
      )
      .replaceAll(r'\n', '')
      .replaceAll(r'\t', '');

  @override
  String toJson(String object) => object;
}
