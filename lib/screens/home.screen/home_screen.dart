import 'package:flutter/material.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/screens/login.screen/user_view_model.dart';
import 'package:mvvm_try/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRef = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Utils.snackBar('Hello', context);
              },
              child: ElevatedButton(
                onPressed: () {
                  userRef.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: const Text('Log Out'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
