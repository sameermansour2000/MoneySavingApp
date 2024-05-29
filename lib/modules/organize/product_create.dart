import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/widget/custom_text_field.dart';
import 'package:ms/modules/widget/global_appbar.dart';

import '../../main.dart';

class ProductCreate extends StatefulWidget {
  final String title;
  final String title1;
  final String subCat;
  ProductCreate({super.key, required this.title, required this.title1, required this.subCat});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  TextEditingController productName = TextEditingController();

  TextEditingController productPrice = TextEditingController();
  TextEditingController codeQr = TextEditingController();

  TextEditingController productDescription = TextEditingController();
  TextEditingController subCat = TextEditingController();

  final picker = ImagePicker();

  File? imageProduct;

  chooseImage_gallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }
  String? selectedValue2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: GlobalAppBar(
              title: widget.title,
              color: AppColor.violeteaccent,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: productName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ${widget.title} name';
                  }
                  return null;
                },
                color: AppColor.violeteaccent,
                hintText: '${widget.title} Name',
                suffix: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.violetBlueDark.withOpacity(.6),
                ),
              ),
              CustomTextField(
                controller: productDescription,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ${widget.title} description';
                  }
                  return null;
                },
                color: AppColor.violeteaccent,
                hintText: '${widget.title} description',
                suffix: Icon(
                  Icons.info_outline,
                  color: AppColor.violetBlueDark.withOpacity(.6),
                ),
              ),
              CustomTextField(
          
                controller: productPrice,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ${widget.title} price';
                  }
                  return null;
                },
                color: AppColor.violeteaccent,
                hintText: '${widget.title} price',
                suffix: Icon(
                  Icons.monetization_on_outlined,
                  color: AppColor.violetBlueDark.withOpacity(.6),
                ),
              ),
              CustomTextField(

                controller: codeQr,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ${widget.title} codeQr';
                  }
                  return null;
                },
                color: AppColor.violeteaccent,
                hintText: '${widget.title} codeQr',
                suffix: Icon(
                  Icons.monetization_on_outlined,
                  color: AppColor.violetBlueDark.withOpacity(.6),
                ),
              ),
              widget.subCat==''?Container():  Padding(
                padding: const EdgeInsets.only(top: 16.0,left: 44,right: 44),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(widget.title1)
                            .doc(widget.subCat)
                            .collection('data')
                            .where('newSubCate', isEqualTo: false)
                            .get(),
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
                          Set<String> uniqueItems = categoryData.map((document) {
                            return document['subCate'] as String;
                          }).toSet();

                          List<DropdownMenuItem<String>> dropdownItems = uniqueItems.map((itemName) {
                            return DropdownMenuItem<String>(
                              value: itemName,
                              child: Text(
                                itemName,
                                style: AppFonts.size14.copyWith(color: Colors.black.withOpacity(.4)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList();

                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Text(
                                'Select Your Sub Category',
                                textAlign: TextAlign.center,
                                style: AppFonts.size14.copyWith(color: Colors.black.withOpacity(.4)),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: dropdownItems,
                              value: selectedValue2,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue2 = value;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                padding: const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                ),
                                iconSize: 20,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppColor.violeteaccent,
                                ),
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all(6),
                                  thumbVisibility: MaterialStateProperty.all(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(onPressed: (){
                      print(selectedValue2.toString());
                      Get.defaultDialog(
                        title: 'Add New Category',
                        content:  Column(
                          children: [
                            CustomTextField(
                              controller: subCat,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter ${widget.title} Category';
                                }
                                return null;
                              },
                              color: AppColor.violeteaccent,
                              hintText: '${widget.title} Category',
                              suffix: Icon(
                                Icons.shopping_cart_outlined,
                                color: AppColor.violetBlueDark.withOpacity(.6),
                              ),
                            ),
                            const SizedBox(height: 18,),

                            ElevatedButton(onPressed:(){
                              Get.back();
                            } , child: const Text('Submit'))
          
                          ],
                        ),
                      );
                    }, icon: const Icon(Icons.add))
                  ],
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: IconButton(
                  onPressed: () async {
                    final image = await chooseImage_gallery();
                    setState(() {
                      imageProduct = File(image!.path);
                    });
                  },
                  icon: Card(
                    color: AppColor.violeteaccent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Pick Image',style: AppFonts.size25.copyWith(color: Colors.white),),
                          const SizedBox(height: 8,),
                          const Icon(Icons.drive_folder_upload,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
        widget.subCat==''?FloatingActionButton(
          onPressed: () async {
            try {
              // Ensure image is picked
              if (imageProduct == null) {
                print('No image selected.');
                return;
              }

              // Upload the image to Firebase Storage
              Reference ref = FirebaseStorage.instance.ref().child('images/${imageProduct!.path.split('/').last}');
              UploadTask uploadTask = ref.putFile(File(imageProduct!.path));

              // Await the upload task and handle any errors
              TaskSnapshot taskSnapshot = await uploadTask.catchError((error) {
                print('Error during upload: $error');
                throw error;
              });

              // Get the download URL
              String imageUrl = await taskSnapshot.ref.getDownloadURL();
              print('Image URL: $imageUrl');

              // Add the data to Firestore
              await FirebaseFirestore.instance.collection(widget.title1).add({
                'uid': FirebaseAuth.instance.currentUser!.uid,
                'name': productName.text,
                'desc': productDescription.text,
                'price': productPrice.text,
                'subCate': '',
                'lat': sharedPreferences!
                    .getDouble('lat'),
                'long': sharedPreferences!
                    .getDouble('long'),
                'active': false,
                'location': '',
                'rate': 0.0,
                'comment': [],
                'codeQr': codeQr.text,

                'image': imageUrl
              });
              Get.snackbar('Money Saver', 'Data added  successfully.');

              Get.back();
              print('Data added to Firestore successfully.');
            } catch (e) {
              print('An error occurred: $e');
            }
          },

          backgroundColor: AppColor.violeteaccent,
          child: const Icon(Icons.upload,color: Colors.white,),
        ):

        FloatingActionButton(
          onPressed: () async {
            print('111111111');
            print(subCat);
            print(selectedValue2);
            print('222222222');

            try {
              // Ensure image is picked
              if (imageProduct == null) {
                print('No image selected.');
                return;
              }

              // Upload the image to Firebase Storage
              Reference ref = FirebaseStorage.instance.ref().child('images/${imageProduct!.path.split('/').last}');
              UploadTask uploadTask = ref.putFile(File(imageProduct!.path));

              // Await the upload task and handle any errors
              TaskSnapshot taskSnapshot = await uploadTask.catchError((error) {
                print('Error during upload: $error');
                throw error;
              });

              // Get the download URL
              String imageUrl = await taskSnapshot.ref.getDownloadURL();
              print('Image URL: $imageUrl');

              // Add the data to Firestore
              await FirebaseFirestore.instance.collection(widget.title1).doc(widget.subCat).collection('data').add({
                'uid': FirebaseAuth.instance.currentUser!.uid,
                'name': productName.text,
                'desc': productDescription.text,
                'price': productPrice.text,
                'subCate': selectedValue2 != null ? selectedValue2:subCat.text,
                'newSubCate': selectedValue2 != null ? false:true,
                'lat': sharedPreferences!
                  .getDouble('lat'),
                'long': sharedPreferences!
                    .getDouble('long'),
                'active': false,
                'rate': 0.0,
                'comment': [],
                'codeQr': codeQr.text,
                'location': '',
                'image': imageUrl
              });

              Get.snackbar('Money Saver', 'Data added  successfully.');
              Get.back();
              print('Data added to Firestore successfully.');
            } catch (e) {
              print('An error occurred: $e');
            }
          },

          backgroundColor: AppColor.violeteaccent,
          child: const Icon(Icons.upload,color: Colors.white,),
        ),
      ),

    );
  }
}
