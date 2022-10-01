import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_stop/views/home.dart';

void main() {
  runApp(const WallpaperStop());
}

class WallpaperStop extends StatelessWidget {
  const WallpaperStop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Wallpaper App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
