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
        title: const Text('Create a new account'),
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
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: Strings.name,
                      hintText: Strings.enterYourName,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: Strings.email,
                      hintText: Strings.enterYourEmail,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      if (emailRegex.hasMatch(value)) {
                        return null;
                      }
                      return 'Please enter valid email';
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: Strings.phone,
                      hintText: Strings.enterYourPhone,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                      LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone number';
                      }
                      if (phoneRegex.hasMatch(value)) {
                        return null;
                      }
                      return "Please enter a valid phone number";
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    key: _passwordFieldKey,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.security),
                      labelText: Strings.password,
                      hintText: Strings.enterYourPassword,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.compare),
                      labelText: Strings.conformPassword,
                      hintText: Strings.enterYourConformPassword,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value != _passwordFieldKey.currentState!.value) {
                        return 'Password do not match';
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
                      Fluttertoast.showToast(msg: "Sign_up failed");
                    }
                  }, builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            Strings.register.toUpperCase(),
                            style: const TextStyle(
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
