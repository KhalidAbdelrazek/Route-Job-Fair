import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/di/di.dart';
import 'package:route_task/core/theme/theme_cubit.dart';
import 'package:route_task/features/ui/cubit/photo_cubit.dart';
import 'package:route_task/features/ui/widgets/photo_grid.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PhotoCubit>()..fetchPhotos(isInitialLoad: true),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // foregroundColor: Colors.transparent,
          // elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: const Text("Route",),
          actions: [
            IconButton(
              icon: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (_, state) {
                  return Icon(
                    state.themeMode == ThemeMode.dark
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  );
                },
              ),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            ),
          ],
        ),
        body: const PhotoGrid(),
      ),
    );
  }
}
