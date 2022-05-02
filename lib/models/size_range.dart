import 'package:flutter/material.dart';

class SizeRange {
  final int start;
  final int end;

  SizeRange(this.start, this.end);

  SizeRange.fromJson(Map<dynamic, dynamic> json)
      : start = json['start'],
        end = json['end'];

  Map<String, dynamic> toJson() => {'start': start, 'end': end};

  RangeValues get toRangeValue => RangeValues(start.toDouble(), end.toDouble());

  String get toRangeStr => start == end ? start.toString() : '$start~$end';
}
