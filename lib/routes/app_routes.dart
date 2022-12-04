import 'package:flutter/material.dart';
import 'package:universities_app/models/entities/university.dart';
import 'package:universities_app/pages/home/home_page.dart';
import 'package:universities_app/pages/universities/university_detail.dart';
import 'package:universities_app/routes/route_list.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.home:
        return _buildRoute(settings, (context) => const HomePage());
      case RouteList.universityDetail:
        final university = settings.arguments as University;
        return _buildRoute(
          settings,
          (context) => UniversityDetailPage(university),
        );
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings,
    WidgetBuilder builder, {
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: builder,
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route _errorRoute([String message = 'Page not founds']) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(message),
        ),
      );
    });
  }
}
