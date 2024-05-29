import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SettingRow({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onTap,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: AppFonts.size17.copyWith(color: AppColor.violetBlueDark),),

          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
