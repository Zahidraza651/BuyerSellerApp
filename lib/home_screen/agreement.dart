import 'dart:convert';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:seller_side/home_screen/confirmation.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/post_login/welcome.dart';
import 'package:seller_side/widgets/loader.dart';
import '../constants.dart';
import '../models/agreement.dart';
import '../models/searchreq.dart';
import '../widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class Agreement extends StatefulWidget {
  final UserData userData;
  final SearchReqData searchData;
  const Agreement({Key? key, required this.userData, required this.searchData}) : super(key: key);

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  String agrrement = '';
  AgrrementTxt? agtext;
  bool isLoading = false;
  String? langValue = 'English';
  var items = ['English', 'Arabic'];

  //accepting agreement
  Future acceptAgreement() async {
    setState(() => isLoading = true);

    var token = widget.userData.token;
    final response = await http.post(Uri.parse('$baseUrl/create_agreement'), headers: {
      //'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      'status': '1'
    });
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      _showMsg(
          '${AppLocalizations.of(context)!.agreement} ${AppLocalizations.of(context)!.accepted}',
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Confirmation(
                    searchData: widget.searchData,
                    userData: widget.userData,
                  )));
    } else {
      _showMsg(
          'Server Error ${response.statusCode}',
          const Icon(
            Icons.close,
            color: Colors.red,
          ));
    }
  }

  //getting agreement txt
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
      agtext = AgrrementTxt.fromJson(jsonDecode(response.body));
      setState(() {
        agrrement = agtext!.data.txt;
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
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Welcome(userData: widget.userData)));
                },
              ),
              actions: [
                InkWell(
                  child: Image.asset('assets/share.png'),
                  onTap: () {
                    Share.share('sharing something');
                  },
                )
              ],
            ),
            body: DoubleBackToCloseApp(
                snackBar: SnackBar(
                  content: Text(AppLocalizations.of(context)!.backagaintoexit),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: isLoading
                        ? const Center(
                            child: Loading(),
                          )
                        : Column(
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
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0))),
                                      isExpanded: true,
                                      isDense: true,
                                      value: langValue,
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        langValue = value;
                                        if (langValue == 'English') {
                                          setState(() {
                                            agrrement = agtext!.data.txt;
                                          });
                                        } else {
                                          setState(() {
                                            agrrement =
                                                'في حالة وجود أي تعارض بين هذه الاتفاقية وأياتفاقية أخرى يكون كلا الطرفين طرفين فيها ، يتشاور الطرفانمع بعضهم البعض بهدف إيجاد حل مرضٍ للطرفين فيوفقا للقانون الدولي العام.';
                                          });
                                        }
                                      },
                                      //value: 'English',
                                      //hint: const Text('English'),
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
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
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
                                            acceptAgreement();
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
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Welcome(userData: widget.userData)));
                                            },
                                          ))),
                                ],
                              )
                            ],
                          ),
                  ),
                ))));
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
