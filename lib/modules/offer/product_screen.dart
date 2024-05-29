import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/qr_scanner/qr_generator.dart';
import 'package:ms/modules/widget/custom_sheet.dart';
import 'package:ms/modules/widget/global_appbar.dart';
import 'package:ms/modules/widget/product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.data, required this.title});
  final List data;
  final String title;

  @override
  Widget build(BuildContext context) {
    // Filter the data to only include items with the same title
    final filteredData = data.where((item) => item['subCate'] == title).toList();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: GlobalAppBar(
            title: title,
            color: AppColor.yellow,
          ),
        ),
        backgroundColor: AppColor.yellow,
        body: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/fireworks.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    'Enjoy 30% with us',
                    style: AppFonts.size25.copyWith(color: Colors.black),
                  ),
                  Image.asset(
                    'assets/images/fireworks.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: filteredData.length,
                itemBuilder: (context, index) => ProductItem(
                  onTap: () {},
                  onAdd: () {
                    Get.to(() => GenerateQR(
                      dataToGenrate: filteredData[index]['codeQr'],
                    ));
                  },
                  color: Colors.white,
                  textColor: AppColor.violetBlueDark,
                  title: filteredData[index]['name'],
                  price: 4.5,
                  url: filteredData[index]['image'],
                  description: filteredData[index]['desc'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

