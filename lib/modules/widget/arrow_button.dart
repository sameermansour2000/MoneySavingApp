import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';

class ArrowButton extends StatelessWidget {
  final Function()? onPressed;
  const ArrowButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 2,),
              blurRadius: 2,
            ),
          ],
        ),

        child: IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_back_ios,color: AppColor.violetBlue,size: 16,)));
  }
}
