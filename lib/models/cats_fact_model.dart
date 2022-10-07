class CatsFact {
  String? fact;
  String? today;

  CatsFact({required this.fact, today});

  CatsFact.fromJson(Map<String, dynamic> json) {
    fact = json['fact'] as String;
  }

  @override
  String toString() => '$fact, $today';
}
