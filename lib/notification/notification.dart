import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(18.0),
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
}
