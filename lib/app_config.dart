const String highSchool = 'assets/hight_school.jpg';

class AppConfig {
  final String appName;
  final String appVersion;
  final String urlJsonUniversities;

  AppConfig._(this.appName, this.appVersion, this.urlJsonUniversities);

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig._(
      json["appName"],
      json["appVersion"],
      json["urlJsonUniversities"],
    );
  }
}
