import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/widget/arrow_button.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';

class RateScrean extends StatelessWidget {
  const RateScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundVioletblue(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ArrowButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              const Spacer(),
              Text("Done", style: AppFonts.size48),
              const SizedBox(height: 48,),

              Image.asset("assets/images/done.png",height: 200,),
          const SizedBox(height: 48,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<5;i++)
                  const Icon(Icons.star,color: Colors.white,size: 50,),

                ],
              ),
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
