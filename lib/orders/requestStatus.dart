import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seller_side/home_screen/home.dart';
import 'package:seller_side/models/requestStatusList.dart';
import 'package:seller_side/models/request_status.dart';
import 'package:seller_side/models/user.dart';
import 'package:seller_side/post_login/welcome.dart';
import 'package:seller_side/widgets/loader.dart';
import 'package:seller_side/widgets/statusWidget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../constants.dart';

class RequestStatusDetail extends StatefulWidget {
  final UserData userdata;
  final String title;
  final String status;
  const RequestStatusDetail(
      {Key? key, required this.status, required this.title, required this.userdata})
      : super(key: key);

  @override
  State<RequestStatusDetail> createState() => _RequestStatusDetailState();
}

class _RequestStatusDetailState extends State<RequestStatusDetail> {
  bool isLoading = false;
  List<RequestStatusList> statusList = [];
  Future getStatusList() async {
    setState(() => isLoading = true);
    var token = widget.userdata.token;
    final response = await http.get(
      Uri.parse('$baseUrl/request-details?status=${widget.status}'),
      headers: {
        //'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    setState(() => isLoading = false);
    if (response.statusCode == 200) {
      setState(() {
        final raw = jsonDecode(response.body)['data'] as List;
        statusList = raw.map((e) => RequestStatusList.fromjson(raw)).toList();
      });
    } else {
      _showMsg(
          response.statusCode.toString(),
          const Icon(
            Icons.close,
            color: Colors.red,
          ));
    }
  }

  @override
  void initState() {
    getStatusList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Welcome(
                                  userData: widget.userdata,
                                )));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: Text(
                widget.title,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: isLoading
                      ? const Center(
                          child: Loading(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: statusList.length,
                          itemBuilder: (contex, index) {
                            return Statuswidget(
                              status: widget.status == '0'
                                  ? 'Pending'
                                  : widget.status == '1'
                                      ? 'Completed'
                                      : 'Rejected',
                              itemtype: statusList[index].requestData[index].item_type.toString(),
                              price: statusList[index].requestData[index].price.toString(),
                              detail: statusList[index].requestData[index].details.toString(),
                            );
                          })),
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
