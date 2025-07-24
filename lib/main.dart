import 'package:flutter/material.dart';
import 'package:weatherapp/views/home_screen.dart';
import 'package:weatherapp/views/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SomeController().initialize(); // if you're doing async work
  runApp(MyApp());
}

class SomeController {
  initialize() {}
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/search':
            return MaterialPageRoute(builder: (_) => SearchScreen());// <- safe fallback
        }
      },


    );
  }
}
