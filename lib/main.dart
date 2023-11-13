import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app.dart';
import 'package:flutter_movie_app/core/service_locators.dart/injection_container.dart';

void main() async {
  await init();
  runApp(const MyApp());
}
