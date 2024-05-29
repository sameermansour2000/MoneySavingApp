import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../rate_screan.dart';

class GenerateQR extends StatefulWidget {
   final String dataToGenrate;

   GenerateQR({required this.dataToGenrate});

  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {

  String qrData='';
  initState() {
    qrData = widget.dataToGenrate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColor.violetBlueDark,
      body: Container(
        //flex: 5,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,

            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QrImageView(data: qrData),

                //TextField for input link
                Align(
                    alignment: Alignment.bottomCenter,
                    child:InkWell(
                      onTap: (){
                        Get.to(RateScrean());
                      },
                      child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.VioletVLueOpc_20,

                          ),
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),

                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,

                            children: [
                              Image.asset('assets/images/scanningIcon.png'),
                              const Spacer(),
                              Text('scan your QR Code ',textAlign: TextAlign.center,
                                style: AppFonts.size25.copyWith(color: AppColor.violetBlueDark),),
                              const Spacer(),

                            ],
                          )

                        //.expand()
                      ),
                    )

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
