import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/widget/location_icon.dart';

import 'custom_cached_image.dart';

class VendorCard extends StatelessWidget {
  final String title;
  final String url;
  final Widget icon;
  final double? rate;
  final double? lat;
  final double? long;
final String? locationUrl;

  final String description;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  final void Function()? onAdd;
  final void Function()? onNotifie;

  const VendorCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.description,
      required this.color,
      required this.textColor,
        this.locationUrl,
        this.onNotifie,
        this.onAdd,

      this.onTap,  this.rate, required this.url, required this.lat,required this.long});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
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
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: CustomCashedImage(url:
                    url,
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6,),
                    width: MediaQuery.of(context).size.width*2/4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 8,),
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: AppFonts.size25.copyWith(color: textColor),
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.start,
                          style: AppFonts.size14.copyWith(color: textColor),
                        ),

                      if(rate!=null)  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(rate.toString(),style: AppFonts.size14.copyWith(color: textColor),),

                            const Icon(Icons.star_rounded,color: Colors.yellow,),


                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  onNotifie!=null ? IconButton(onPressed: onNotifie, icon: const Icon(Icons.notifications_none),):const SizedBox(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                     onAdd!=null ? const Icon(Icons.person_add_outlined,): const SizedBox(),
                      LocationIcon(lat:lat!, long: long!,ontap: ()=>Navigator.of(context).pop(),),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
