import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';

class SettingSwitch extends StatefulWidget {
  final String title;
  final void Function(bool) onChange;
   bool value ;

    SettingSwitch({super.key, required this.title, required this.onChange,this.value=false});

  @override
  State<SettingSwitch> createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<SettingSwitch> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
     onPressed: () {},
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title,style: AppFonts.size17.copyWith(color: AppColor.violetBlueDark),),

         Switch(value: widget.value, onChanged: (val){
           setState(() {
             widget.value = val;

           });
           widget.onChange!(val);
         },)
    ],
    ),
    );
    }
  }

