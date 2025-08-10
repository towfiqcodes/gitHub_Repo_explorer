// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoModelAdapter extends TypeAdapter<RepoModel> {
  @override
  final int typeId = 0;

  @override
  RepoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoModel(
      name: fields[0] as String,
      fullName: fields[1] as String,
      ownerLogin: fields[2] as String,
      ownerAvatarUrl: fields[3] as String,
      htmlUrl: fields[4] as String,
      description: fields[5] as String,
      stargazersCount: fields[6] as int,
      forksCount: fields[7] as int,
      language: fields[8] as String?,
      licenseName: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RepoModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.ownerLogin)
      ..writeByte(3)
      ..write(obj.ownerAvatarUrl)
      ..writeByte(4)
      ..write(obj.htmlUrl)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.stargazersCount)
      ..writeByte(7)
      ..write(obj.forksCount)
      ..writeByte(8)
      ..write(obj.language)
      ..writeByte(9)
      ..write(obj.licenseName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
