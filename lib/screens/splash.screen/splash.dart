import 'package:flutter/material.dart';
import 'package:mvvm_try/services/solash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  void initState() {
    super.initState();
    splashServices.checkAuthantication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(
                fontSize: 28,
                wordSpacing: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
