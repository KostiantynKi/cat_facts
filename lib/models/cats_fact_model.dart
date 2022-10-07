class CatsFact {
  String? fact;
  DateTime? today = DateTime.now();

  CatsFact({required this.fact, today});

  CatsFact.fromJson(Map<String, dynamic> json) {
    fact = json['fact'] as String;
  }

  @override
  String toString() => '$fact, $today';
}
