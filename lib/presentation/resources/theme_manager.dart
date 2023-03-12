import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tech/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/font_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/styles_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme(){
    return ThemeData(

        // main colors of the app
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.primaryOpacity70,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey1,
        accentColor: ColorManager.grey,
        splashColor: ColorManager.primaryOpacity70,

        // card view theme
        cardTheme: CardTheme(
            color: ColorManager.white,
            shadowColor: ColorManager.grey,
            elevation: AppSize.s4,
        ),

        //appbar theme
        appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
            titleTextStyle:getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)
        ),

        // Button theme
        buttonTheme: ButtonThemeData(
            shape: StadiumBorder(),
            disabledColor: ColorManager.grey1,
            buttonColor: ColorManager.primary,
            splashColor: ColorManager.primaryOpacity70
        ),

        //elevation button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: getRegularStyle(color: ColorManager.primary),
                primary: ColorManager.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
            )
        ),

        // Text theme
        textTheme: TextTheme(
          headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
          subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
          subtitle2: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
          bodyText1: getRegularStyle(color: ColorManager.grey),
          caption: getRegularStyle(color: ColorManager.grey1)
        ),

        // input decoration theme (text form field)
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(AppPadding.p8),
          hintStyle: getRegularStyle(color: ColorManager.grey1),
          labelStyle: getMediumStyle(color: ColorManager.darkGrey),
          errorStyle: getRegularStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppPadding.p8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppPadding.p8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppPadding.p8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppPadding.p8)),
          )
        )
    );
}