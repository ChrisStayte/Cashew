import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

class BillListItem extends StatelessWidget {
  const BillListItem({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/section',
          arguments: bill.title,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar(
            //   backgroundColor: Global.colors.darkIconColor,
            //   child: FaIcon(
            //     bill.icon ?? FontAwesomeIcons.fileInvoiceDollar,
            //     color: Colors.white,
            //   ),
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            Expanded(
                child: AutoSizeText(
              bill.title,
              maxLines: 3,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${bill.cost}',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  bill.getNextPaymentDate(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}