import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/offer/product_screen.dart';
import 'package:ms/modules/widget/custom_search_bar.dart';
import 'package:ms/modules/widget/custom_sheet.dart';
import 'package:ms/modules/widget/global_appbar.dart';
import 'package:ms/modules/widget/vendor_card.dart';

class JobSeeker extends StatelessWidget {
  const JobSeeker({super.key, required this.title1});
final String title1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,60),

            child: GlobalAppBar(title: 'AVAILABEl JOB', color: HexColor('#BB99BB'),),
          ),
          backgroundColor: HexColor('#BB99BB'),
          body: Column(
            children: [
              const SizedBox(height: 16,),
              CustomSearchBar(
                onChanged: (value){

                },
              ),
              const SizedBox(height: 16,),

              Expanded(child:
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(title1)

                      .snapshots(),
                  builder: (context,snapshot) {
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
                    itemBuilder: (context,index)=>
                        VendorCard(
                          onTap: (){
                            showAdaptiveDialog(context: context,

                              builder: (ctx)=>CustomDialog(

                                textBody: "If you are looking for career , this could be the perfect opportunity for you.",
                                onNext: (){
                                  //todo when click arrow
                                },
                                onClose: (){
                                  //todo Close dialog

                                },
                                let: categoryData[index]['lat'],
                                long: categoryData[index]['long'],
                                phone: "201554413005",
                              ),
                            );
                          },
                          onNotifie: (){
                            //on click notification icon

                          },
                          icon: Container(
                            alignment: Alignment.topRight,
                            child:  Image.asset(AppImages.rostroant,width: 48,height: 48,),
                          ),
                          color: Colors.white,
                          textColor: AppColor.violetBlueDark,
                          title: categoryData[index]['name'],

                          url: categoryData[index]['image'],
                          description: categoryData[index]['desc'], lat: categoryData[index]['lat'], long: categoryData[index]['long']
                        ),
                  );
                }
              ))
            ],
          )    ),
    );

  }
}
