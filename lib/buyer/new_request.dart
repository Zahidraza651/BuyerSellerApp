import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seller_side/constants.dart';
import 'package:seller_side/models/request.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/widgets/loader.dart';
import 'agreement.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:http/http.dart' as http;

class NewRequest extends StatefulWidget {
  final UserData userData;
  const NewRequest({Key? key, required this.userData}) : super(key: key);

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  File? img;
  bool isLoading = false;
  TextEditingController itemtype = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController detail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future makeNewRequest() async {
    setState(() => isLoading = true);
    var token = widget.userData.token;
    final response = await http.post(
      Uri.parse(
          '$baseUrl/create_request?item_type=${itemtype.text}&price=${price.text}&details=${detail.text}'),
      headers: {
        // 'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      Request newReq = Request.fromJson(jsonDecode(response.body));
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BuyerAgreement(request: newReq, userData: widget.userData)));
    } else {
      _showMsg(
          'Server Error ${response.statusCode}',
          const Icon(
            Icons.close,
            color: Colors.red,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.03,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        AppLocalizations.of(context)!.newRequest, //"New Request",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 18),
                      )
                    ],
                  )),
              Column(
                children: [
                  isLoading
                      ? const Center(
                          child: Loading(),
                        )
                      : Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 1,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.05,
                                    MediaQuery.of(context).size.height * 0.03,
                                    MediaQuery.of(context).size.width * 0.05,
                                    0),
                                child: Text(
                                  AppLocalizations.of(context)!.itemtype, //"Item Type",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                )),
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
                                controller: itemtype,
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
                                  AppLocalizations.of(context)!.price, //"Price",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                )),
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
                                controller: price,
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
                                  AppLocalizations.of(context)!.details, //"Details",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.03,
                                  MediaQuery.of(context).size.height * 0.015,
                                  MediaQuery.of(context).size.width * 0.03,
                                  0),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE3E2E2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  maxLines: 8, //or null
                                  decoration: const InputDecoration(border: InputBorder.none),
                                  controller: detail,
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
                                  AppLocalizations.of(context)!.details, //"Details",
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
                                              icon: Icon(Icons.attach_file),
                                              color: Color(0xFF128383),
                                              onPressed: () async {
                                                await Permission.photos.request();

                                                var permissionStatus = await Permission.photos.status;
                                                if (permissionStatus.isGranted) {
                                                  final image = await ImagePicker()
                                                      .pickImage(source: ImageSource.gallery);
                                                  if (image == null) {
                                                    return;
                                                  }
                                                  setState(() {
                                                    img = File(image.path);
                                                  });
                                                } else {
                                                  _showMsg(
                                                      'cant access your gallery',
                                                      const Icon(
                                                        Icons.close,
                                                        color: Colors.red,
                                                      ));
                                                }
                                              },
                                            ),
                                          ),
                                          Center(
                                              child: Text(
                                            AppLocalizations.of(context)!.attach,
                                            style: TextStyle(color: Color(0xFF128383)),
                                          )),
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
                              width: MediaQuery.of(context).size.width * 1,
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.035,
                                  MediaQuery.of(context).size.height * 0.015,
                                  MediaQuery.of(context).size.width * 0.035,
                                  0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(70))),
                                  primary: const Color(0xFF128383),
                                ),
                                onPressed: () {
                                  if (itemtype.text.isNotEmpty &&
                                      price.text.isNotEmpty &&
                                      detail.text.isNotEmpty) {
                                    makeNewRequest();
                                  } else {
                                    _showMsg(
                                        'Please provide all fields',
                                        const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ));
                                  }

                                  // Navigator.push(
                                  //     context, MaterialPageRoute(builder: (context) => const BuyerAgreement()));
                                },
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .proceedtoAgreement, //"Proceed to Agreement",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                ],
              )
            ],
          ),
        )),
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
