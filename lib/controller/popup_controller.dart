import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PopUpController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late bool longPressPreview = false;
  late OverlayEntry popupDialog;
  
  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    super.onInit();
  }
}
