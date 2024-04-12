import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmprojectss/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier _obsecurePassword = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecurePassword..dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login View'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email here',
                icon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*',
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Password here',
                        icon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: _obsecurePassword.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility))),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus();
                    },
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'Sign Up',
              loading: authViewModel.signUpLoading,
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please Enter email', context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please Enter password', context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Please Enter 6 digits password', context);
                } else {
                  Map data = {
                    // email same "email": "eve.holt@reqres.in",
                    // password same "password": "pistol"
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  authViewModel.signUpApi(data, context);
                  print('api hit');
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: const Text("Already have an account? login")),
          ],
        ),
      ),
    );
  }
}
