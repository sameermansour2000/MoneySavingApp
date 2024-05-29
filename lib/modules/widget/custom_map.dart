import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ms/modules/widget/arrow_button.dart';
import 'package:permission_handler/permission_handler.dart';

import 'map_show.dart';

class CustomMap extends StatefulWidget {
  late  LatLng? location;
  late  double? lat;
  late  double? long;
  final void Function(LatLng latlng)? onPicked;
  List<LatLng>? marks;
   CustomMap({super.key, this.location, this.onPicked, this.marks});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {

@override
  void initState() {
    super.initState();
    if(widget.location==null){
      currentLocation.then((value) {
        setState(() {
          widget.location = value;
        });
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            widget.location==null?const Center(child: CircularProgressIndicator(),)

                :
            FlutterOpenStreetMap(
              marks:widget.marks,

              center: LatLng(widget.location!.latitude, widget.location!.longitude),
              onPicked: widget.onPicked
              ,showZoomButtons: true,  )
            ,
            Align(
              alignment: Alignment.topLeft,
              child: ArrowButton(
                onPressed: (){
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<LatLng?> get currentLocation async{
  if (await Permission.location.isGranted) {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true,

      );
    } catch (e) {
      position = await Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: true,
      );
    }
    print('loaded location: ${position?.latitude}, ${position?.longitude}');
    return LatLng(position!.latitude, position.longitude);
  }

  print('failed to load location');

  return null;
}