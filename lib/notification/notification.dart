<<<<<<< HEAD
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/alert.dart';
import '../models/user.dart';
import '../widgets/Notificationwidget.dart';

class NotificationScreen extends StatefulWidget {
  final UserData userData;
  const NotificationScreen({Key? key,required this.userData}) : super(key: key);
=======
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
<<<<<<< HEAD

  int listItem = 0;
  AlertModel? model;
  bool isLoading = false;
  Future getAlertData() async {
    setState(() => isLoading = true);

    var token = widget.userData.token;
    final response = await http.get(
      Uri.parse('$baseUrl/alerts'),
      headers: {
        //'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.body);
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      setState((){
        model = AlertModel.fromJson(jsonDecode(response.body));
        listItem = model!.data.length;
      });


    } else {
      _showMsg(
          'Server Error ${response.statusCode}',
          const Icon(
            Icons.close,
            color: Colors.red
          ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlertData();
  }



=======
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(18.0),
<<<<<<< HEAD
            child: Column(
        children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.alerts, //'Alerts',
                    style:
                        const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Text(
                      AppLocalizations.of(context)!.clearAll, //'Clear All',
                      style: const TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      //TODO for clear notifications
                    },
                  )
                ],
              ),
          Expanded(
            child: ListView.builder(
              itemCount: listItem,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return NotificationList(title: model!.data[index].title!,created_at: model!.data[index].createdAt!,
                description: model!.data[index].description!,status: model!.data[index].status!,);
              },
              // children: [
              //

              // ],
            ),
          ),
        ],
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
=======
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.alerts, //'Alerts',
                  style:
                      const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.clearAll, //'Clear All',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    //TODO for clear notifications
                  },
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
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
                          Container(
                              height: 30,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                              child: const Center(
                                child: Text(
                                  '22/07/2022 - 09-21 PM',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.unread, //'Unread',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              AppLocalizations.of(context)!.alertTitle, //'Alert Title',
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
                              child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis risus mi. ',
                              //overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.only(top: 15.0),
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
                          Container(
                              height: 30,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                              child: const Center(
                                child: Text(
                                  '22/07/2022 - 09-21 PM',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              AppLocalizations.of(context)!.alertTitle, //'Alert Title',
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
                              child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis risus mi. ',
                              //overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
}
