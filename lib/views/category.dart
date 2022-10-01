import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_stop/config/config.dart';
import 'package:wallpaper_stop/helper/colors_code.dart';
import 'package:wallpaper_stop/helper/constants.dart';
import 'package:wallpaper_stop/widgets/widgets.dart';

import '../model/wallpaper_model.dart';

class Category extends StatefulWidget {
  final String categoryName;
  Category({required this.categoryName});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallpaperModel> wallpapers = [];
  bool _loading = true;

  Future getSearchWallpapers(String query) async {
    Uri url = apiUrlByQuery(query);
    var response =
        await http.get(url, headers: {"Authorization": pexelsApiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.forMap(element);
      wallpapers.add(wallpaperModel);
    });
    _loading = false;

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        title: brandName(widget.categoryName),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // wallpapers List
            _loading
                ? const Center(child: CircularProgressIndicator())
                : WallpapersList(wallpapers: wallpapers),
          ],
        ),
      ),
    );
  }
}
