import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/home/home_layout.dart';

import 'package:ms/modules/offer/vendor_screen.dart';
import 'package:ms/modules/organize/organize_layout.dart';
import 'package:ms/modules/save_money_category/componant/card_type.dart';
import 'package:ms/modules/widget/arrow_button.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';

import 'package:ms/modules/widget/logo.dart';

class OfferLayout extends StatelessWidget {
  final bool isOrganizer;
  const OfferLayout({super.key, this.isOrganizer = false});

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
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      children: [
                        CardsType(
                          onTap: () {
                            if (isOrganizer) {
                              Get.to(() => const OrganizeLayout(
                                title: 'Restaurant', title1: 'Offers', subCat: 'Restaurant',
                              ));
                            } else {
                              Get.to(() => VendorScreen(
                                    title: 'Restaurant',
                                  title1: 'Offers', subCat: 'Restaurant',
                                    screenColor: HexColor('#E7F499'),
                                  ));
                            }
                            //     QrcodeScannerTrait().openScanner(context);
                          },
                          icon: Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              AppImages.rostroant,
                              width: 48,
                              height: 48,
                            ),
                          ),
                          color: AppColor.yellow,
                          textColor: AppColor.violetBlueDark,
                          title: 'Restaurant',
                          description:
                              'choose delicious food at affordable prices',
                        ),
                        CardsType(
                          onTap: () {
                            if (isOrganizer) {
                              Get.to(() => const OrganizeLayout(
                                title: 'Shops', title1: 'Offers', subCat: 'Shops',

                              ));
                            } else {
                              Get.to(() => VendorScreen(
                                    title: 'Shops', title1: 'Offers', subCat: 'Shops',
                                    screenColor: HexColor('#E2B4F2'),
                                  ));
                            }
                            //     QrcodeScannerTrait().openScanner(context);
                          },
                          icon: Container(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                AppImages.shops,
                                width: 48,
                                height: 48,
                              )),
                          color: Colors.white,
                          textColor: AppColor.violetBlueDark,
                          title: 'Shops',
                          description:
                              'we offer you great deals and discounts happy shopping!',
                        ),
                        CardsType(
                          onTap: () {
                            if (isOrganizer) {
                              Get.to(() => const OrganizeLayout(
                                title: 'School supplies', title1: 'Offers', subCat: 'School_supplies',

                              ));
                            } else {
                              Get.to(() => VendorScreen(
                                    title: 'School supplies', title1: 'Offers', subCat: 'School_supplies',
                                    screenColor: HexColor('#91DACD'),
                                  ));
                            }
                            //     QrcodeScannerTrait().openScanner(context);
                          },
                          icon: Container(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                AppImages.books,
                                width: 48,
                                height: 48,
                              )),
                          color: AppColor.violeteaccent,
                          textColor: AppColor.violetBlueDark,
                          title: 'School supplies',
                          description: 'everything you need,we have it!',
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
