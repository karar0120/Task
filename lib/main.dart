import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon/Business_logic/Provider/AppProvider.dart';
import 'package:noon/Data/Web_server/webServer.dart';
import 'package:provider/provider.dart';

import 'Screens/HomePage.dart';
import 'const/Bloc.observer.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      WebServer.init();
      runApp(MyApp(
      ));
    },
    blocObserver:MyBlocObserver() ,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppProvider()..GetdataFormApi(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

