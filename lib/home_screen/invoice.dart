<<<<<<< HEAD
import 'package:dotted_border/dotted_border.dart';
=======
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seller_side/home_screen/agreement.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
<<<<<<< HEAD
import '../models/user.dart';
import '../widgets/app_button.dart';
import 'invoice.dart';
import 'dart:io';

class Invoice extends StatefulWidget {
  searchReqData data;
   Invoice({Key? key,required this.data}) : super(key: key);
=======
import 'package:seller_side/models/user.dart';
import '../widgets/app_button.dart';
import 'invoice.dart';

class Invoice extends StatefulWidget {
  final UserData userdata;
  const Invoice({Key? key, required this.userdata}) : super(key: key);
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
<<<<<<< HEAD
  File? img;
=======
  List<XFile?> img = [];
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
<<<<<<< HEAD
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                AppLocalizations.of(context)!.invoice34, //'Invoice # 34',
                style: const TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context, MaterialPageRoute(builder: (context) => InvoicePageSecond()));
                          },
                          child: Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Color(0xFF148788), borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.accepted, //'Unread',
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                            child:  Center(
                              child: Text(widget.data.data!.createdAt.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 10.5),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                            child:  Center(
                              child: Text(widget.data.data!.updatedAt.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 10.5),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.itemtype, //'Alert Title',
                            style: const TextStyle(
                                color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(widget.data.data!.itemType.toString(), //'Alert Title',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.price, //'Alert Title',
                            style: const TextStyle(
                                color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Text(widget.data.data!.price.toString(), //'Alert Title',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Expanded(
                            child: Text(widget.data.data!.details.toString(),
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
                        ))
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 1,
                        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                        child: Text(
                          AppLocalizations.of(context)!.files, //"Details",
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              color: Color(0xFF969696),
                              fontWeight: FontWeight.bold),
                        )),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.085,
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
                                      icon: Icon(Icons.attach_file, size: 20,),
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
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context)!.invoice34, //'Invoice # 34',
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => InvoicePageSecond()));
                    },
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF148788), borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.accepted, //'Unread',
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration:
                          BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                      child: const Center(
                        child: Text(
                          'Accept Date : 22/07/2022',
                          style: TextStyle(color: Colors.white, fontSize: 10.5),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration:
                          BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                      child: const Center(
                        child: Text(
                          'Request Date : 22/07/2022',
                          style: TextStyle(color: Colors.white, fontSize: 10.5),
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      AppLocalizations.of(context)!.itemtype, //'Alert Title',
                      style: const TextStyle(
                          color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Text(
                      AppLocalizations.of(context)!.itemtype1, //'Alert Title',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      AppLocalizations.of(context)!.price, //'Alert Title',
                      style: const TextStyle(
                          color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                    child: Text(
                      "\$0.00", //'Alert Title',
                      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                    ' Morbi neque turpis, placerat at maximus sed, convallis ut erat.'
                    ' Proin bibendum aliquet accumsan. Nulla interdum nunc a enim condimentum,'
                    ' eleifend efficitur magna congue. Phasellus vehicula odio eget',
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
                  ))
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                  child: Text(
                    AppLocalizations.of(context)!.files, //"Details",
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        color: Color(0xFF969696),
                        fontWeight: FontWeight.bold),
                  )),
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
              Container(
                margin: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
                child: Divider(
                  color: Colors.black.withOpacity(0.15),
                  thickness: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.only(top: 15.0),
                //height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.deliveryMethod, //'Alert Title',
                            style: const TextStyle(
                                color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.byPost, //'Alert Title',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.company, //'Alert Title',
                            style: const TextStyle(
                                color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.companyName, //'Alert Title',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            AppLocalizations.of(context)!.number, //'Alert Title',
                            style: const TextStyle(
                                color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            "355663467", //'Alert Title',
                            style: TextStyle(
                                color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      children: [
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.16,
                          margin: EdgeInsets.fromLTRB(0, height * 0.015, 0, 0),
                          child: ClipRRect(
<<<<<<< HEAD
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
=======
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                color: const Color(0xFF128383).withOpacity(0.15),
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
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                color: const Color(0xFF128383).withOpacity(0.15),
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
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                color: const Color(0xFF128383).withOpacity(0.15),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    Container(
                      margin: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.15),
                        thickness: 1,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.only(top: 15.0),
                      //height: 170,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  AppLocalizations.of(context)!.deliveryMethod, //'Alert Title',
                                  style: const TextStyle(
                                      color: Color(0xFF969696),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(widget.data.data!.deliveryMethod.toString(), //'Alert Title',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(
                                  AppLocalizations.of(context)!.company, //'Alert Title',
                                  style: const TextStyle(
                                      color: Color(0xFF969696),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(
                                  AppLocalizations.of(context)!.companyName, //'Alert Title',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(
                                  AppLocalizations.of(context)!.number, //'Alert Title',
                                  style: const TextStyle(
                                      color: Color(0xFF969696),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(
                                  "355663467", //'Alert Title',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: [
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
=======
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AppButton(
                      color: const Color(0xff128383),
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Agreement(userData: widget.userdata)));
                      },
                      text: AppLocalizations.of(context)!.proceedtoAgreement,
                      textColor: Colors.white,
                    ),
                  ))
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
  //
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

>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
