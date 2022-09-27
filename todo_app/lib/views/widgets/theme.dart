import 'package:flutter/material.dart';
import 'package:todo_app/views/widgets/color_manager.dart';

ThemeData getApplicationData() => ThemeData(
    primaryColor: ColorManager.deepPrimary,
    primaryColorLight: ColorManager.deepPrimary,
    iconTheme: IconThemeData(
      color: ColorManager.iconColor,
    ));
