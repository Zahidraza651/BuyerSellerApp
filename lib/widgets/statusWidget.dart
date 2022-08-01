import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../home_screen/invoice.dart';

class Statuswidget extends StatefulWidget {
  final String status;
  final String itemtype;
  final String price;
  final String detail;

  const Statuswidget(
      {Key? key,
      required this.detail,
      required this.itemtype,
      required this.price,
      required this.status})
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
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: widget.status == 'Pending'
                            ? const Color(0xFFF2CC59)
                            : widget.status == 'Rejected'
                                ? const Color(0xffFF3B3B)
                                : const Color(0xff2CC91F),
                        borderRadius: BorderRadius.circular(20.0)),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    AppLocalizations.of(context)!.price,
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
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text(
                    "\$${widget.price}",
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
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.detail,
                    //overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Invoice()));
      },
    );
  }
}
