import 'package:flutter/material.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';

class BackGroundVioletblue extends StatelessWidget {
  final Widget child;
  const BackGroundVioletblue({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bg),
          fit: BoxFit.fitWidth,

        ),
        gradient: LinearGradient(
          stops: [
            0.0,
            0.5,
            1.0,
          ],
          colors: [
            Colors.black,
            AppColor.violetBlue,
            AppColor.white.withOpacity(.0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
