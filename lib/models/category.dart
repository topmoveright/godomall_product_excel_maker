const categorySeparator = '_';

class Category {
  final String first;
  final String second;
  final String third;
  final String fourth;

  Category({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
  });

  Category.fromJson(Map<String, dynamic> json)
      : first = json['first'],
        second = json['second'],
        third = json['third'],
        fourth = json['fourth'];

  Map<String, dynamic> toJson() => {
        'first': first,
        'second': second,
        'third': third,
        'fourth': fourth,
      };

  Category onlyName() {
    var nameFirst = first.split(categorySeparator).first;
    var nameSecond = second.split(categorySeparator).first;
    var nameThird = third.split(categorySeparator).first;
    var nameFourth = fourth.split(categorySeparator).first;

    return Category(
      first: nameFirst,
      second: nameSecond,
      third: nameThird,
      fourth: nameFourth,
    );
  }

  Category onlyNumber() {
    var numberFirst = first.split(categorySeparator).last;
    var numberSecond = second.split(categorySeparator).last;
    var numberThird = third.split(categorySeparator).last;
    var numberFourth = fourth.split(categorySeparator).last;

    return Category(
      first: numberFirst,
      second: numberSecond,
      third: numberThird,
      fourth: numberFourth,
    );
  }

  String toExcelData() {
    var numberCategory = onlyNumber();
    var list = [
      numberCategory.first,
      numberCategory.second,
      numberCategory.third,
      numberCategory.fourth
    ];
    var temp = '';
    for (var i = 0; i < list.length; i++) {
      if (list[i].isNotEmpty) {
        var sum = list.sublist(0, i + 1).fold('', (p, e) => '$p$e');
        temp = '$temp$sum\n';
      }
    }
    return temp;
  }

  @override
  String toString() {
    var onlyNamed = onlyName();

    return [
      onlyNamed.first,
      onlyNamed.second,
      onlyNamed.third,
      onlyNamed.fourth
    ].where((element) => element.isNotEmpty).join(' + ');
  }
}
