import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:route_task/core/di/di.dart';
import 'package:route_task/core/theme/theme_cubit.dart';
import 'package:route_task/app.dart';
import 'package:route_task/core/utils/my_bloc_observer.dart';
import 'package:route_task/features/data/model/get_photo_response_dm.dart';
// import 'package:route_task/features/data/model/get_photo_response_dm.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  final appDocDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocDir.path);

  Hive.registerAdapter(GetPhotoResponseDmAdapter());
  Hive.registerAdapter(PhotoDmAdapter());
  Hive.registerAdapter(SrcDmAdapter());

  configureDependencies();
  // await Hive.deleteBoxFromDisk('photoBox1');

  runApp(
    BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit()..loadTheme(),
      child: const MyApp(),
    ),
  );
}

