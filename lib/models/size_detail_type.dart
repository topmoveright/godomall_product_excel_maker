class SizeDetailType {
  final String type;
  final List<String> detailList;

  SizeDetailType({
    required this.type,
    required this.detailList,
  });

  SizeDetailType.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        detailList = json['detailList'];

  Map<String, dynamic> toJson() => {'type': type, 'detailList': detailList};

  String toStrDetailList() => detailList.join(',');

  String toStrSettingValue() => '$type|${detailList.join(',')}';
}
