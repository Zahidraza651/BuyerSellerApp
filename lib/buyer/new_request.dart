import 'dart:convert';
import 'dart:io';
<<<<<<< HEAD

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
=======
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
import 'package:permission_handler/permission_handler.dart';
import 'package:seller_side/constants.dart';
import 'package:seller_side/models/request.dart';
import 'package:seller_side/models/user.dart';
<<<<<<< HEAD
=======
import 'package:seller_side/post_login/welcome.dart';
import 'package:seller_side/widgets/app_button.dart';
import 'package:seller_side/widgets/app_textfield.dart';
import 'package:seller_side/widgets/images.dart';
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
<<<<<<< HEAD
  File? img;
  bool isLoading = false;
=======
  List<XFile?> img = [];
  var imgPaths = [];
  bool isLoading = false;
  bool isEnable = true;
  ImagePicker? imgPicker;
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
  TextEditingController itemtype = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController detail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

<<<<<<< HEAD
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
=======
  makeNewRequest() async {
    setState(() {
      isLoading = true;
      isEnable = false;
    });
    //Future.delayed(Duration(milliseconds: 500), () {});
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
      for (var image in img) {
        request.files.add(await http.MultipartFile.fromPath('photo', image!.path));
      }
    }
    final response = await request.send();
    setState(() {
      isLoading = false;
      isEnable = true;
    });
    if (response.statusCode == 200) {
      final res = jsonDecode(String.fromCharCodes(await response.stream.toBytes()));
      Request newReq = Request.fromJson(res);
      //ignore: use_build_context_synchronously
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
<<<<<<< HEAD
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
=======
    //var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.newRequest,
                  style: const TextStyle(color: Colors.black),
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Welcome(userData: widget.userData)));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              AppLocalizations.of(context)!.itemtype, //"Item Type",
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: ApptextField(
                              controller: itemtype,
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              AppLocalizations.of(context)!.price, //"Item Type",
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: ApptextField(
                              controller: price,
                              keyboardType: TextInputType.number,
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              AppLocalizations.of(context)!.details, //"Item Type",
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: TextField(
                              controller: detail,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffF0F0F0)),
                              maxLines: 12,
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              AppLocalizations.of(context)!.filetypes, //"Item Type",
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: Container(
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
                                                  // ignore: use_build_context_synchronously
                                                  await showImageSource(context);
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
<<<<<<< HEAD
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
=======
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
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 5.0, 10.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                                child: ListView.builder(
                                    itemCount: img.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return getPickedImage(img[index]!.path, index);
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: AppButton(
                              color: const Color(0xff128383),
                              onpressed: isEnable
                                  ? () {
                                      makeNewRequest();
                                    }
                                  : null,
                              text: AppLocalizations.of(context)!.proceedtoAgreement,
                              textColor: Colors.white,
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ))),
    );
  }

  //image sources

  showImageSource(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () async {
                    final image = await ImagePicker().pickImage(source: ImageSource.camera);
                    if (image == null) {
                      return;
                    } else {
                      setState(() {
                        img.add(image);
                      });
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () async {
                  final List<XFile>? images = await ImagePicker().pickMultiImage();
                  if (images == null) {
                    return;
                  } else {
                    setState(() {
                      img.addAll(images);
                    });
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  //images collection

  Widget getPickedImage(String path, int index) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.fromLTRB(3.0, 0, 3.0, 0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.file(
                File(path),
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
            bottom: 0,
            left: 32,
            top: 28,
            right: 0,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    img.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )))
      ],
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
