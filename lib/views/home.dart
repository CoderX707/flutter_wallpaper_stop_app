import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:wallpaper_stop/config/config.dart';
import 'package:wallpaper_stop/helper/category_helper.dart';
import 'package:wallpaper_stop/helper/colors_code.dart';
import 'package:wallpaper_stop/helper/constants.dart';
import 'package:wallpaper_stop/model/category_model.dart';
import 'package:wallpaper_stop/model/wallpaper_model.dart';
import 'package:wallpaper_stop/views/category.dart';
import 'package:wallpaper_stop/views/search.dart';
import 'package:wallpaper_stop/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  bool _loading = true;

  TextEditingController searchController = TextEditingController();

  Future getTrendingWallpapers() async {
    var response =
        await http.get(url, headers: {"Authorization": pexelsApiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.forMap(element);
      wallpapers.add(wallpaperModel);
    });
    _loading = false;
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories()!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: brandName(''),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            // Search Box
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search wallpapers",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              searchQuery: searchController.text,
                            ),
                          ));
                    },
                    child: const Icon(
                      Icons.search,
                    ),
                  )
                ],
              ),
            ),

            // Category Section
            SizedBox(
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryName: categories[index].categoryName,
                    imgUrl: categories[index].imageUrl,
                  );
                },
              ),
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

class CategoryCard extends StatelessWidget {
  final String imgUrl, categoryName;
  CategoryCard({super.key, required this.categoryName, required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Category(
                categoryName: categoryName.toLowerCase(),
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 50,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 110,
              decoration: BoxDecoration(
                color: const Color.fromARGB(82, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
