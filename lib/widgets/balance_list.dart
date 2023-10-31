import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/balances.dart';



class BalanceList extends StatelessWidget {

  final Balance balanceItem;

  const BalanceList(this.balanceItem, int pos, {super.key,});

  @override
  Widget build(BuildContext context) {



    return Container(
      width: 285,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Container(
        margin: EdgeInsets.only(left: 46.0),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0x95E9EBF0), blurRadius: 5.5, spreadRadius: 5.5),
          ],
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(balanceItem.type!, style: primaryTextStyle(color: const Color(0xFF3A3A3A),), maxLines: 2),
              SizedBox(height: 40),
              SizedBox(
                width: 130,
                  child: Text("₦${balanceItem.amount}", style: primaryTextStyle(color: const Color(0xFF3A3A3A), size: 20, weight: FontWeight.bold), overflow: TextOverflow.clip, maxLines: 1,),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}