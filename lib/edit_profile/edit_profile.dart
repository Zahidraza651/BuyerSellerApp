import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:seller_side/models/user.dart';
import 'dart:io';
import '../constants.dart';
import '../widgets/app_button.dart';
import '../widgets/app_textfield.dart';
import 'package:http/http.dart' as http;

class Update_User extends StatefulWidget {
  final UserData userData;
  const Update_User({Key? key, required this.userData}) : super(key: key);

  @override
  State<Update_User> createState() => _Update_UserState();
}

class _Update_UserState extends State<Update_User> {
  TextEditingController fname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController language = TextEditingController();
  File? img;
  bool isLoading = false;
  Future _updateUser() async {
    setState(() => isLoading = true);
    var token = widget.userData.token;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/update'));
    request.fields['name'] = fname.text;
    request.fields['nic_passport'] = 'TW78877';
    request.fields['gender'] = gender.text;
    request.fields['email'] = 'waqasahm@gmail.com';
    request.fields['password'] = 'password';
    request.fields['language'] = language.text;
    request.fields['mobile'] = 'phone';
    request.fields['country_id'] = 'countryName';
    request.headers.addAll(headers);

    var pic = await http.MultipartFile.fromPath('photo', img!.path);

    request.files.add(pic);

    final response = await request.send();
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      final res = jsonDecode(String.fromCharCodes(await response.stream.toBytes()));
      if (res['success']) {
        UpdateUser user = UpdateUser.fromJson(res);
        _showMsg(
            'Successfully Updated',
            const Icon(
              Icons.check,
              color: Colors.green,
            ));
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        _showMsg(
            res['validation_errors'].toString(),
            const Icon(
              Icons.check,
              color: Colors.green,
            ));
      }
    } else {
      print(response.statusCode);
      _showMsg(
          'Server Error ${response.statusCode}',
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: img == null
                      ? ClipOval(
                          child: Image.asset(
                            'assets/profile.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        )
                      : ClipOval(
                          child: Image.file(
                            img!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                  onTap: () async {
                    await Permission.photos.request();

                    var permissionStatus = await Permission.photos.status;
                    if (permissionStatus.isGranted) {
                      final image = await FilePicker.platform.pickFiles();
                      if (image == null) {
                        return;
                      }
                      setState(() {
                        img = File(image.files.single.path!);
                      });
                    } else {
                      _showMsg(
                          'cant access your gallery',
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ));
                    }
                  },
                )),
            SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Text(AppLocalizations.of(context)!.fullName), //Text('Full Name'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                  child: ApptextField(
                    controller: fname,
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Text(AppLocalizations.of(context)!.gender), //Text('Email'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                  child: ApptextField(
                    controller: gender,
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Text(AppLocalizations.of(context)!.updateLanguage), //Text('ID/Iqama'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                  child: ApptextField(
                    controller: language,
                  ),
                ))
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
                      if (img != null &&
                          fname.text.isNotEmpty &&
                          gender.text.isNotEmpty &&
                          language.text.isNotEmpty) {
                        _updateUser();
                      } else {
                        _showMsg(
                            'provide all fiels & pick an image',
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                            ));
                      }

                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => const Welcome()));
                    },
                    text: AppLocalizations.of(context)!.update, //'Register',
                    textColor: Colors.white,
                  ),
                ))
              ],
            ),
          ],
        ),
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
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
