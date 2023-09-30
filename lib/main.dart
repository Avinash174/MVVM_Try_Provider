import 'package:flutter/material.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/routes/routes_name.dart';
import 'package:mvvm_try/screens/login.screen/login_view_model.dart';
import 'package:mvvm_try/screens/signup.screen/signup_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LogInViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        // initialRoute: RoutesName.home,
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
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