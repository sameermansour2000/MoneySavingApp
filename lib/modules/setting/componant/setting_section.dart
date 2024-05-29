import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';

class SettingSection extends StatelessWidget {
  final String title;
final List<Widget> children;
  const SettingSection({super.key,required this.title,required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.size17
                .copyWith(color: AppColor.VioletVLueOpc_20.withOpacity(.6)),
          ),
          ...children
        ],
      ),
    );
  }
}
