import 'package:airsoft/blocs/application/application_cubit.dart';
import 'package:airsoft/blocs/login/login_cubit.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/di/repositories_injector.dart';
import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/di/viewmodels_injector.dart';
import 'package:airsoft/views/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RepositoriesInjector.initLocator();
  UsecaseInjector.initLocator();
  ViewModelInjector.initLocator();
  DependencyInjector.initLocator();

  runApp(
    FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          debugPrint("Error initilisation app: ${snapshot.error}");
          return const Center(
            child: Text(
              'Error initilisation app',
              textDirection: TextDirection.ltr,
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ApplicationCubit>(
                  create: (context) => ApplicationCubit()),
              BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
            ],
            child: const MyApp(),
          );
        }

        return const Text(
          'Loading',
          textDirection: TextDirection.ltr,
        );
      },
    ),
  );
}