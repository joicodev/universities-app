import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:universities_app/app_config.dart';
import 'package:universities_app/generated/l10n.dart';
import 'package:universities_app/models/app_model.dart';
import 'package:universities_app/pages/home/home_page.dart';
import 'package:universities_app/routes/app_routes.dart';

class AppInit extends StatefulWidget {
  final Map<String, dynamic> rawAppConfig;

  const AppInit({Key? key, required this.rawAppConfig}) : super(key: key);

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> with TickerProviderStateMixin {
  late AppModel _appModel;

  @override
  void initState() {
    super.initState();
    _appModel = AppModel.create(
      appConfig: AppConfig.fromJson(widget.rawAppConfig),
    )..fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>.value(
      value: _appModel,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            localizationsDelegates: const [
              S.delegate,
              ...GlobalMaterialLocalizations.delegates,
            ],
            supportedLocales: const [Locale('en'), Locale('es')],
            localeResolutionCallback: (locale, supportedLocales) {
              print("locale ${locale?.countryCode}");
              return locale;
            },
            onGenerateRoute: AppRoutes.generateRoute,
            theme: ThemeData.light().copyWith(
              primaryColor: const Color(0xFF252C62),
              primaryColorLight: const Color(0xff888CA4),
              primaryColorDark: const Color(0xFF252C62),
              backgroundColor: const Color(0xFFD9D9D9),
              scaffoldBackgroundColor: const Color(0XFFf9f9f9),
              cardColor: const Color(0xFFF1F1F1),
            ),
          );
        },
      ),
    );
  }
}
