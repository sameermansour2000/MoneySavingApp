import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/organize/organize_layout.dart';
import 'package:ms/modules/save_money_category/SaveMoneyLayout.dart';
import 'package:ms/modules/widget/arrow_button.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';
import 'package:ms/modules/widget/custom_button.dart';
import '../organize/DTPaymentScreen.dart';
import 'Componant/supxcription_item.dart';

class SubScriptionLayout extends StatelessWidget {
  const SubScriptionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundVioletblue(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ArrowButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text('Subscription', style: AppFonts.size48)),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                itemCount: 5,
                itemBuilder: (context, index) => SubScriptionItem(
                  title: '\$24.99/3months',
                  onPressed: (subScriptionId) {},
                  subScriptionId: '1234',
                ),
              )),
              CustomTextButton(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  hight: 54,
                  text: 'Continue',
                  onPressed: () {
                    //todo nav to payment
                   // Get.to(() => SaveMoneyLayout());
                    Get.to(()=>const DTPaymentScreen(

                    ));
                  },
                  color: AppColor.VioletVLueOpc_20,
                  textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
