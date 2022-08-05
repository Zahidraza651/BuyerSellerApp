import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DeliveryMethod extends StatefulWidget {
  const DeliveryMethod({Key? key}) : super(key: key);

  @override
  State<DeliveryMethod> createState() => _DeliveryMethodState();
}

class _DeliveryMethodState extends State<DeliveryMethod> {
  bool _changeState = true;
  File? img;
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
                  AppLocalizations.of(context)!.deliveryMethod, //"Payment Method",
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
                          primary: _changeState == true ? Color(0xFF383838) : Color(0xFFE3E1E1),
                        ),
                        onPressed: () {
                          setState(() {
                            _changeState = true;
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)!.byHand, //Credit Card",
                          style: TextStyle(
                            color: _changeState == true ? Colors.white : Color(0xFF969696),
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
                            primary: _changeState == true ? Color(0xFFE3E1E1) : Color(0xFF383838),
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
                              color: _changeState == true ? Color(0xFF969696) : Colors.white),
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
                child: TextField(
                  decoration: const InputDecoration(
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
                child: TextField(
                  decoration: const InputDecoration(
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
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.16,
                  margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: DottedBorder(
                      color: Color(0xFF128383),
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: IconButton(
                            onPressed: () async {
                              await Permission.photos.request();

                              var permissionStatus = await Permission.photos.status;
                              if (permissionStatus.isGranted) {
                                final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                if (image == null) {
                                  return;
                                }
                                setState(() {
                                  img = File(image.path);
                                });
                              } else {
                                _showMsg(
                                    'Can not access your gallery',
                                    Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ));
                              }
                            },
                            icon: const Icon(Icons.attach_file),
                          )),
                          Center(child: Text(AppLocalizations.of(context)!.attach)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.16,
                  margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: img != null
                        ? Image.file(
                            img!,
                            fit: BoxFit.fill,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Color(0xFF128383).withOpacity(0.15),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.16,
                  margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xFF128383).withOpacity(0.15),
                      ),
                    ),
                  ),
                ),
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
        style: TextStyle(
            fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF383838)),
      ),
    ),
    content: Container(
      height: 80,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Description',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Color(0xFF969696)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.invoice34,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Color(0xFF1BA9E4)),
          ),
        ],
      ),
    ),
    actions: [
      Container(
        width: 400,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
            child: Text(
              'Share Invoice Number',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(70))),
              primary: Color(0xFF128383),
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
