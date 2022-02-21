import 'package:airsoft/blocs/application/application_cubit.dart';
import 'package:airsoft/blocs/login/login_cubit.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/views/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await  DependencyInjector.initLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationCubit>(create: (context) => ApplicationCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
