import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seller_side/constants.dart';
import 'package:seller_side/home_screen/home.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/post_login/welcome.dart';
import 'package:seller_side/widgets/app_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:seller_side/widgets/loader.dart';
import '../widgets/app_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class RegisterData extends StatefulWidget {
  final String phone;
  final String countryName;
  const RegisterData({Key? key, required this.phone, required this.countryName}) : super(key: key);

  @override
  State<RegisterData> createState() => _RegisterDataState();
}

class _RegisterDataState extends State<RegisterData> {
  TextEditingController fName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController iqama = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey(); //form validation key
  bool isLoading = false;
  //List<UserData> userData = [];
  File? img;

  //hitting api for registration

  Future _registerUser() async {
    setState(() => isLoading = true);
    Map<String, String> headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/seeker/registration'));
    request.fields['name'] = fName.text;
    request.fields['nic_passport'] = 'TW78877';
    request.fields['gender'] = 'Male';
    request.fields['email'] = email.text;
    request.fields['password'] = password.text;
    request.fields['language'] = 'en';
    request.fields['mobile'] = widget.phone;
    request.fields['country_id'] = widget.countryName;
    request.headers.addAll(headers);

    var pic = await http.MultipartFile.fromPath('photo', img!.path);

    request.files.add(pic);

    final response = await request.send();
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      final res = jsonDecode(String.fromCharCodes(await response.stream.toBytes()));
      if (res['success']) {
        UserData user = UserData.fromjson(res);
        _showMsg(
            'Successfully Loged in',
            const Icon(
              Icons.check,
              color: Colors.green,
            ));
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Welcome(
                      userData: user,
                    )));
      } else {
        _showMsg(
            res['validation_errors'].toString(),
            const Icon(
              Icons.check,
              color: Colors.green,
            ));
      }
    } else {
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
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 35.0),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff1AA6DC), Color(0xff13888E)])),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                                    child: Visibility(
                                        child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    )),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0, top: 2.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.register, //'Register',
                                      style: const TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ))),
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
                                  File(img!.path),
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        onTap: () async {
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
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                isLoading
                    ? const Loading()
                    : Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(AppLocalizations.of(context)!.fullName), //Text('Full Name'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                                child: ApptextField(
                                  controller: fName,
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(AppLocalizations.of(context)!.email), //Text('Email'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                                child: ApptextField(
                                  controller: email,
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(AppLocalizations.of(context)!.iDIqama), //Text('ID/Iqama'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                                child: ApptextField(
                                  controller: iqama,
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(AppLocalizations.of(context)!.password), //Text('Password'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                                child: ApptextField(
                                  controller: password,
                                  obscureText: true,
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
                                        fName.text.isNotEmpty &&
                                        email.text.isNotEmpty &&
                                        iqama.text.isNotEmpty &&
                                        password.text.isNotEmpty) {
                                      _registerUser();
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
                                  text: AppLocalizations.of(context)!.register, //'Register',
                                  textColor: Colors.white,
                                ),
                              ))
                            ],
                          ),
                        ],
                      )
              ],
            )
          ],
        ),
      )),
    ));
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
                        img = File(image.path);
                      });
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () async {
                  final images = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (images == null) {
                    return;
                  } else {
                    setState(() {
                      img = File(images.path);
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
