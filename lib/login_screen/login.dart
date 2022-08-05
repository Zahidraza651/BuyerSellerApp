import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seller_side/constants.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/post_login/welcome.dart';
import 'package:seller_side/register_screen/registration.dart';
import 'package:seller_side/widgets/app_button.dart';
import 'package:seller_side/widgets/app_textfield.dart';
import 'package:seller_side/widgets/header_container.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:seller_side/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController(text: '+921234567890');
  TextEditingController password = TextEditingController(text: '123');
  final GlobalKey<FormState> _formKey = GlobalKey(); //form validation key
  String validationTxt = '';
  bool isLoading = false;
  bool isAuth = false;

//getting already logged in info
  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

//loging in
  Future login() async {
    setState(() => isLoading = true);
    String encodedJson =
        jsonEncode(<String, dynamic>{'mobile': email.text, 'password': password.text, 'user_type': '1'});
    final response = await http.post(Uri.parse('$baseUrl/login'),
        body: encodedJson, headers: {'Accept': 'application/json', 'content-Type': 'application/json'});
    setState(() => isLoading = false);

    if (response.statusCode == 200) {
      UserData userData = UserData.fromjson(jsonDecode(response.body));
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      await localStorage.setString('token', jsonEncode(userData.token));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Welcome(
                    userData: userData,
                  )));
    } else {
      _showMsg(
          response.statusCode.toString(),
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
  }

  @override
  void initState() {
    //_checkIfLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppHeader(
              text: AppLocalizations.of(context)!.login, //'Login',
              visible: false,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Column(
              children: [
                isLoading
                    ? const Center(
                        child: Loading(),
                      )
                    : Column(
                        children: [
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30.0),
                                        child: Text(AppLocalizations.of(context)!
                                            .emailIDNumber), //Text('Email/ID Number'),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: ApptextField(controller: email),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30.0),
                                        child: Text(
                                            AppLocalizations.of(context)!.password), //Text('Password'),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: ApptextField(
                                            controller: password,
                                            obscureText: true,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                            if (email.text.isEmpty && password.text.isEmpty) {
                                              setState(() => validationTxt =
                                                  AppLocalizations.of(context)!.emailphone);
                                              _showMsg(
                                                  validationTxt,
                                                  const Icon(
                                                    Icons.close,
                                                    color: Colors.red,
                                                  ));
                                            } else if (password.text.isEmpty) {
                                              setState(() => validationTxt =
                                                  AppLocalizations.of(context)!.phoneOnly);
                                              _showMsg(
                                                  validationTxt,
                                                  const Icon(
                                                    Icons.close,
                                                    color: Colors.red,
                                                  ));
                                            } else if (email.text.isEmpty) {
                                              setState(() => validationTxt =
                                                  AppLocalizations.of(context)!.phoneorEmail);
                                              _showMsg(
                                                  validationTxt,
                                                  const Icon(
                                                    Icons.close,
                                                    color: Colors.red,
                                                  ));
                                            } else {
                                              login();
                                            }
                                          },
                                          text: AppLocalizations.of(context)!.login, //'Login',
                                          textColor: Colors.white,
                                        ),
                                      ))
                                    ],
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            child: Text(
                              AppLocalizations.of(context)!.forgotPassword, //'Forgot Password?',
                              style: const TextStyle(color: Colors.blue),
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            AppLocalizations.of(context)!.newUser, //'New User?',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          InkWell(
                            child: Text(
                              AppLocalizations.of(context)!.registerhere, //'Register here',
                              style: const TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const Registration()));
                            },
                          )
                        ],
                      )
              ], //copy here
            )
          ],
        ),
      ),
    ));
  }

  //for shwing Error messages
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
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
