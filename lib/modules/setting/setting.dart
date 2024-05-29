import 'package:flutter/material.dart';
import 'package:ms/core/theme/app_color.dart';
import 'package:ms/core/theme/app_fonts.dart';
import 'package:ms/modules/widget/custom_cached_image.dart';
import 'componant/setting_row.dart';
import 'componant/setting_section.dart';
import 'componant/setting_switch.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: AppColor.violetBlueDark,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 30),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "setting",
                          style: AppFonts.size25,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(
                                0,
                                3,
                              ),
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                        ),
                        // height: ,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 25),
                              child: Row(children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: 40,
                                  child: CustomCashedImage(
                                    url:
                                        'https://pbs.twimg.com/profile_images/1521647998123618304/Cn5pFZSA_400x400.jpg',
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.violetBlueDark,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(
                                          0,
                                          3,
                                        ),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Mohamed Elsherif",
                                  style: AppFonts.size17
                                      .copyWith(color: Colors.black),
                                )
                              ]),
                            ),
                            Divider(
                              color: AppColor.violetBlueDark.withOpacity(.5),
                            ),
                            SettingSection(
                              title: 'Account Settings',
                              children: [
                                SettingRow(
                                  title: 'Edit profile',
                                  onTap: () {},
                                ),
                                SettingRow(
                                  title: 'Change password',
                                  onTap: () {},
                                ),
                                SettingRow(
                                  title: 'About us',
                                  onTap: () {},
                                ),
                                SettingSwitch(
                                  title: 'Push notifications',
                                  value: true,
                                  onChange: (v) {},
                                ),
                                SettingSwitch(
                                  title: 'Dark mode',
                                  value: true,
                                  onChange: (v) {},
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColor.violetBlueDark.withOpacity(.5),
                            ),
                            SettingSection(
                              title: 'more',
                              children: [
                                SettingRow(
                                  title: 'Privacy policy',
                                  onTap: () {},
                                ),
                                SettingRow(
                                  title: 'Log out',
                                  onTap: () {},
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
