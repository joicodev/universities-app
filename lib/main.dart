import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universities_app/app_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load config app json
  final String jsonString = await rootBundle.loadString(
    'assets/resource/app_config.json',
  );

  final rawAppConfig = await json.decode(jsonString);
  runApp(AppInit(rawAppConfig: rawAppConfig));
}
