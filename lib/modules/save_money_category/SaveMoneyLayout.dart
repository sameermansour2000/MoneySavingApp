import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/home/home_layout.dart';
import 'package:ms/modules/jobs_seeker/job_list.dart';
import 'package:ms/modules/offer/offers_layout.dart';
import 'package:ms/modules/organize/organize_layout.dart';
import 'package:ms/modules/subscription_vendors/subscription_vendor.dart';
import 'package:ms/modules/widget/arrow_button.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';
import 'package:ms/modules/widget/logo.dart';
import 'componant/card_type.dart';

class SaveMoneyLayout extends StatelessWidget {
  final isOrgnizer;
  const SaveMoneyLayout({super.key, this.isOrgnizer = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundVioletblue(
          child: Column(
            children: [
              const SizedBox(
                height: 34,
              ),
              const Logo(),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 34, horizontal: 16),
                  child: Text(
                    'what are you looking to save money on?',
                    style: AppFonts.size25,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      children: [
                        CardsType(
                          onTap: () {
                            Get.to(() => OfferLayout(
                                  isOrganizer: isOrgnizer,
                                ));

                            //     QrcodeScannerTrait().openScanner(context);
                          },
                          icon: Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              AppImages.offers,
                              width: 48,
                              height: 48,
                            ),
                          ),
                          color: AppColor.blue,
                          textColor: AppColor.violetBlueDark,
                          title: 'Offers',
                          description: 'get many different offers',
                        ),
                        CardsType(
                          onTap: () {
                            if (isOrgnizer) {
                              Get.to(() => const OrganizeLayout(
                                    title: 'SubScription', title1: 'SubScription', subCat: '',
                                  ));
                            } else {
                              Get.to(() => const SubscriptionVendorScreen(title1: 'SubScription',));
                            }
                            //     QrcodeScannerTrait().openScanner(context);
                          },
                          icon: Container(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                AppImages.subscription,
                                width: 48,
                                height: 48,
                              )),
                          color: Colors.white,
                          textColor: AppColor.violetBlueDark,
                          title: 'Subscription',
                          description:
                              'yes! my gym membership is expensive but so are your CIGARETS and MEDICAL TABS',
                        ),
                        CardsType(
                          onTap: () {
                            if (isOrgnizer) {
                              Get.to(() => const OrganizeLayout(
                                    title: 'Available job', title1: 'Available_job', subCat: '',
                                  ));
                            } else {
                              Get.to(() => const JobSeeker(title1: 'Available_job',));
                            }
                          },
                          icon: Container(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                AppImages.jobseeker,
                                width: 48,
                                height: 48,
                              )),
                          color: AppColor.violeteaccent,
                          textColor: AppColor.violetBlueDark,
                          title: 'Available job',
                          description:
                              'never too old to set another goal or to dream a new dream',
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ArrowButton(
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
