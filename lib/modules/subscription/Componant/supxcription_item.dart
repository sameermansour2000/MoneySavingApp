import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/modules/widget/custom_button.dart';

class SubScriptionItem extends StatefulWidget {
  bool isSelected;
  final String title;
  final String subScriptionId;

  final void Function(String subScriptionId) onPressed;
   SubScriptionItem ({super.key, this.isSelected=false, required this.title, required this.onPressed, required this.subScriptionId});

  @override
  State<SubScriptionItem> createState() => _SubScriptionItemState();
}

class _SubScriptionItemState extends State<SubScriptionItem> {
togalSElected(){
  setState(() {
    widget.isSelected = !widget.isSelected!;

  });
}

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8.0),

      child: CustomTextButton(
          hight: 115,

          boxBorder: widget.isSelected?Border(
            top: BorderSide(color: AppColor.white,width: 8,),
          ):null,
          text: widget.title, onPressed: (){
            widget.onPressed(widget.subScriptionId);
      togalSElected();},
          color:widget.isSelected?AppColor.violetBlueDark:AppColor.VioletVLueOpc_20 ,
          textColor: Colors.white),
    );
  }
}
