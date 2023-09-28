import 'package:flutter/material.dart';
import 'package:mvvm_try/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    Utils.snackBar('Hello', context);
                  },
                  child: const Text('Log In'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
