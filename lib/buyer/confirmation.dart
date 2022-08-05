<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
=======
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

class BuyerConfirmation extends StatefulWidget {
  const BuyerConfirmation({Key? key}) : super(key: key);

  @override
  State<BuyerConfirmation> createState() => _BuyerConfirmationState();
}

class _BuyerConfirmationState extends State<BuyerConfirmation> {
<<<<<<< HEAD
=======
  bool _changeState = true;
  List<File?> img = [];
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03, width * 0.05, 0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                      )),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.confirmation, //"Confirmation",
                      style: const TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03, width * 0.05, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.total, //"Total",
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF969696),
                        )),
                  ),
                  SizedBox(
<<<<<<< HEAD
                    width: width * 0.50,
=======
                    width: width * 0.40,
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  ),
                  const Expanded(
                      child: Text(
                    "0.00",
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03, width * 0.05, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.commission, //"Commission",
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF969696),
                        )),
                  ),
                  SizedBox(
<<<<<<< HEAD
                    width: width * 0.50,
=======
                    width: width * 0.40,
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  ),
                  const Expanded(
                      child: Text(
                    "0.00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.02, width * 0.05, 0),
              child: const Divider(color: Color(0xFF969696)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03, width * 0.05, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.netAmmount, //"Net Amount",
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF969696),
                        )),
                  ),
                  SizedBox(
<<<<<<< HEAD
                    width: width * 0.50,
=======
                    width: width * 0.40,
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  ),
                  const Expanded(
                      child: Text("0.00",
                          style: TextStyle(
                              color: Color(0xFF1BA9E4),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
              color: const Color(0xFF969696),
              height: 0.8,
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.02, width * 0.05, 0),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03, width * 0.05, 0),
                child: Text(
                  AppLocalizations.of(context)!.paymentMethod, //"Payment Method",
                  style:
                      const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
              width: width * 1,
              padding: const EdgeInsets.all(2),
              margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.02, width * 0.05, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.42,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF383838),
                        ),
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.creditCard, //Credit Card",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        )),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  SizedBox(
                    width: width * 0.42,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: const Color(0xFFE3E1E1), elevation: 0),
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.wallet, //"Wallet",
                          style: const TextStyle(fontFamily: 'Roboto', color: Color(0xFF969696)),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 1,
              margin: EdgeInsets.fromLTRB(width * 0.02, height * 0.05, width * 0.02, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70))),
                    primary: const Color(0xFF128383),
                  ),
                  onPressed: () {
<<<<<<< HEAD
                    showAboutDialog(context: context);
=======
                    showAlertDialog(context);
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  },
                  child: Text(
                    AppLocalizations.of(context)!.confirmPay, //"Confirm & Pay",
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}

=======

  _showMsg(String msg, Icon icon) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              msg,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          icon
        ],
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

showAlertDialog(BuildContext context) {
  // Create button

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Align(
      alignment: Alignment.topCenter,
<<<<<<< HEAD
      child: Text(AppLocalizations.of(context)!.messages, style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFF383838)),),
    ),
    content: Container(
      height: 80,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text("",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Color(0xFF969696)
            ),),
          SizedBox(height: 10,),
          Text(AppLocalizations.of(context)!.invoice34,style: TextStyle(fontFamily: 'Roboto',fontSize: 16, color: Color(0xFF1BA9E4)),),
=======
      child: Text(
        AppLocalizations.of(context)!.messages,
        style: const TextStyle(
            fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF383838)),
      ),
    ),
    content: SizedBox(
      height: 80,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Color(0xFF969696)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.invoice34,
            style: const TextStyle(fontFamily: 'Roboto', fontSize: 16, color: const Color(0xFF1BA9E4)),
          ),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
        ],
      ),
    ),
    actions: [
      Container(
        width: 400,
<<<<<<< HEAD
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
            child: Text("",style: TextStyle(fontFamily: 'Roboto',fontSize: 14,fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(70))
              ),
              primary: Color(0xFF128383),
            ),
            onPressed: () {
            }

        ),
=======
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(70))),
              primary: const Color(0xFF128383),
            ),
            onPressed: () {
              Share.share('Something to share');
            },
            child: const Text(
              'Share Invoice Number',
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),
            )),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
<<<<<<< HEAD
}
=======
}
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
