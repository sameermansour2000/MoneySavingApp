import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/organize/product_create.dart';
import 'package:ms/modules/organize/widget/own_products.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';

class OrganizeLayout extends StatelessWidget {
  final String title;
  final String title1;
  final String subCat;
  const OrganizeLayout({super.key,required this.title, required this.title1, required this.subCat});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundVioletblue(
          child: Column(
            children: [
              const SizedBox(height: 8,),
              Text(title,style: AppFonts.size25.copyWith(color: Colors.white),),
             const SizedBox(height: 8,),
               Expanded(child: OwnProducts(title1:title1, subCat: subCat,)),
            ],
          ),
      
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(
              () => ProductCreate(
                title: 'Create $title', title1: title1, subCat: subCat,
              ),
            );
          },
          backgroundColor: AppColor.violeteaccent,
          child: const Icon(Icons.add,),
        ),
      ),
    );
  }
}
