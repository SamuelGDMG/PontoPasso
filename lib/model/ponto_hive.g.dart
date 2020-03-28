// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ponto_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeuPontoBaseAdapter extends TypeAdapter<MeuPontoBase> {
  @override
  final typeId = 1;

  @override
  MeuPontoBase read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeuPontoBase(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MeuPontoBase obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tipoPonto)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.totalMinutos);
  }
}
