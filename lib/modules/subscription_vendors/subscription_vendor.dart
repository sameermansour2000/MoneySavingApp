import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/offer/product_screen.dart';
import 'package:ms/modules/widget/custom_search_bar.dart';
import 'package:ms/modules/widget/custom_sheet.dart';
import 'package:ms/modules/widget/global_appbar.dart';
import 'package:ms/modules/widget/vendor_card.dart';

class SubscriptionVendorScreen extends StatelessWidget {
  const SubscriptionVendorScreen({
    super.key,
    required this.title1,
  });
  final String title1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: GlobalAppBar(
              title: 'SUBSCRIPTION',
              color: HexColor('#F1F1F1'),
            ),
          ),
          backgroundColor: HexColor('#F1F1F1'),
          body: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomSearchBar(
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(title1)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text('No data found'),
                          );
                        }
                        var categoryData = snapshot.data!.docs;
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: categoryData.length,
                          itemBuilder: (context, index) => VendorCard(
                            onTap: () {
                              //todo if studant
                              // Get.to(()=>ProductScreen());
                              //todo if organizer
                              showAdaptiveDialog(
                                context: context,
                                builder: (ctx) => CustomDialog(
                                  title: 'Hurry up !',
                                  textBody:
                                      "enjoy 20% discount , we've got amazing deals waiting for you",
                                  body: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Spacer(),
                                      Text(
                                        'Happy Savings!!!',
                                        style: AppFonts.size25.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Image.asset(
                                        'assets/images/fireworks.png',
                                        width: 40,
                                        height: 50,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  onNext: () {
                                    //todo when click arrow
                                  },
                                  onClose: () {
                                    //todo Close dialog
                                  },
                                  // let: '0',
                                  // long: '0',
                                  // phone: "201554413005",
                                ),
                              );
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
                            color: Colors.white,
                            textColor: AppColor.violetBlueDark,
                            title: categoryData[index]['name'],
                            rate: 4.5,
                            onNotifie: () {
                              //todo when click on notifiy icon
                            },
                            onAdd: () {
                              //subScription logic
                            },
                            url:
                            categoryData[index]['image'],
                            description: categoryData[index]['desc'], lat: categoryData[index]['lat'], long: categoryData[index]['long'],
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}
