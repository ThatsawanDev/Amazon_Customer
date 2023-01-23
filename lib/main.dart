import 'package:amazon_customer/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(CustomerApp());
}

class CustomerApp extends StatelessWidget {
  final AppRouter router = AppRouter();
  CustomerApp({super.key});

  final Color _primaryColor = HexColor('#162C26');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Amazon Customer App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('th') // Thailand
      ],
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: HexColor('#233831'),
        fontFamily: 'SukhumvitSet-Medium',
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'SukhumvitSet-SemiBold',
            fontSize: 18,
            color: HexColor('#E2E0D8'),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      // home: const HomePage(),
    );
  }
}
