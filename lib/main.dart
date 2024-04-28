import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifily/blocs/auth/auth_bloc_bloc.dart';
import 'package:verifily/blocs/imagespath/images_path_bloc.dart';
import 'package:verifily/presentation/screens/pick_selfie_image.dart';
import 'package:verifily/repositories/auth_repository.dart';
import 'package:verifily/repositories/images_paths.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(create: (_) => AuthRepository()),
          RepositoryProvider<ImagesPaths>(
              create: (_) => ImagesPaths(frontIdPath: '', backIdPath: ''))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBlocBloc(
                  repository: RepositoryProvider.of<AuthRepository>(context),
                  paths: RepositoryProvider.of<ImagesPaths>(context)),
            ),
            BlocProvider(
              create: (context) => ImagesPathBloc(
                paths: RepositoryProvider.of<ImagesPaths>(context),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: PickSelfieImage(),
          ),
        ),
      ),
    );
  }
}
