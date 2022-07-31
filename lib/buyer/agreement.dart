import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seller_side/buyer/confirmation.dart';
import 'package:seller_side/models/agreement.dart';
import 'package:seller_side/models/request.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/widgets/loader.dart';
import '../constants.dart';
import '../widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:http/http.dart' as http;

class BuyerAgreement extends StatefulWidget {
  final UserData userData;
  final Request request;
  const BuyerAgreement({Key? key, required this.request, required this.userData}) : super(key: key);

  @override
  State<BuyerAgreement> createState() => _BuyerAgreementState();
}

class _BuyerAgreementState extends State<BuyerAgreement> {
  String agrrement = '';
  bool isLoading = false;

  Future getAgreement() async {
    setState(() => isLoading = true);

    var token = widget.userData.token;
    final response = await http.get(
      Uri.parse('$baseUrl/agreement_text'),
      headers: {
        //'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      AgrrementTxt agtext = AgrrementTxt.fromJson(jsonDecode(response.body));
      setState(() {
        agrrement = agtext.data.txt;
      });
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
  void initState() {
    super.initState();
    getAgreement();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                AppLocalizations.of(context)!.agreement, //'Agreement',
                style: const TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                InkWell(
                  child: Image.asset('assets/share.png'),
                  onTap: () {},
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: isLoading
                  ? const Center(
                      child: Loading(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey[500],
                                      enabledBorder:
                                          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
                                  isExpanded: true,
                                  isDense: true,
                                  items: null,
                                  onChanged: null,
                                  //value: 'English',
                                  hint: const Text('English'),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ),
                                //)
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                agrrement,
                                style: const TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.grey),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    child: AppButton(
                                      text: AppLocalizations.of(context)!.accept, //'Accept',
                                      textColor: Colors.white,
                                      color: const Color(0xff128383),
                                      onpressed: () {
                                        //TODO code for accept agreement
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const BuyerConfirmation()));
                                      },
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: AppButton(
                                        text: AppLocalizations.of(context)!.reject, //'Reject',
                                        textColor: Colors.white,
                                        color: Colors.grey[400],
                                        onpressed: () {
                                          //TODO code for reject agreement
                                        },
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
            )));
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
