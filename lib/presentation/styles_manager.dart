import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tech/presentation/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color){
   return TextStyle(fontFamily: fontFamily, color: color, fontWeight: fontWeight);
}

// regular style
TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color, }){
    return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// light style
TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color, }){
    return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

// bold style
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color, }){
    return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// semi style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, required Color color, }){
    return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// medium style
TextStyle getMediumStyle({double fontSize = FontSize.s12, required Color color, }){
    return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}