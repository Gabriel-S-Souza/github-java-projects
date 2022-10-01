import 'package:flutter/material.dart';

import 'modules/modules.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              centerTitle: true, backgroundColor: Colors.deepPurpleAccent),
          scaffoldBackgroundColor: Colors.blueGrey[50],
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const HomeScreen(),
        },
        initialRoute: '/home',
      );
}
