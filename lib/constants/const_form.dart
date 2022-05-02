import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConstForm {
  ConstForm._();

  static NumberFormat priceFormat = NumberFormat('###,###,###,###,###');
  static ButtonStyle btnStyleCancel = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 40, vertical: 24)),
  );

  static ButtonStyle btnStyleConfirm = ButtonStyle(
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 40, vertical: 24)),
  );
}
