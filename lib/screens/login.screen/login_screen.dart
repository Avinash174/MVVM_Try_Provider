import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_try/res/colors.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/screens/login.screen/login_view_model.dart';
import 'package:mvvm_try/utils/utils.dart';
import 'package:mvvm_try/widget/button.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  ValueNotifier<bool> _password = ValueNotifier(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();

    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LogInViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailFocus,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.alternate_email,
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                    context,
                    emailFocus,
                    passwordFocus,
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ValueListenableBuilder(
                  valueListenable: _password,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _password.value,
                      focusNode: passwordFocus,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: InkWell(
                          onTap: () {
                            _password.value = !_password.value;
                          },
                          child: Icon(
                            _password.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: height * .05,
              ),
              CustomButtom(
                loading: loginViewModel.loading,
                title: 'Log In',
                Ontap: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Enter Email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Enter Password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage('Enter valid password', context);
                  } else {
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString(),
                    };
                    loginViewModel.loginApi(data, context);

                    log('Api hit');
                  }
                },
              ),
              SizedBox(
                height: height * .025,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.signUp,
                  );
                },
                child: const Text(
                  "Don't Have Account?Create Account",
                  style: TextStyle(
                    color: AppColors.btnblueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
