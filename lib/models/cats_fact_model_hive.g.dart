// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_fact_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatsFactsAdapter extends TypeAdapter<CatsFacts> {
  @override
  final int typeId = 0;

  @override
  CatsFacts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatsFacts(
      fact: fields[0] as String?,
      today: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatsFacts obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.today);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatsFactsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
