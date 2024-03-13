import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZeroHeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZeroHeightAppBar({
    super.key,
    this.color = Colors.white,
    this.statusBarIsLight = true,
  });

  final Color color;
  final bool statusBarIsLight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color, // IOS status bar color
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIsLight ? Brightness.dark : Brightness.light,
        // Android status bar icons color
        statusBarBrightness: statusBarIsLight ? Brightness.light : Brightness.dark,
        // IOS status bar icons color
        statusBarColor: color, // Android status bar color
      ),
      toolbarHeight: 0,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 0);
}
