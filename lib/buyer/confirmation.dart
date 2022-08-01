import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class BuyerConfirmation extends StatefulWidget {
  const BuyerConfirmation({Key? key}) : super(key: key);

  @override
  State<BuyerConfirmation> createState() => _BuyerConfirmationState();
}

class _BuyerConfirmationState extends State<BuyerConfirmation> {
  bool _changeState = true;
  List<File?> img = [];
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
                          primary:
                              _changeState == true ? const Color(0xFF383838) : const Color(0xFFE3E1E1),
                        ),
                        onPressed: () {
                          setState(() {
                            _changeState = true;
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)!.byHand, //Credit Card",
                          style: TextStyle(
                            color: _changeState == true ? Colors.white : const Color(0xFF969696),
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
                        style: ElevatedButton.styleFrom(
                            primary:
                                _changeState == true ? const Color(0xFFE3E1E1) : const Color(0xFF383838),
                            elevation: 0),
                        onPressed: () {
                          setState(() {
                            _changeState = false;
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)!.byPost, //"Wallet",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: _changeState == true ? const Color(0xFF969696) : Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            if (_changeState == false)
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.01,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: Text(
                    AppLocalizations.of(context)!.companyName, //"Item Type",
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  )),
            if (_changeState == false)
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.03,
                    MediaQuery.of(context).size.height * 0.015,
                    MediaQuery.of(context).size.width * 0.03,
                    0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: const Color(0xFFE3E2E2),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none,
                  ),
                ),
              ),
            if (_changeState == false)
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.015,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: Text(
                    AppLocalizations.of(context)!.number, //"Price",
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  )),
            if (_changeState == false)
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.03,
                    MediaQuery.of(context).size.height * 0.015,
                    MediaQuery.of(context).size.width * 0.03,
                    0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: const Color(0xFFE3E2E2),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none,
                  ),
                ),
              ),
            Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.height * 0.015,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                child: Text(
                  //"Details",
                  AppLocalizations.of(context)!.details,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                )),
            Row(
              children: [
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: DottedBorder(
                      color: const Color(0xFF128383),
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                                child: IconButton(
                              onPressed: () async {
                                await Permission.photos.request();

                                var permissionStatus = await Permission.photos.status;
                                if (permissionStatus.isGranted) {
                                  final images = await FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                                  );
                                  if (images == null) {
                                    return;
                                  }
                                  setState(() {
                                    img = images.paths.map((path) => File(path!)).toList();
                                  });
                                } else {
                                  _showMsg(
                                      'Can not access your gallery',
                                      const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ));
                                }
                              },
                              icon: const Icon(Icons.attach_file),
                            )),
                          ),
                          Expanded(
                            child: Center(child: Text(AppLocalizations.of(context)!.attach)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        child: img.isNotEmpty
                            ? Image.file(
                                img[0]!,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  color: const Color(0xFF128383).withOpacity(0.15),
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 35,
                        top: 45,
                        right: 0,
                        child: IconButton(
                            onPressed: () {
                              if (img.isNotEmpty) {
                                setState(() {
                                  img.removeAt(0);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )))
                  ],
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        child: img.length > 1
                            ? Image.file(
                                img[1]!,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  color: const Color(0xFF128383).withOpacity(0.15),
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 35,
                        top: 45,
                        right: 0,
                        child: IconButton(
                            onPressed: () {
                              if (img.length > 1) {
                                setState(() {
                                  img.removeAt(1);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )))
                  ],
                )
              ],
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
                    showAlertDialog(context);
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

showAlertDialog(BuildContext context) {
  // Create button

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Align(
      alignment: Alignment.topCenter,
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
        ],
      ),
    ),
    actions: [
      Container(
        width: 400,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
            child: const Text(
              'Share Invoice Number',
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(70))),
              primary: const Color(0xFF128383),
            ),
            onPressed: () {}),
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
}
