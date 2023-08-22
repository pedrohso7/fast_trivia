import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/image_path.dart';
import '../constants/sizes.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool withBackButton;
  final VoidCallback? onPressBackButton;
  const DefaultAppbar({
    Key? key,
    this.withBackButton = true,
    this.onPressBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: Padding(
        padding: const EdgeInsets.all(AppSizes.s8),
        child: (withBackButton == true)
            ? IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: AppSizes.s32,
                ),
                onPressed: onPressBackButton,
              )
            : const CircleAvatar(
                backgroundColor: AppColors.white,
                child: Icon(
                  Icons.emoji_objects,
                  color: AppColors.primaryColor,
                ),
              ),
      ),
      centerTitle: true,
      title: Image.asset(
        AppImages.logoPath,
        fit: BoxFit.contain,
        width: AppSizes.s144,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
