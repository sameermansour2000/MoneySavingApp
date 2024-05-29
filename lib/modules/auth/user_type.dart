import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/auth/sign_up.dart';
import 'package:ms/modules/auth/sign_up_organize.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';
import 'package:ms/modules/widget/custom_button.dart';
import 'package:ms/modules/widget/logo.dart';

class UserType extends StatelessWidget {
  UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackGroundVioletblue(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios,color: AppColor.violetBlue,size: 12,),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Logo(),
                  const Spacer(),
                  CustomTextButton(
                      hight: 54,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 46),
                      text: 'As Student',
                      onPressed: () {
                        Get.to(() => SignUp());

                      },
                      color: AppColor.VioletVLueOpc_20,
                      textColor: Colors.black.withOpacity(.8)),
                  const SizedBox(
                    height: 44,
                  ),
                  CustomTextButton(
                      hight: 54,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 46),
                      text: 'As an Organization',
                      onPressed: () {
                        Get.to(() => SignUpOrganize());
                      },
                      color: AppColor.VioletVLueOpc_20,
                      textColor: Colors.black.withOpacity(.8)),
                  const SizedBox(
                    height: 32,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
