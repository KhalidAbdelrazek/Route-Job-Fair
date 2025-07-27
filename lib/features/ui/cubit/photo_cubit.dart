import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/features/domain/entity/get_photo_resonse_entity.dart';
import 'package:route_task/features/domain/use%20case/get_photos_use_case.dart';

part 'photo_state.dart';

@injectable
class PhotoCubit extends Cubit<PhotoState> {
  final GetPhotosUseCase getPhotosUseCase;

  PhotoCubit(this.getPhotosUseCase) : super(PhotoInitial());

  int _page = 1;
  final int _limit = 8;
  bool _isFetching = false;

  Future<void> fetchPhotos({bool isInitialLoad = false}) async {
    if (_isFetching) return;
    _isFetching = true;

    if (isInitialLoad) {
      emit(PhotoLoading());
      _page = 1;
    } else if (state is PhotoLoaded) {
      emit(
        (state as PhotoLoaded).copyWith(
          isPaginating: true,
          paginationError: null,
        ),
      );
    }

    final result = await getPhotosUseCase.call(page: _page, limit: _limit);

    result.fold(
      (failure) {
        if (isInitialLoad) {
          emit(PhotoError(failure.message));
        } else if (state is PhotoLoaded) {
          emit(
            (state as PhotoLoaded).copyWith(
              isPaginating: false,
              paginationError: failure.message,
            ),
          );
        }
      },
      (newPhotos) {
        if (state is PhotoLoaded && !isInitialLoad) {
          final currentPhotos = (state as PhotoLoaded).photos;
          emit(
            PhotoLoaded(
              photos: [...currentPhotos, ...?newPhotos.photos],
              isPaginating: false,
            ),
          );
        } else {
          emit(
            PhotoLoaded(photos: newPhotos.photos ?? [], isPaginating: false),
          );
        }
        _page++;
      },
    );

    _isFetching = false;
  }

  void refreshPhotos() {
    fetchPhotos(isInitialLoad: true);
  }
}
