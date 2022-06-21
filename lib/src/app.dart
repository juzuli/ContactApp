import 'package:contact_app/src/bloc/authentication/authentication_cubit.dart';
import 'package:contact_app/src/bloc/authentication/authentication_repository.dart';
import 'package:contact_app/src/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  static const String title = 'Light & Dark Theme';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return BlocProvider(
          create: (context) => AuthenticationCubit(AuthRepository()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Contact App',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const LoginPage(),
          ),
        );
      });
}
