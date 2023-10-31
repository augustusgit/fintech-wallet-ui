import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/balances.dart';



class BalanceList2 extends StatelessWidget {

  final Balance balanceItem;

  const BalanceList2(this.balanceItem, int pos, {super.key,});

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: (){},
      child: Container(
        width: 285,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Container(
          margin: EdgeInsets.only(left: 46.0),
          decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            shape: BoxShape.rectangle,
              gradient:  const RadialGradient(
                center: Alignment.center,
                // begin: Alignment.topRight,
                // end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
                colors: [
                  Colors.yellow,
                  Colors.red,
                  Colors.indigo,
                  Colors.teal,
                ],
              ),
            // gradient: LinearGradient(colors: <Color>[Color(0xFF4960F9), Color(0xFF1937FE)]),
            // image: const DecorationImage(image: AssetImage("assets/images/rectangle.png", ), fit: BoxFit.fitWidth,),
            boxShadow: const <BoxShadow>[
              BoxShadow(color: Color(0x95E9EBF0), blurRadius: 2.5, spreadRadius: 2.5),
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
      ),
    );
  }
}