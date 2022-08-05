import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
<<<<<<< HEAD
=======
import 'package:seller_side/models/user.dart';
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

import '../home_screen/invoice.dart';

class Statuswidget extends StatefulWidget {
  final String status;
  final String itemtype;
  final String price;
  final String detail;
<<<<<<< HEAD
=======
  final UserData userData;
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7

  const Statuswidget(
      {Key? key,
      required this.detail,
      required this.itemtype,
      required this.price,
<<<<<<< HEAD
      required this.status})
=======
      required this.status,
      required this.userData})
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
      : super(key: key);

  @override
  State<Statuswidget> createState() => _StatuswidgetState();
}

class _StatuswidgetState extends State<Statuswidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
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
<<<<<<< HEAD
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: Color(0xFFF2CC59), borderRadius: BorderRadius.circular(20.0)),
=======
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: widget.status == 'Pending'
                            ? const Color(0xFFF2CC59)
                            : widget.status == 'Rejected'
                                ? const Color(0xffFF3B3B)
                                : const Color(0xff2CC91F),
                        borderRadius: BorderRadius.circular(20.0)),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                    child: Center(
                      child: Text(
                        widget.status, //'Unread',
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
<<<<<<< HEAD
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
=======
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  child: Text(
                    AppLocalizations.of(context)!.itemtype, //'Alert Title',
                    style: const TextStyle(
                        color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
<<<<<<< HEAD
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
=======
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  child: Text(
                    widget.itemtype, //'Alert Title',
                    style: const TextStyle(
                        color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
<<<<<<< HEAD
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    AppLocalizations.of(context)!.price, //'Alert Title',
=======
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    AppLocalizations.of(context)!.price,
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                    style: const TextStyle(
                        color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
<<<<<<< HEAD
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text(
                    "\$${widget.price}", //'Alert Title',
=======
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text(
                    "\$${widget.price}",
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                    style: const TextStyle(
                        color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
<<<<<<< HEAD
=======
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    AppLocalizations.of(context)!.details,
                    style: const TextStyle(
                        color: Color(0xFF969696), fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.detail,
                    //overflow: TextOverflow.ellipsis,
<<<<<<< HEAD
                    style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
=======
                    style: const TextStyle(
                        color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
                  ),
                ))
              ],
            )
          ],
        ),
      ),
      onTap: () {
<<<<<<< HEAD
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Invoice()));
=======
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Invoice(
                      userdata: widget.userData,
                    )));
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
      },
    );
  }
}
