import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
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
  List<File?> img = [];
  var imgPaths = [];
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
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/create_request'));
    request.fields['item_type'] = itemtype.text;
    request.fields['price'] = price.text;
    request.fields['details'] = detail.text;
    request.headers.addAll(headers);
    if (img.isNotEmpty) {
      if (img.length == 1) {
        request.files.add(await http.MultipartFile.fromPath('photo[0]', img[0]!.path));
      } else if (img.length > 1) {
        request.files.add(await http.MultipartFile.fromPath('photo[0]', img[0]!.path));
        request.files.add(await http.MultipartFile.fromPath('photo[1]', img[1]!.path));
      }
    }
    final response = await request.send();
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      final res = jsonDecode(String.fromCharCodes(await response.stream.toBytes()));
      Request newReq = Request.fromJson(res);
      //ignore: use_build_context_synchronously
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
                                  AppLocalizations.of(context)!.filetypes, //"Details",
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
                                    borderRadius: const BorderRadius.all(const Radius.circular(12)),
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
                                                icon: const Icon(Icons.attach_file),
                                                color: const Color(0xFF128383),
                                                onPressed: () async {
                                                  await Permission.photos.request();

                                                  var permissionStatus = await Permission.photos.status;
                                                  if (permissionStatus.isGranted) {
                                                    FilePickerResult? images =
                                                        await FilePicker.platform.pickFiles(
                                                      allowMultiple: true,
                                                      type: FileType.custom,
                                                      allowedExtensions: ['jpg', 'jpeg', 'png'],
                                                    );
                                                    if (images == null) {
                                                      return;
                                                    } else {
                                                      setState(() {
                                                        img = images.paths
                                                            .map((path) => File(path!))
                                                            .toList();
                                                      });
                                                    }
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
                                          ),
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                              AppLocalizations.of(context)!.attach,
                                              style: const TextStyle(color: const Color(0xFF128383)),
                                            )),
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
                                                  borderRadius:
                                                      const BorderRadius.all(const Radius.circular(12)),
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
                                                  borderRadius:
                                                      const BorderRadius.all(Radius.circular(12)),
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
                                        AppLocalizations.of(context)!.allfields,
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
