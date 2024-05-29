import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'custom_cached_image.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String url;
  final double price;

  final String description;
  final Color color;
  final Color textColor;
  final void Function()? onAdd;
  final void Function()? onTap;
  final void Function()? onEdit;

  const ProductItem(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      required this.textColor,
      this.onTap,
      required this.price,
      required this.url, this.onAdd, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        height: 105,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: CustomCashedImage(
                      url: url,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    width: MediaQuery.of(context).size.width * 2 / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppFonts.size25.copyWith(color: textColor),
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: AppFonts.size14.copyWith(color: textColor),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(onAdd!=null) IconButton(
                    onPressed: onAdd,
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    ),
                  ),
                  if(onEdit!=null) IconButton(
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '$price jd',
                    style: AppFonts.size14.copyWith(color: textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
