import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/basic_import.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.title, {
    super.key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = true,
    this.centerTitle = true,
    this.isWhite = false,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
    this.leadingWidth,
  });

  final String title;
  final Color? backgroundColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final bool isWhite;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent, // Make status bar transparent
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarBrightness: Brightness.light, // For iOS (black text)
      ),
      centerTitle: centerTitle,
      title: TextWidget(
        title,
        color: isWhite ? Colors.white : null,
      ),
      actions: action,
      leading: showBackButton
          ? leading ??
              BackButtonWidget(
                onTap: () {
                  Get.close(1);
                },
                isWhite: isWhite,
              )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? Colors.transparent,
      automaticallyImplyLeading: autoLeading,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appbarSize ?? Dimensions.appBarHeight);
}
