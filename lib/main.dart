import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_stop/helper/colors_code.dart';
import 'package:wallpaper_stop/views/home.dart';

void main() {
  runApp(WallpaperStop());
}

class WallpaperStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Wallpapers Stop',
      home: Home(),
    );
  }
}
