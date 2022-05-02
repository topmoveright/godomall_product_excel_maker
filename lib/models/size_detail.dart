import 'package:athanasia/models/size_detail_type.dart';

class SizeDetail {
  final SizeDetailType sizeDetailType;
  final String value;

  SizeDetail({
    required this.sizeDetailType,
    required this.value,
  });

  @override
  String toString() {
    var temp = [];
    var splitValue = value.trim().split(',');
    for (var i = 0; i < sizeDetailType.detailList.length; i++) {
      temp.add('${sizeDetailType.detailList[i].trim()} : ${splitValue[i].trim()}');
    }
    return temp.join(' | ');
  }
}
