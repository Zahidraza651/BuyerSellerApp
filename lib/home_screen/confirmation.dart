import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seller_side/widgets/alert.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../widgets/app_button.dart';
import '../widgets/app_textfield.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  bool visible = false;
  List<XFile?> img = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.confirmation, //'Confirmation',
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.deliveryMethod, //'Delivery Method',
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), color: Colors.grey[300]),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.byHand, //'By Hand',
                          style: const TextStyle(color: Colors.grey, fontSize: 18.0),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        visible = false;
                      });
                    },
                  )),
                  Expanded(
                      child: InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), color: Colors.grey[300]),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.byPost, //'By Post',
                          style: const TextStyle(color: Colors.grey, fontSize: 18.0),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        visible = true;
                      });
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Visibility(
                  visible: visible,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child:
                                  Text(AppLocalizations.of(context)!.companyName) //Text('Company Name'),
                              )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: ApptextField(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(AppLocalizations.of(context)!.number), //Text('Number'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: ApptextField(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(children: [
                SizedBox(
                  width: width * 0.05,
                ),
              ]),
              //
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppButton(
                      color: const Color(0xff128383),
                      onpressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertMessage(
                                dothis: () {},
                                message: AppLocalizations.of(context)!
                                    .areyousureyouwantToproceed, //'Are you sure you want To proceed',
                                title: AppLocalizations.of(context)!.messages));
                      },
                      text: AppLocalizations.of(context)!.confirm, //'Confirm',
                      textColor: Colors.white,
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
  //
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
