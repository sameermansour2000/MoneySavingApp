import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../binding/ExpirationTextField.dart';
import '../../binding/FlipCard.dart';
import '../save_money_category/SaveMoneyLayout.dart';

class DTPaymentScreen extends StatefulWidget {
  static String tag = '/DTPaymentScreen';

  const DTPaymentScreen({super.key});

  @override
  DTPaymentScreenState createState() => DTPaymentScreenState();
}

class DTPaymentScreenState extends State<DTPaymentScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  var cardNumberCont = TextEditingController();
  var cardHolderCont = TextEditingController();
  var expiryDateCont = TextEditingController(text: 'MM/YY');
  var securityCodeCont = TextEditingController();

  var cardHolderFocus = FocusNode();
  var expiryDateFocus = FocusNode();
  var securityCodeFocus = FocusNode();

  var isFocusOnSecurityCode = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    securityCodeFocus.addListener(() {
      cardKey.currentState!.toggleCard();

      setState(() {});
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    securityCodeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff9D749E),
            elevation: 0,
            title: const Text(
              'payment',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: FlipCard(
                        key: cardKey,
                        front: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff9D749E).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              Positioned(
                                height: 40,
                                right: 8,
                                top: 8,
                                child: Image.asset(
                                    'assets/images/ic_mastercard.png'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        cardNumberCont.text
                                            .padRight(16, '*')
                                            .replaceAllMapped(
                                                RegExp(r".{4}"),
                                                (match) =>
                                                    "${match.group(0)} "),
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('card Holder',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text('Expiry',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            cardHolderCont.text,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(expiryDateCont.text,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        back: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff9D749E).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(height: 40, color: Colors.black),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 40,
                                      color: Colors.black38,
                                      width: MediaQuery.of(context).size.width *
                                          0.6),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(securityCodeCont.text,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(height: 40, color: Colors.black12),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: cardNumberCont,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'card Number',
                        counterText: '',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF0A79DF))),
                      ),
                      maxLength: 16,
                      textInputAction: TextInputAction.next,
                      onChanged: (s) {
                        setState(() {});
                      },
                      onSubmitted: (s) {
                        FocusScope.of(context).requestFocus(expiryDateFocus);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ExpirationFormField(
                            controller: expiryDateCont,
                            focusNode: expiryDateFocus,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Expiry Date',
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF0A79DF))),
                              counterText: '',
                            ),
                          ),
                        ),
                        // TextField(
                        //   controller: expiryDateCont,
                        //   keyboardType: TextInputType.datetime,
                        //   style: primaryTextStyle(),
                        //   focusNode: expiryDateFocus,
                        //   textInputAction: TextInputAction.next,
                        //   maxLength: 5,
                        //   decoration: InputDecoration(
                        //     labelText: 'Expiry Date',
                        //     border: OutlineInputBorder(),
                        //     enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.red)),
                        //     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF0A79DF))),
                        //     labelStyle: secondaryTextStyle(),
                        //     counterText: '',
                        //   ),
                        //   onChanged: (s) {
                        //     setState(() {});
                        //   },
                        //   onSubmitted: (s) {
                        //     FocusScope.of(context).requestFocus(securityCodeFocus);
                        //   },
                        // ).expand(),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextField(
                            controller: securityCodeCont,
                            keyboardType: TextInputType.number,
                            // style: primaryTextStyle(),
                            focusNode: securityCodeFocus,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Security Code',
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF0A79DF))),
                              // labelStyle: secondaryTextStyle(),
                              counterText: '',
                            ),
                            maxLength: 3,
                            onChanged: (s) {
                              setState(() {});
                            },
                            onSubmitted: (s) {
                              FocusScope.of(context)
                                  .requestFocus(cardHolderFocus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: cardHolderCont,
                      textCapitalization: TextCapitalization.words,
                      focusNode: cardHolderFocus,
                      // style: primaryTextStyle(),
                      decoration: const InputDecoration(
                        labelText: 'Proceed to Pay',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF0A79DF))),
                        // labelStyle: secondaryTextStyle(),
                      ),
                      onChanged: (s) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Choose one',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap:(){
                                            Get.to(()=>const SaveMoneyLayout(
                                              isOrgnizer: true,
                                            ));
                                          },
                                          child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            alignment: Alignment.center,
                                            child: const Text('CHECK OUT',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(colors: [
                            Color(0xff9D749E),
                            Color(0xff9D749E),
                          ]),
                        ),
                        child: const Text('Proceed to Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
