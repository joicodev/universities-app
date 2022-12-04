import 'package:flutter/material.dart';
import 'package:universities_app/extensions/context_extensions.dart';

class AppStyles {
  static TextStyle textStyleButton(
    BuildContext context, [
    bool whiteText = true,
  ]) {
    return AppStyles.textStyleCustom(
      context,
      fontWeight: FontWeight.w600,
      fontSize: AppFontSizes.medium,
      color: whiteText ? Colors.white : context.primaryColor,
    );
  }

  // Text style for paragraph text with primary color.
  static TextStyle textStyleCustom(
    BuildContext context, {
    Color? color,
    double? height,
    double? fontSize,
    TextDecorationStyle? decorationStyle,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      height: height,
      decoration: decoration,
      decorationStyle: decorationStyle,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? AppFontSizes.medium,
      color: color ?? context.primaryColorDark,
    );
  }
}

class AppFontSizes {
  static const smallest = 12.0;
  static const small = 14.0;
  static const medium = 16.0;
  static const larger = 24.0;
}
