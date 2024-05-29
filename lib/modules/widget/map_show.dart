
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/widget/custom_button.dart';
import 'custom_map.dart';

class FlutterOpenStreetMap extends StatefulWidget {
    LatLng? center;
  final void Function(LatLng latlng)? onPicked;
    List<LatLng>? marks;
  final Color? primaryColor;
  final bool? showZoomButtons;

   FlutterOpenStreetMap(
      {Key? key,
       this.center,
      required this.onPicked,
      this.primaryColor,
        this.marks,
      this.showZoomButtons})
      : super(key: key);

  @override
  State<FlutterOpenStreetMap> createState() => _FlutterOpenStreetMapState();
}

class _FlutterOpenStreetMapState extends State<FlutterOpenStreetMap> {
  MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();


  void setNameCurrentPos() async {

    double latitude = _mapController.center.latitude;
    double longitude = _mapController.center.longitude;
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }
    setState(() {});
  }

  void setNameCurrentPosAtInit() async {
    if(widget.center ==null){


    await currentLocation.then((value) {
      widget.center =value!;
    });
    }
    double latitude = widget.center!.latitude;
    double longitude = widget.center!.longitude;
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }
  }

  @override
  void initState() {
    _mapController = MapController();

    // _mapController.onReady.then((_) {
       setNameCurrentPosAtInit();
    // });

    _mapController.mapEventStream.listen((event) async {
      if (event is MapEventMoveEnd) {

       // String url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=${event.center.latitude}&lon=${event.center.longitude}&zoom=18&addressdetails=1';




        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final showZoom = widget.showZoomButtons ?? false;

    // String? _autocompleteSelection;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: FlutterMap(

              options: MapOptions(
                  center: LatLng(widget.center!.latitude, widget.center!.longitude),
                  zoom: 15.0,
                  maxZoom: 18,
                  minZoom: 6

              ),
              mapController: _mapController,
              children: [
                  TileLayer(
                  urlTemplate:
                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],

                  // attributionBuilder: (_) {
                  //   return Text("© OpenStreetMap contributors");
                  // },
                ),
              if(widget.marks?.isNotEmpty??false)  MarkerLayer(
                  markers: [
                    for(LatLng x in widget.marks!)Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(x.latitude, x.longitude),
                      child:  const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],

              // layers: [
              //   TileLayerOptions(
              //     urlTemplate:
              //         "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              //     subdomains: ['a', 'b', 'c'],
              //     // attributionBuilder: (_) {
              //     //   return Text("© OpenStreetMap contributors");
              //     // },
              //   ),
              // ],
            )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: Center(
                    child: StatefulBuilder(builder: (context, setState) {
                      return Text(
                        _searchController.text,
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                )),
            const Positioned.fill(
              top: 10,
              child: Icon(
                Icons.location_pin,
                size: 50,
              ),
            ),
            if (showZoom)
              Positioned(
                  bottom: 140,
                  right: 5,
                  child: FloatingActionButton(
                    heroTag: 'zoomin',
                    backgroundColor: AppColor.violetBlueDark,
                    onPressed: () {
                      _mapController.move(
                          _mapController.center, _mapController.zoom + 1);
                    },
                    child: const Icon(Icons.add,color: Colors.white,),
                  )),
            if (showZoom)
              Positioned(
                  bottom: 80,
                  right: 5,
                  child: FloatingActionButton(
                    heroTag: 'zoomout',
                    backgroundColor: AppColor.violetBlueDark,
                    onPressed: () {
                      _mapController.move(
                          _mapController.center, _mapController.zoom - 1);
                    },
                    child: const Icon(Icons.remove,color: Colors.white,),
                  )),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     margin: const EdgeInsets.all(15),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Column(
            //       children: [
            //         TextFormField(
            //             controller: _searchController,
            //             focusNode: _focusNode,
            //             decoration: InputDecoration(
            //               hintText: 'Search Location',
            //               border: inputBorder,
            //               focusedBorder: inputFocusBorder,
            //             ),
            //             onChanged: (String value) {
            //               if (_debounce?.isActive ?? false) _debounce?.cancel();
            //
            //               _debounce =
            //                   Timer(const Duration(milliseconds: 2000), () async {
            //                 if (kDebugMode) {
            //                   print(value);
            //                 }
            //
            //                 try {
            //                   String url =
            //                       'https://nominatim.openstreetmap.org/search?q=$value&format=json&polygon_geojson=1&addressdetails=1';
            //                   if (kDebugMode) {
            //                     print(url);
            //                   }
            //
            //                   if (kDebugMode) {
            //                    // print(decodedResponse);
            //                   }
            //
            //                   setState(() {});
            //                 } finally {
            //
            //                 }
            //
            //                 setState(() {});
            //               });
            //             }),
            //         StatefulBuilder(builder: ((context, setState) {
            //           return ListView.builder(
            //               shrinkWrap: true,
            //               physics: const NeverScrollableScrollPhysics(),
            //               itemCount: _options.length > 5 ? 5 : _options.length,
            //               itemBuilder: (context, index) {
            //                 return ListTile(
            //                   title: Text(_options[index].displayname),
            //                   subtitle: Text(
            //                       '${_options[index].lat},${_options[index].lon}'),
            //                   onTap: () {
            //                     _mapController.move(
            //                         LatLng(
            //                             _options[index].lat, _options[index].lon),
            //                         15.0);
            //
            //                     _focusNode.unfocus();
            //                     _options.clear();
            //                     setState(() {});
            //                   },
            //                 );
            //               });
            //         })),
            //       ],
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          textColor: Colors.white,
                        
                          text: 'Recheck ', onPressed: () async {
                          await currentLocation.then((value) {
                        
                            widget.center = LatLng(value!.latitude, value!.longitude);
                        
                          });
                          _mapController.move(
                              LatLng(widget.center!.latitude,widget.center!.longitude),
                              _mapController.zoom);
                        
                          print('lat=${_mapController.center.latitude}&lon=${_mapController.center.longitude}');
                          String url =
                              'https://nominatim.openstreetmap.org/reverse?format=json&lat=${_mapController.center.latitude}&lon=${_mapController.center.longitude}&zoom=18&addressdetails=1';
                          print(url);
                        
                              //
                               _mapController.move(LatLng(widget.center!.latitude,widget.center!.longitude), 1);
                              //                   _searchController.text = decodedResponse['display_name'];
                              //                   setState(() {});
                        },  color: AppColor.violetBlueDark,),
                      ),
                      const SizedBox(width: 10,),
                     if( widget.onPicked!=null) Expanded(
                        child: CustomTextButton(
                          textColor: Colors.white,
                        
                          text: 'pick', onPressed: () async {
                          widget.onPicked!(_mapController.center,);
                        },  color: AppColor.violetBlueDark,),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}





