import 'package:flutter/material.dart';
import 'package:common_jds_flutter/common/app_colors.dart';
import 'package:common_jds_flutter/common/styles/app_text_style.dart';
import 'package:common_jds_flutter/common/styles/dimens.dart';
import 'package:common_jds_flutter/common/extensions/border_radius_extension.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme {
    final inputBorder = 16.outlineInputBorder(
      borderSide: 3.0.borderSide(),
    );

    final hintStyle = AppTextStyle.semiBoldStyle.copyWith(
      color: AppColors.doveGray,
      fontSize: Dimens.size14,
    );

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.kPrimaryColor,
      splashColor: Colors.transparent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        color: AppColors.kPrimaryColor,
      ),
      scaffoldBackgroundColor: AppColors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.kPrimaryColor,
        height: 45,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: 23.borderRadius,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(.14);
              }

              return null;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (_) => AppTextStyle.buttonTextStyle,
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.doveGray;
              }
              return null;
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(.14);
              }

              return null;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (_) => AppTextStyle.buttonTextStyle,
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      textTheme: TextTheme(
        titleMedium: AppTextStyle.regularStyle.copyWith(
          color: AppColors.mineShaft,
          fontSize: Dimens.size14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        prefixStyle: AppTextStyle.regularStyle.copyWith(
          fontSize: Dimens.size14,
          color: AppColors.black,
        ),
        hintStyle: hintStyle,
        labelStyle: hintStyle,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: 10.borderRadius,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: 20.borderRadius,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.kPrimaryColor,
      ),
    );
  }
}
