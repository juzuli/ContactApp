import 'package:contact_app/src/bloc/authentication/authentication_cubit.dart';
import 'package:contact_app/src/constants/strings.dart';
import 'package:contact_app/src/pages/dashboard_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'forgot_password_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    Strings.login,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    Strings.loginIntoYourAccount,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: Strings.email,
                      hintText: Strings.enterYourEmail,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.pleaseEnterEmail;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.key_outlined),
                      suffixIcon: isObscure
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = false;
                                });
                              },
                              icon: const Icon(Icons.visibility_off_outlined),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = true;
                                });
                              },
                              icon: const Icon(Icons.visibility_outlined),
                            ),
                      labelText: Strings.password,
                      hintText: Strings.enterYourPassword,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.pleaseEnterPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        Strings.forgotPassword,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    listener: (context, state) {
                      if (state is AuthenticationSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      } else if (state is AuthenticationLoadError) {
                        Fluttertoast.showToast(
                          msg: Strings.loginFailed,
                          backgroundColor: Colors.redAccent.shade700,
                          toastLength: Toast.LENGTH_LONG,
                        );
                      } else {}
                    },
                    builder: (context, state) {
                      if (state is AuthenticationLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: ElevatedButton(
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                Strings.signIn,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              String email = _emailController.text.trim();
                              String password = _passwordController.text.trim();
                              BlocProvider.of<AuthenticationCubit>(context)
                                  .loginWithEmailPassword(email, password);
                            },
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: Strings.dontHaveAccount),
                          TextSpan(
                            text: Strings.create,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            // color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
