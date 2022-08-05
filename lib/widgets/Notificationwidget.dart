import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class NotificationList extends StatefulWidget {

  final String title;
  final String created_at;
  final String description;
  final String status;

  const NotificationList({Key? key, required this.title, required this.created_at,required this.description,required this.status}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
                  child:  Center(
                    child: Text(widget.created_at,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              if(widget.status==1)
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
                      widget.title, //'Alert Title',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(widget.description,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
