import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/core/theme/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.of(context);
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(themeController.isDark ? Icons.nightlight_round : Icons.sunny),
        onPressed: () => themeController.toggleTheme(),
      ),
      actions: actions,
    );
  }
}
