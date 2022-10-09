import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:wallpaper_stop/controller/popup_controller.dart';

import 'package:wallpaper_stop/model/wallpaper_model.dart';
import 'package:wallpaper_stop/views/image_view.dart';

Widget brandName(context, String title) {
  return title != ''
      ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              title.toUpperCase(),
            ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Wallpapers ",
            ),
            Text(
              "Stop",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        );
}

class WallpapersList extends StatelessWidget {
  WallpapersList({super.key, required this.wallpapers});
  List<WallpaperModel> wallpapers;
  final PopUpController _popUpController = Get.put(PopUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ImageView(imgPath: wallpaper.src!.portrait),
                  ),
                );
              },
              onLongPress: () async {
                _popUpController.longPressPreview = true;
                _popUpController.animationController.forward();
                _popUpController.popupDialog =
                    _createPopupDialog(wallpaper.src!.portrait);
                Overlay.of(context)!.insert(_popUpController.popupDialog);
              },
              onLongPressEnd: (details) {
                _popUpController.animationController.reverse();
                _popUpController.longPressPreview = false;
                _popUpController.popupDialog.remove();
              },
              child: Hero(
                tag: wallpaper.src!.portrait,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    wallpaper.src!.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

// create Overlay
  OverlayEntry _createPopupDialog(String imageUrl) {
    return OverlayEntry(
      builder: (context) => Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.11,
        color: Colors.black.withOpacity(0.6),
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: _popUpController.animationController,
            curve: const Interval(0.0, 0.5, curve: Curves.ease),
          ),
          child: Dialog(
            child: imageModal(imageUrl),
          ),
        ),
      ),
    );
  }
}

Widget imageModal(String url) {
  return Wrap(
    children: [
      CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.fill,
      ),
    ],
  );
}
