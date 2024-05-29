import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';

import 'arrow_button.dart';
import 'logo.dart';

class GlobalAppBar extends StatelessWidget {
  final String title;
  final Color color;
  const GlobalAppBar({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color,
      leading:   ArrowButton(
        onPressed: (){
          Get.back();
        },
      ),
      title: Text(title,style:AppFonts.size25.copyWith(color: AppColor.violetBlueDark) ,),
   actions: const [
      Logo(
       width: 50,
       height: 50,
     ),
   ],
    );
  }
}
