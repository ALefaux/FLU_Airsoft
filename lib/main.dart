import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/login/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjector.initLocator();
  runApp(
    FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Error initilisation app',
            textDirection: TextDirection.ltr,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return const Text(
          'Loading',
          textDirection: TextDirection.ltr,
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  LoginViewModel loginViewModel = DependencyInjector.getLoginViewModel();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: HomePage(),
    );
  }
}
