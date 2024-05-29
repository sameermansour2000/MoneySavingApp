import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/constant/images_path.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/auth/user_type.dart';
import 'package:ms/modules/widget/background_Violetblur.dart';
import 'package:ms/modules/widget/custom_text_field.dart';
import 'package:ms/modules/widget/logo.dart';

import '../save_money_category/SaveMoneyLayout.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController=TextEditingController();

  final TextEditingController nameController=TextEditingController();

  final TextEditingController birthdayController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  CollectionReference? addUser;

  User? user = FirebaseAuth.instance.currentUser;

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
                key:formKey ,
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
                    Image.asset(AppImages.signUp),

                    CustomTextField(controller: emailController
                      , keyboardType: TextInputType.emailAddress,
                      hintText:
                      'Email',
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
                    CustomTextField(controller: nameController
                      , keyboardType: TextInputType.name,
                      hintText:
                      'Full name',
                      color: AppColor.VioletVLueOpc_20,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                      suffix: Opacity(
                        opacity: .9,
                        child:ImageIcon(const Image(image:AssetImage('assets/images/id-card.png'),).image,color: Colors.black,),
                      ),
                    ),
                    CustomTextField(controller: birthdayController
                      , keyboardType: TextInputType.datetime,
                  hintText: 'DD/MM/YYYY',
                      color: AppColor.VioletVLueOpc_20,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Birthday";
                        }
                        return null;
                      },
                      suffix:  Opacity(
                        opacity: .9,
                        child:ImageIcon(const Image(image:AssetImage('assets/images/birthday.png'),).image,color: Colors.black,),
                      ),
                    ),
                    CustomTextField(controller: passwordController
                      , keyboardType: TextInputType.emailAddress,
                      hintText:
                      'Confirm Password',
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
                    GestureDetector(
                      onTap: (){
                        _submit();

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
                        Get.off(() => Login());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account',style: AppFonts.size14.copyWith(
                              color: AppColor.violetBlueDark.withOpacity(.7)
                          ),),
                          Text('- sign in-',style: AppFonts.size14.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.7)
                          ),)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
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
      formKey.currentState!.save();
      UserCredential response = await signUp();
      User? userID = FirebaseAuth.instance.currentUser;
      setState(() {
        user = userID;
      });
      Get.offAll(() => const SaveMoneyLayout());
      await addDataEmail();
      return;
    }
  }

  signUp() async {
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          birthdayController.text.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        return userCredential;
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // dialog.AwesomeDialog(
        //    context: context,
        //    dialogType: dialog.DialogType.INFO,
        //    animType: dialog.AnimType.,
        //    title: 'Attend  !',
        //    desc: 'The password is weak',
        //    btnCancelOnPress: () {},
        //    btnOkOnPress: () {},
        //  ).show();
      } else if (e.code == 'email-already-in-use') {
        // dialog.AwesomeDialog(
        //   context: context,
        //   dialogType: dialog.DialogType.INFO,
        //   animType: dialog.AnimType.BOTTOMSLIDE,
        //   title: 'Attend  !',
        //   desc: 'This Account is Already Exist',
        //   btnOkOnPress: () {},
        // ).show();
      }
    } catch (e) {
      print(e);
    }
  }

  addDataEmail() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    addUser = FirebaseFirestore.instance.collection('users');
    addUser?.doc('${user?.uid}').set({
      'email': emailController.text,
      'name': nameController.text,
      'isStudent': true,
      'bod': birthdayController.text,
      'id': user?.uid,
      'location': '',
      'cat': '',
      'created_at': time,
      'is_online': false,
      'last_active': time,
      'push_token': '',
    });
  }
}
