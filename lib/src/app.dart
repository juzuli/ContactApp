import 'package:contact_app/src/bloc/authentication/authentication_cubit.dart';
import 'package:contact_app/src/bloc/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(AuthRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact App',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}