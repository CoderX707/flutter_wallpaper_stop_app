import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper_stop/config/config.dart';
import 'package:wallpaper_stop/helper/constants.dart';
import 'package:wallpaper_stop/model/wallpaper_model.dart';
import 'package:wallpaper_stop/widgets/widgets.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  const Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = [];
  bool _loading = true;

  Future getSearchWallpapers(String query) async {
    Uri url = apiUrlByQuery(query);
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
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        title: brandName(context,widget.searchQuery),
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
