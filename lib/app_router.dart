import 'package:amazon_customer/router/routing_data.dart';
import 'package:amazon_customer/views/home_page.dart';
import 'package:amazon_customer/views/new_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(route: uriData.path, queryParameters: uriData.queryParameters);
  }
}

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    //// Routing Web
    // var routingData = settings.name?.getRoutingData;
    // switch (routingData?.route) {
    var routingData = settings.name;
    switch (routingData) {
      case 'HomePage':
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 150),
          settings: settings,
        );
      case 'NewPage1':
        return PageTransition(
          child: NewPage(title: "เมนู", selectedPage: 1),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 150),
          settings: settings,
        );
      case 'NewPage2':
        return PageTransition(
          child: NewPage(title: "ออเดอร์", selectedPage: 2),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 150),
          settings: settings,
        );
      case 'NewPage3':
        return PageTransition(
          child: NewPage(title: "สาขา", selectedPage: 3),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 150),
          settings: settings,
        );
      case 'NewPage4':
        return PageTransition(
          child: NewPage(title: "ฉัน", selectedPage: 4),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 150),
          settings: settings,
        );
      default:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 150),
          settings: settings,
        );
    }
  }
}
