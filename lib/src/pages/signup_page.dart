import 'package:contact_app/src/bloc/authentication/authentication_cubit.dart';
import 'package:contact_app/src/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/strings.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final RegExp phoneRegex = RegExp(r'^[6-9]\d{9}$');
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createANewAccount),
        elevation: 0,
      ),
      body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: Strings.name,
                      hintText: Strings.enterYourName,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.pleaseEnterName;
                      } else {
                        return null;
                      }
                    },
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
                      if (value!.isEmpty) {
                        return Strings.pleaseEnterEmail;
                      }
                      if (emailRegex.hasMatch(value)) {
                        return null;
                      }
                      return Strings.pleaseEnterValidEmail;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.phone_outlined),
                      labelText: Strings.phone,
                      hintText: Strings.enterYourPhone,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                      LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.pleaseEnterPhoneNumber;
                      }
                      if (phoneRegex.hasMatch(value)) {
                        return null;
                      }
                      return Strings.pleaseEnterValidPhoneNumber;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    key: _passwordFieldKey,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.key_outlined),
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
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Icon(Icons.key_outlined),
                      labelText: Strings.conformPassword,
                      hintText: Strings.enterYourConformPassword,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.passwordIsRequired;
                      }
                      if (value != _passwordFieldKey.currentState!.value) {
                        return Strings.passwordDoNotMatch;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) {
                    if (state is AuthenticationSuccess) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardPage()));
                    } else if (state is AuthenticationLoadError) {
                      Fluttertoast.showToast(msg: Strings.signUpFailed);
                    }
                  }, builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              Strings.register,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();
                            BlocProvider.of<AuthenticationCubit>(context)
                                .registerWithEmailPassword(email, password);
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
