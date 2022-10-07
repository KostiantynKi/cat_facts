import 'package:hive/hive.dart';

part 'cats_fact_model_hive.g.dart';

@HiveType(typeId: 0)
class CatsFacts {
  @HiveField(0)
  String? fact;
  @HiveField(1)
  String? today;

  CatsFacts({this.fact, this.today});
}
