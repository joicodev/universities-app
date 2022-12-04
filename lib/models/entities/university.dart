import 'package:flutter/services.dart';

class University {
  late String alphaTwoCode;
  late List<String> domains;
  late String country;
  late String? stateProvince;
  late List<String> webPages;
  late String name;
  late int students;
  Uint8List? image;

  University({
    this.stateProvince,
    this.image,
    this.students = 0,
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    required this.webPages,
    required this.name,
  });

  University.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    country = json['country'];
    students = json['students'] ?? 0;
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    domains = json['domains'].cast<String>();
    webPages = json['web_pages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['domains'] = domains;
    data['country'] = country;
    data['students'] = students;
    data['web_pages'] = webPages;
    data['alpha_two_code'] = alphaTwoCode;
    data['state-province'] = stateProvince;
    return data;
  }
}
