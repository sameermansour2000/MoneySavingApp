import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QrcodeScannerTrait {
  //scanning
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool flashEnabled = false;

  //
  Future<String?> openScanner(BuildContext viewContext) async {
    final result = await showDialog(
      context: viewContext,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              //qr code preview
              QRView(

                key: qrKey,
                onQRViewCreated: (QRViewController controller) {
                  this.controller = controller;
                  // controller.toggleFlash();
                  controller.scannedDataStream.listen((scanData) {
                    //close dialog
                    Get.back();
                  });
                },
              ),
              //
              Column(
                children:
                [
                  Text("Toggle Flash",style: AppFonts.size25,),
                  Switch(
                    value: flashEnabled,
                    onChanged: (value) {
                      flashEnabled = value;
                      controller?.toggleFlash();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },

      //
    );

    //
    print("Results ==> $result");
    controller?.stopCamera();
    //
    FocusScope.of(viewContext).requestFocus(FocusNode());
    return result;
  }
}
