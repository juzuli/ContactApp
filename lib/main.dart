import 'package:camera/camera.dart';
import 'package:contact_app/src/app.dart';
import 'package:contact_app/src/pages/camera_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera=await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
