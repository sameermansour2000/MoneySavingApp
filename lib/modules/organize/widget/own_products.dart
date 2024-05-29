import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/organize/product_create.dart';
import 'package:ms/modules/widget/product_item.dart';

class OwnProducts extends StatelessWidget {
  const OwnProducts({super.key, required this.title1, required this.subCat});

  final String title1;
  final String subCat;

  @override
  Widget build(BuildContext context) {
    return subCat == ''
        ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(title1)
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categoryData.length,
                itemBuilder: (context, index) => ProductItem(
                  onEdit: () {
                    Get.to(
                      () => ProductCreate(
                        title: 'Update',
                        title1: '',
                        subCat: '',
                      ),
                    );
                  },
                  color: Colors.white,
                  textColor: AppColor.violetBlueDark,
                  title: categoryData[index]['name'],
                  price: double.parse(categoryData[index]['price']),
                  url: categoryData[index]['image'],
                  description: categoryData[index]['desc'],
                ),
              );
            })
        : StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(title1)
                .doc(subCat)
                .collection('data')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categoryData.length,
                itemBuilder: (context, index) => ProductItem(
                  onEdit:null,

                  //     () {
                  //   Get.to(
                  //     () => ProductCreate(
                  //       title: 'Update',
                  //       title1: '',
                  //       subCat: '',
                  //     ),
                  //   );
                  // },
                  color: Colors.white,
                  textColor: AppColor.violetBlueDark,
                  title: categoryData[index]['name'],
                  price: double.parse(categoryData[index]['price']),
                  url: categoryData[index]['image'],
                  description: categoryData[index]['desc'],
                ),
              );
            });
  }
}
