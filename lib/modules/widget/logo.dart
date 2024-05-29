import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  const Logo({super.key, this.width= 170, this.height =160});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png',width: width,height: height,);
  }
}
