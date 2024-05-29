import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/widget/custom_button.dart';

class SupScriptionList extends StatelessWidget {
  const SupScriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 18),
      itemCount: 12,
      itemBuilder: (context, index) =>CustomTextButton(
          hight: 115,
          text: 'SupScription text',
          onPressed: (){},
          color: AppColor.VioletVLueOpc_20,
          textColor: Colors.white),);
  }
}
