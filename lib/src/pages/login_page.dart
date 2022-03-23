import 'package:contact_app/src/constants/strings.dart';
import 'package:contact_app/src/pages/dashboard_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                const Icon(Icons.login,size: 80,),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Login into your account',
                  style: TextStyle(color: Colors.grey),
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
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Please enter email';
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.security),
                    labelText: Strings.password,
                    hintText: Strings.enterYourPassword,
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter password';
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
                            builder: (context) => const ForgotPasswordPage()),
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
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      Strings.signIn.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardPage()));
                    }else{
                      print('Error');
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Text.rich(TextSpan(children: [
                    const TextSpan(text: Strings.dontHaveAccount),
                    TextSpan(
                      text: Strings.create,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        },
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      // color: Theme.of(context).accentColor),
                    ),
                  ])),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
