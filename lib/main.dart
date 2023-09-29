import 'package:flutter/material.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // initialRoute: RoutesName.home,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
 // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) {
    //       HomeViewModel();
    //     }),
    //     ChangeNotifierProvider(create: (_) {
    //       LogInViewModel();
    //     }),
    //   ],