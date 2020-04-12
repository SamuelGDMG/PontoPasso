// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrar_dia.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrarDiaAdapter extends TypeAdapter<RegistrarDia> {
  @override
  final typeId = 0;

  @override
  RegistrarDia read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrarDia(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[6] as String,
      fields[5] as String,
      (fields[7] as List)?.cast<MeuPontoBase>(),
      fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RegistrarDia obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dataFormatada)
      ..writeByte(1)
      ..write(obj.totalMinutos)
      ..writeByte(2)
      ..write(obj.dia)
      ..writeByte(3)
      ..write(obj.mes)
      ..writeByte(4)
      ..write(obj.ano)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.descricao)
      ..writeByte(7)
      ..write(obj.meusPontos)
      ..writeByte(8)
      ..write(obj.dataMilliSeconds);
  }
}
