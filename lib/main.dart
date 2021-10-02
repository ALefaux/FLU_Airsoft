import 'dart:developer' as developer;

import 'package:airsoft/main_view_model.dart';
import 'package:airsoft/views/energyconverter/energy_converter_page.dart';
import 'package:airsoft/views/energyconverter/energy_converter_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'models/auth_state.dart';

GetIt locator = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(MyApp());
}

void initLocator() {
  locator.registerLazySingleton(() => MainViewModel());
  locator.registerLazySingleton(() => EnergyConverterViewModel());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MainViewModel mainViewModel = locator<MainViewModel>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Error initilisation app',
              textDirection: TextDirection.ltr,
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            switch (mainViewModel.authState) {
              case AuthState.connected:
                developer.log('User logged');
                return const HomePage();
              case AuthState.notConnected:
                developer.log('User not logged');
                return const HomePage();
            }
          }

          return const Text(
            'Loading',
            textDirection: TextDirection.ltr,
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    EnergyConverterPage(),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.crop_square), label: 'Another item'),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Utils')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
