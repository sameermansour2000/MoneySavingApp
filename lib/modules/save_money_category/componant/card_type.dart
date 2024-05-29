import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_fonts.dart';

class CardsType extends StatelessWidget {
  final String title;
  final Widget icon;
  final String description;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  const CardsType({super.key, required this.title, required this.icon, required this.description, required this.color, required this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color:color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),

        ),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          height: 120,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8,),
                    Text(title,style: AppFonts.size25.copyWith(color: textColor),),
                    Text(description,style: AppFonts.size14.copyWith(color: textColor),),

                  ],
                ),
              ),

            Expanded(child: icon),
            ],
          ),
        ),
      ),
    );
  }
}
