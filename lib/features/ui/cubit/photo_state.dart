part of 'photo_cubit.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object?> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<PhotoEntity> photos;
  final bool isPaginating;
  final String? paginationError;

  const PhotoLoaded({
    required this.photos,
    this.isPaginating = false,
    this.paginationError,
  });

  PhotoLoaded copyWith({
    List<PhotoEntity>? photos,
    bool? isPaginating,
    String? paginationError,
  }) {
    return PhotoLoaded(
      photos: photos ?? this.photos,
      isPaginating: isPaginating ?? false,
      paginationError: paginationError,
    );
  }

  @override
  List<Object?> get props => [photos, isPaginating, paginationError];
}

class PhotoError extends PhotoState {
  final String message;

  const PhotoError(this.message);

  @override
  List<Object?> get props => [message];
}
