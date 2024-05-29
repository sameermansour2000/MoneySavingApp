import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';


import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRcodePage extends StatefulWidget {
  const QRcodePage({Key? key}) : super(key: key);

  @override
  _QRcodePageState createState() => _QRcodePageState();
}

class _QRcodePageState extends State<QRcodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;


  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColor.violetBlueDark,
      body: Stack(
        children: <Widget>[
          Container(
            //flex: 5,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: QRView(
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
color: AppColor.VioletVLueOpc_20,

              ),
                margin: EdgeInsets.all(16),
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),

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
                        )

          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.resumeCamera();
    log("Hello");

    this.controller = controller;
    this.controller?.resumeCamera();
    controller.scannedDataStream.listen((scanData) {

    });
  }

  @override
  void dispose() {
    this.controller?.pauseCamera();
    controller?.dispose();
    super.dispose();
  }
}
