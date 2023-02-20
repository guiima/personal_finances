import 'package:flutter/material.dart';
import 'package:personal_finances/src/styles/app_colors.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool haveArrowBAck;

  const AppBarComponent({
    super.key,
    required this.title,
    this.haveArrowBAck = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: haveArrowBAck
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: AppColors.secondaryColor,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
