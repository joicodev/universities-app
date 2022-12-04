import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universities_app/app_config.dart';
import 'package:universities_app/models/entities/university.dart';

class AppModel with ChangeNotifier {
  late AppConfig appConfig;
  bool searchingUniversities = false;
  List<University> universitiesList = [];

  AppModel._(this.appConfig);

  factory AppModel.create({
    required AppConfig appConfig,
  }) {
    return AppModel._(appConfig);
  }

  void fetchUniversities() async {
    if (!searchingUniversities) {
      searchingUniversities = true;
      notifyListeners();
      final url = Uri.parse(appConfig.urlJsonUniversities);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List rawItems = json.decode(response.body);
        for (var item in rawItems) {
          final university = University.fromJson(item);
          universitiesList.add(university);
          notifyListeners();
        }
      }

      searchingUniversities = false;
      notifyListeners();
    }
  }

  void updateUniversityPhoto(University university) {
    universitiesList = universitiesList.map((u) {
      if (university.name == u.name) {
        u.image = university.image;
      }
      return u;
    }).toList();
    notifyListeners();
  }

  void updateStudentsQuantity(University university) {
    universitiesList = universitiesList.map((u) {
      if (university.name == u.name) {
        u.students = university.students;
      }
      return u;
    }).toList();
    notifyListeners();
  }
}
