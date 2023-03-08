import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tech/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_mvvm_tech/presentation/login/login.dart';
import 'package:flutter_mvvm_tech/presentation/main/main_view.dart';
import 'package:flutter_mvvm_tech/presentation/onboarding/onboarding.dart';
import 'package:flutter_mvvm_tech/presentation/register/register.dart';
import 'package:flutter_mvvm_tech/presentation/resources/strings_manager.dart';
import 'package:flutter_mvvm_tech/presentation/splash/splash.dart';
import 'package:flutter_mvvm_tech/presentation/store_details/store_details.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}
class RouteGenerator{
   static Route<dynamic> getRoute(RouteSettings routeSettings){
     switch(routeSettings.name){
       case Routes.splashRoute: return MaterialPageRoute(builder: (_) => SplashView());
       case Routes.onBoardingRoute: return MaterialPageRoute(builder: (_) => OnBoardingView());
       case Routes.loginRoute: return MaterialPageRoute(builder: (_) => LoginView());
       case Routes.registerRoute: return MaterialPageRoute(builder: (_) => RegisterView());
       case Routes.forgotPasswordRoute: return MaterialPageRoute(builder: (_) => ForgotPasswordView());
       case Routes.mainRoute: return MaterialPageRoute(builder: (_) => MainView());
       case Routes.storeDetailsRoute: return MaterialPageRoute(builder: (_) => StoreDetailsView());
       default: return UnDefinedRoute();
     }
   }
   static Route<dynamic> UnDefinedRoute(){
     return MaterialPageRoute(builder: (_) => Scaffold(
       appBar: AppBar(title: const Text(AppStrings.notRouteFound),),
       body: const Text(AppStrings.notRouteFound),
     ));
   }
}
