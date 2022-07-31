import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:seller_side/home_screen/agreement.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../widgets/app_button.dart';
import 'invoice.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                            child: const Center(
                              child: Text(
                                'Accept Date : 22/07/2022',
                                style: TextStyle(color: Colors.white, fontSize: 10.5),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
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
                          child: Text(
                            "\$0.00", //'Alert Title',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
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
                                    child: Icon(
                                      Icons.attach_file,
                                      color: Color(0xFF128383),
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
}
