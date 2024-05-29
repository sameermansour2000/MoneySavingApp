import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/auth/user_type.dart';
import 'package:ms/modules/save_money_category/SaveMoneyLayout.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';
import 'package:ms/modules/widget/custom_text_field.dart';
import 'package:ms/modules/widget/logo.dart';

import '../../main.dart';
import '../subscription/subscription_layout.dart';

class Login extends StatelessWidget {
   Login({super.key});
final TextEditingController emailController=TextEditingController();
final TextEditingController passwordController=TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackGroundVioletblue(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Logo(),

                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(AppImages.signIn),


                    CustomTextField(controller: emailController
                      , keyboardType: TextInputType.emailAddress,
                      hintText:
                      'Enter your email',
                      color: AppColor.VioletVLueOpc_20,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                      suffix: Opacity(
                        opacity: .5,
                        child: Container(

                          margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(

                              shape: BoxShape.circle,
                              color: Colors.black
                            ),
                            child: const Icon(Icons.email_outlined,color: Colors.white,)),
                      ),
                    ),
                    CustomTextField(controller: passwordController
                      , keyboardType: TextInputType.emailAddress,
                      hintText:
                      'Password',
                      color: AppColor.VioletVLueOpc_20,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      suffix: const Opacity(
                        opacity: .5,
                        child: Icon(Icons.lock,color: Colors.black,size: 29,),
                      ),
                    ),
                    const Spacer(),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        _submit();
                        // Get.to(() => SaveMoneyLayout());
                      },
                      child: Container(
                        width: 75,
                        height: 72,
                        decoration: BoxDecoration(
                          color: AppColor.VioletVLueOpc_20,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_forward_ios,size: 35,),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    InkWell(
                      onTap:  (){

                        Get.to(() => UserType());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You don’t have an account?',style: AppFonts.size14.copyWith(
                            color: AppColor.violetBlueDark.withOpacity(.7)
                          ),),
                          Text('- Create account -',style: AppFonts.size14.copyWith(
                            fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.7)
                          ),)
                        ],
                      ),
                    ),
                    const Spacer(),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

   void _submit() async {
     if (formKey.currentState!.validate()) {
       var user = await login();
       await FirebaseFirestore.instance.collection('users').doc(user.user!.uid).get().then((value) {
         if(value['isStudent']){


           Get.offAll(() => const SaveMoneyLayout());



         }else{
           sharedPreferences!
               .setDouble('lat', value['lat']);
           sharedPreferences!
               .setDouble('long', value['long']);

           Get.offAll(()=>const SubScriptionLayout());

         }
       });

     } else {
       print('error');
       print('Not Valid');
     }

     // Sign user up
   }

   login() async {
     try {
       if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
         UserCredential userCredential = await FirebaseAuth.instance
             .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
         print('ddddddddddddddddddddddddddd');
         print(userCredential);
         

         return userCredential;
       } else {
         print('isEmpty');
       }
     } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
         // dialog.AwesomeDialog(
         //   context: context,
         //   dialogType:dialog.DialogTyp,
         //   animType: dialog.AnimType,
         //   title: 'Attend  !',
         //   desc: 'This Account IsNot Exist',
         //   btnCancelOnPress: () {},
         //   btnOkOnPress: () {},
         // ).show();
       } else if (e.code == 'wrong-password') {
         // dialog.AwesomeDialog(
         //   context: context,
         //   dialogType: dialog.DialogType.INFO,
         //   animType: dialog.AnimType.BOTTOMSLIDE,
         //   title: 'Attend  !',
         //   desc: 'The password is Wrong',
         //   btnOkOnPress: () {},
         // ).show();
       }
     } catch (e) {
       print(e);
     }
   }
}
