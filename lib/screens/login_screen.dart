import 'package:flutter/material.dart';
import 'package:mvvm_try/utils/utils.dart';
import 'package:mvvm_try/widget/button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode emailFocus = FocusNode();
    FocusNode passwordFocus = FocusNode();
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    ValueNotifier<bool> _password = ValueNotifier(true);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
                title: 'Log In',
                Ontap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
