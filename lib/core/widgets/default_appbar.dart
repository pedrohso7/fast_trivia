import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/image_path.dart';
import '../constants/sizes.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.yellow,
      leading: const Padding(
        padding: EdgeInsets.all(AppSizes.s8),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: Icon(
            Icons.account_balance,
            color: AppColors.yellow,
          ),
        ),
      ),
      centerTitle: true,
      title: Image.asset(
        AppImages.brainLogoPath,
        fit: BoxFit.contain,
        width: AppSizes.s64,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
