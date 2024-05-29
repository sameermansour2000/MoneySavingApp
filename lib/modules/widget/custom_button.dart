
import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? width;
  final double? hight;
  final VoidCallback onPressed;
  final BoxBorder? boxBorder;
  final Color color;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  const CustomTextButton({super.key, this.padding,required this.text, required this.onPressed, required this.color, required this.textColor, this.width=210, this.hight=46, this.boxBorder, this.fontSize,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:padding,

      child: GestureDetector(

        onTap: onPressed,
        child: SizedBox(

          width: width,
          height: hight,

          child: Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: color,

              borderRadius: BorderRadius.circular(12.0),
              border: boxBorder,
            ),

            child: Center(
              child: Text(text,
                style:AppFonts.size25.copyWith(color: textColor,fontSize:fontSize ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
