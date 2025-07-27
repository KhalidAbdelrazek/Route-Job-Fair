import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:route_task/features/domain/entity/get_photo_resonse_entity.dart';

part 'get_photo_response_dm.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class GetPhotoResponseDm extends GetPhotoResponseEntity {
  @HiveField(0)
  final List<PhotoDm>? photos;

  @HiveField(1)
  final int? page;

  @HiveField(2)
  final int? perPage;

  @HiveField(3)
  final String? nextPage;

  @HiveField(4)
  final String? previousPage;

  const GetPhotoResponseDm({
    this.photos,
    this.page,
    this.perPage,
    this.nextPage,
    this.previousPage,
  }) : super(
          photos: photos,
          page: page,
          perPage: perPage,
          nextPage: nextPage,
          previousPage: previousPage,
        );

  factory GetPhotoResponseDm.fromJson(Map<String, dynamic> json) =>
      _$GetPhotoResponseDmFromJson(json);

  Map<String, dynamic> toJson() => _$GetPhotoResponseDmToJson(this);
}


@HiveType(typeId: 1)
@JsonSerializable()
class PhotoDm extends PhotoEntity {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final SrcDm? src;

  const PhotoDm({
    this.id,
    this.src,
  }) : super(
          id: id,
          src: src,
        );

  factory PhotoDm.fromJson(Map<String, dynamic> json) =>
      _$PhotoDmFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDmToJson(this);
}



@HiveType(typeId: 2)
@JsonSerializable()
class SrcDm extends SrcEntity {
  @HiveField(0)
  final String? large;

  const SrcDm({
    this.large,
  }) : super(
          large: large,
        );

  factory SrcDm.fromJson(Map<String, dynamic> json) => _$SrcDmFromJson(json);

  Map<String, dynamic> toJson() => _$SrcDmToJson(this);
}

