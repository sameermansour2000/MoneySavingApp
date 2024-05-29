import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/widget/location_icon.dart';

class CustomDialog extends StatefulWidget {
  final Widget? body;
  final bool? showTitle;
  final String? title;
  final String? textBody;

  final String? phone;
  final double? long;
  final double? let;

  final Function()? onClose;
  final Function()? onNext;
  const CustomDialog(
      {super.key,
      this.body,
      this.showTitle,
      this.phone,
      this.onClose,
      this.onNext,
      this.title,
      this.textBody,this.long,this.let});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool showNumber = false;
  toggleShowNumber() {
    setState(() {
      showNumber = !showNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(

      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness != Brightness.dark
                ? Colors.white
                : Colors.black,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.showTitle != false) ...[
              const Icon(
                Icons.warning_rounded,
                color: Colors.orangeAccent,
                size: 64,
              ),
              if (widget.title?.isNotEmpty ?? false)
                Text(widget.title!,
                    style: AppFonts.size48.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    textAlign: TextAlign.center),
              const SizedBox(
                height: 8,
              ),
            ],
            if (widget.textBody?.isNotEmpty ?? false)
              Text(
                widget.textBody!,
                textAlign: TextAlign.center,
                style: AppFonts.size25.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            widget.body ?? const SizedBox(),
            const SizedBox(
              height: 8,
            ),
            if (showNumber == true) ...[
              Text(
                widget.phone!,style: AppFonts.size17.copyWith(color: Colors.blue),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: ()  {
                      if(widget.onClose!=null)widget.onClose;

                   Navigator.pop(context);
                   },
                    icon: const Icon(
                      Icons.close,
                    )),

                  LocationIcon(lat: widget.let!, long: widget.long!,ontap: ()=>Navigator.of(context).pop(),),
                if (widget.phone?.isNotEmpty ?? false)
                  IconButton(
                    onPressed: () {
                      //todo show phone
                      toggleShowNumber();
                    },
                    icon: const Icon(Icons.phone_in_talk_outlined),
                  ),
                if (widget.onNext != null)
                  IconButton(
                      onPressed: widget.onNext,
                      icon: Image.asset('assets/images/arrow-right.png')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
