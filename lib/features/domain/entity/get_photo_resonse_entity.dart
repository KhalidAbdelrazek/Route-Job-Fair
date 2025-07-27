import 'package:equatable/equatable.dart';

class GetPhotoResponseEntity extends Equatable {
  final List<PhotoEntity>? photos;
  final int? totalResults;

  const GetPhotoResponseEntity({

     this.photos,
     this.totalResults, int? perPage, String? nextPage, String? previousPage, int? page,
  });

  List<Object?> get props => [photos, totalResults,];
}

class PhotoEntity extends Equatable {

  final String? photographer;
  final SrcEntity? src;

  const PhotoEntity({

     this.photographer,

     this.src, int? id,

  });

  @override
  List<Object?> get props => [

        photographer,

        src,

      ];
}
class SrcEntity extends Equatable {
  final String? large;


  const SrcEntity({
    this.large,

  });

  @override
  List<Object?> get props => [
        large,
      ];
}

