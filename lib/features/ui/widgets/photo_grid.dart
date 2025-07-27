import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:route_task/core/common/network_error_widget.dart';
import 'package:route_task/features/ui/cubit/photo_cubit.dart';
import 'package:route_task/features/ui/widgets/explore_item.dart';

class PhotoGrid extends StatefulWidget {
  const PhotoGrid({super.key});

  @override
  State<PhotoGrid> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    context.read<PhotoCubit>().fetchPhotos(isInitialLoad: true);
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore) {
      _isLoadingMore = true;
      _currentPage++;
      context
          .read<PhotoCubit>()
          .fetchPhotos(isInitialLoad: false)
          .whenComplete(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        if (state is PhotoLoading && _currentPage == 1) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PhotoLoaded) {
          final photos = state.photos;
          final isPaginating = state.isPaginating;
          final paginationError = state.paginationError;

          return Column(
            children: [
              Expanded(
                child: StaggeredGridView.countBuilder(
                  controller: _scrollController,
                  crossAxisCount: 4,
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return ExploreItem(data: photos[index]);
                  },
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(2, index.isEven ? 3 : 2),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
              if (isPaginating)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: CircularProgressIndicator(),
                ),
              if (paginationError != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    paginationError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          );
        } else if (state is PhotoError) {
          return NetworkErrorWidget(
            errorMsg: state.message,
            onTap: () async {
              _currentPage = 1;
              await context.read<PhotoCubit>().fetchPhotos(isInitialLoad: true);
            },
            large: true,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
