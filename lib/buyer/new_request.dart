import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seller_side/constants.dart';
import 'package:seller_side/models/request.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/post_login/welcome.dart';
import 'package:seller_side/widgets/app_button.dart';
import 'package:seller_side/widgets/app_textfield.dart';
import 'package:seller_side/widgets/images.dart';
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
  List<XFile?> img = [];
  var imgPaths = [];
  bool isLoading = false;
  bool isEnable = true;
  ImagePicker? imgPicker;
  TextEditingController itemtype = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController detail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
