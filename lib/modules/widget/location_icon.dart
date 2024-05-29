import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'custom_map.dart';


class LocationIcon extends StatelessWidget {
  final double lat;
  final double long;
  final Function()? ontap;
  const LocationIcon({super.key, required this.lat, required this.long, this.ontap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        print('11111111111');
        print(lat);
        print(long);
        //todo open map
        if(ontap!=null)ontap!();
       Get.to(()=>CustomMap(marks: [LatLng(lat, long),],)) ;
      },
      child: const Icon(Icons.location_on_outlined),
    );
  }
}
