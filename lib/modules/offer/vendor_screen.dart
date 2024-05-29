import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/offer/product_screen.dart';
import 'package:ms/modules/widget/custom_search_bar.dart';
import 'package:ms/modules/widget/custom_sheet.dart';
import 'package:ms/modules/widget/global_appbar.dart';
import 'package:ms/modules/widget/vendor_card.dart';

class VendorScreen extends StatelessWidget {
  final Color? screenColor;
  final String? title;
  final String title1;
  final String subCat;
  const VendorScreen(
      {super.key,
      this.screenColor,
      this.title,
      required this.title1,
      required this.subCat});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: GlobalAppBar(
              title: title ?? '',
              color: this.screenColor ?? AppColor.yellow,
            ),
          ),
          backgroundColor: this.screenColor ?? AppColor.yellow,
          body: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const CustomSearchBar(),
              const SizedBox(
                height: 16,
              ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(title1)
                .doc(subCat)
                .collection('data')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
              Set<String> uniqueSubCategories = {};

              var uniqueData = categoryData.where((doc) {
                var subCate = doc['subCate'];
                if (uniqueSubCategories.contains(subCate)) {
                  return false;
                } else {
                  uniqueSubCategories.add(subCate);
                  return true;
                }
              }).toList();

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: uniqueData.length,
                itemBuilder: (context, index) {
                  var document = uniqueData[index];
                  return VendorCard(
                    onTap: () {
                      // todo if student
                      Get.to(() => ProductScreen(data: categoryData, title: document['subCate'],));
                      // todo if organize
                    },
                    onNotifie: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (ctx) => CustomDialog(
                          title: 'Hurry up!',
                          textBody:
                          "If you are looking for a career, this could be the perfect opportunity for you.",
                          body: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Spacer(),
                              Text(
                                'Happy Savings!!!',
                                style: AppFonts.size25.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                'assets/images/fireworks.png',
                                width: 40,
                                height: 50,
                              ),
                              const Spacer(),
                            ],
                          ),
                          onNext: () {
                            // todo when click arrow
                          },
                          onClose: () {
                            // todo Close dialog
                          },
                        ),
                      );
                    },
                    onAdd: () {},
                    locationUrl: 'o',
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
                    title: document['subCate'],
                    rate: 4.5,
                    url:
                    'https://cdn-icons-png.flaticon.com/512/859/859331.png',
                    description: document['subCate'],
                    lat: document['lat'],
                    long: document['long'],
                  );
                },
              );
            },
          ),
        )

        ],
          )),
    );
  }
}
