import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tech/presentation/color_manager.dart';

ThemeData getApplicationTheme(){
    return ThemeData(
        // main colors of the app
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.primaryOpacity70,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey1,
        accentColor: ColorManager.grey

        // card view theme

        // Button theme

        // Text theme

        // input decoration theme (text form field)
    );
}