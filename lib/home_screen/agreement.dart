<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:seller_side/home_screen/confirmation.dart';
import '../widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Agreement extends StatefulWidget {
  const Agreement({Key? key}) : super(key: key);
=======
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seller_side/home_screen/confirmation.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/post_login/welcome.dart';
import '../constants.dart';
import '../models/agreement.dart';
import '../widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class Agreement extends StatefulWidget {
  final UserData userData;
  const Agreement({Key? key, required this.userData}) : super(key: key);
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
<<<<<<< HEAD
=======
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Confirmation()));
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

>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                AppLocalizations.of(context)!.agreement, //'Agreement',
<<<<<<< HEAD
                style: const TextStyle(color: Colors.black),
=======
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
<<<<<<< HEAD
                  onTap: () {},
=======
                  onTap: () {
                    Share.share('sharing something');
                  },
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                )
              ],
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
<<<<<<< HEAD
                            items: null,
                            onChanged: null,
                            //value: 'English',
                            hint: const Text('English'),
=======
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
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
<<<<<<< HEAD
                      children: const [
                        Expanded(
                            child: Text(
                          'Vestibulum blandit viverra convallis. Pellentesque ligula urna, fermentum ut semper in, tincidunt nec dui. Morbi mauris lacus, consequat eget justo in, semper gravida enim. Donec ultrices varius ligula. Ut non pretium augue. Etiam non rutrum metus. In varius sit amet lorem tempus sagittis. Cras sed maximus enim, vel ultricies tortor. Pellentesque consectetur tellus ornare felis porta dapibus. Etiam eget viverra ipsum, ac posuere massa. Nam vitae tempor metus. Donec rhoncus, metus ac convallis ultricies, turpis augue vestibulum elit, ut pharetra orci urna quis lectus. Praesent in libero non enim tincidunt imperdiet nec vitae urna. Morbi elementum non enim eget aliquet. Vivamus fermentum quam magna, ac cursus neque pulvinar feugiat. Nulla facilisi.Donec ultrices varius ligula. Ut non pretium augue. Etiam non rutrum metus. In varius sit amet lorem tempus sagittis. Cras sed maximus enim, vel ultricies tortor. Pellentesque consectetur tellus ornare felis porta dapibus.',
                          style: TextStyle(
=======
                      children: [
                        Expanded(
                            child: Text(
                          agrrement,
                          style: const TextStyle(
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const Confirmation()));
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
<<<<<<< HEAD
                                    //TODO code for reject agreement
=======
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Welcome(userData: widget.userData)));
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                                  },
                                ))),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
<<<<<<< HEAD
=======

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
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
}
