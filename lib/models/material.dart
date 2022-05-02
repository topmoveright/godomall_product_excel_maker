class PMaterial {
  final String name;
  final int percent;

  PMaterial({required this.name, required this.percent});

  PMaterial.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        percent = json['percent'];

  Map<String, dynamic> toJson() => {'name': name, 'percent': percent};

  @override
  String toString() {
    return name.isEmpty ? '' : '$name $percent';
  }
}
