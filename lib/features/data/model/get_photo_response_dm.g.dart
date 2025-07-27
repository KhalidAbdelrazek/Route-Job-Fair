// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_photo_response_dm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetPhotoResponseDmAdapter extends TypeAdapter<GetPhotoResponseDm> {
  @override
  final int typeId = 0;

  @override
  GetPhotoResponseDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetPhotoResponseDm(
      photos: (fields[0] as List?)?.cast<PhotoDm>(),
      page: fields[1] as int?,
      perPage: fields[2] as int?,
      nextPage: fields[3] as String?,
      previousPage: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetPhotoResponseDm obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.photos)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.perPage)
      ..writeByte(3)
      ..write(obj.nextPage)
      ..writeByte(4)
      ..write(obj.previousPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetPhotoResponseDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoDmAdapter extends TypeAdapter<PhotoDm> {
  @override
  final int typeId = 1;

  @override
  PhotoDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoDm(
      id: fields[0] as int?,
      src: fields[1] as SrcDm?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoDm obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.src);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SrcDmAdapter extends TypeAdapter<SrcDm> {
  @override
  final int typeId = 2;

  @override
  SrcDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SrcDm(
      large: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SrcDm obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SrcDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPhotoResponseDm _$GetPhotoResponseDmFromJson(Map<String, dynamic> json) =>
    GetPhotoResponseDm(
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoDm.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      nextPage: json['nextPage'] as String?,
      previousPage: json['previousPage'] as String?,
    );

Map<String, dynamic> _$GetPhotoResponseDmToJson(GetPhotoResponseDm instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'page': instance.page,
      'perPage': instance.perPage,
      'nextPage': instance.nextPage,
      'previousPage': instance.previousPage,
    };

PhotoDm _$PhotoDmFromJson(Map<String, dynamic> json) => PhotoDm(
      id: (json['id'] as num?)?.toInt(),
      src: json['src'] == null
          ? null
          : SrcDm.fromJson(json['src'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoDmToJson(PhotoDm instance) => <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
    };

SrcDm _$SrcDmFromJson(Map<String, dynamic> json) => SrcDm(
      large: json['large'] as String?,
    );

Map<String, dynamic> _$SrcDmToJson(SrcDm instance) => <String, dynamic>{
      'large': instance.large,
    };
