import 'package:balance/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/balances.dart';
import '../widgets/balance_list.dart';
import '../widgets/balance_list2.dart';


class BalanceScreen extends StatefulWidget {
  static var tag = "/BalanceScreen";
  const BalanceScreen(this.vendorName, {super.key});

  final String vendorName;

  @override
  BalanceScreenState createState() => BalanceScreenState();
}

class BalanceScreenState extends State<BalanceScreen> {
  // late List<Theme3Dish> mListings;
  bool isLoading = false;
  final ScrollController _controller = ScrollController();
  List<Balance> balanceType = [Balance("House Balance", "45,000.00"), Balance("School Balance", "40,000.00")];

  @override
  void initState() {
    super.initState();
    // _controller.addListener(() {
    //   var _currectscrollposition = _controller.position.pixels;
    //   print(_currectscrollposition.toString());
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double widthMax = MediaQuery.of(context).size.width;
    double heightMax = MediaQuery.of(context).size.height;
    final List<String> items = List<String>.generate(10, (i) => '$i');

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: (context.height()) / 3,
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[Color(0xFF4960F9), Color(0xFF1937FE)]),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      BalanceAppBar(titleName: widget.vendorName, showBack: true, showTitle: false,),
                       Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthMax * 0.7,
                                child: const Text("You can check your balances here,", style: TextStyle(color: Color(0xFFffffff), fontWeight: FontWeight.bold, fontSize: 25), maxLines: 2,),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: balanceType.length,
                  shrinkWrap: true,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return index.isEven ? BalanceList2(balanceType[index], index) : BalanceList(balanceType[index], index);
                  },
                ),
              ),
              SizedBox(height: heightMax * 0.08),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthMax * 0.7,
                      child: const Text("Recent Transaction", style: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold, fontSize: 25), maxLines: 1,),
                    ),
                  ],
                ),
              ),
              // ListView.builder(
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       leading: CircleAvatar(
              //         backgroundColor: const Color(0xff764abc),
              //         child: Image.asset("assets/icons/wallet.png"),
              //       ),
              //       title: const Text('XYZ Supermarket', style: TextStyle(color: Color(0xFF000000), fontSize: 30),),
              //       subtitle: const Text('15 March 2021, 8:30 pm'),
              //       trailing: const Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Text('-₦12,000', style: TextStyle(color: Color(0xFF000000), fontSize: 30),),
              //           Icon(Icons.more_vert),
              //         ],
              //       ),
              //     );
              //   },
              // )
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffFFCF87),
                  child: Image.asset("assets/icons/wallet.png", width: 22,),
                ),
                title: const Text('XYZ Supermarket', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 19),),
                subtitle: const Text('15 March 2021, 8:30 pm', style: TextStyle(color: Color(0xFFBFBFBF),),),
                trailing: SizedBox(
                  width: widthMax * 0.25,
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('-₦12,000', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 15),),
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF3A3A3A), size: 15),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffE09FFF),
                  child: Image.asset("assets/icons/wallet.png", width: 22,),
                ),
                title: const Text('Finnac Pharmacy', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 19),),
                subtitle: const Text('9 March 2021, 10:00 pm', style: TextStyle(color: Color(0xFFBFBFBF),),),
                trailing: SizedBox(
                  width: widthMax * 0.25,
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('-₦8,950', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 15),),
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF3A3A3A), size: 15),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff87F0FF),
                  child: Image.asset("assets/icons/wallet.png", width: 22,),
                ),
                title: const Text('Goodwill Gym', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 19),),
                subtitle: const Text('3 March 2021, 6:57 pm', style: TextStyle(color: Color(0xFFBFBFBF),),),
                trailing: SizedBox(
                  width: widthMax * 0.25,
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('-₦6,400', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 15),),
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF3A3A3A), size: 15),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffFFCF87),
                  child: Image.asset("assets/icons/wallet.png", width: 22,),
                ),
                title: const Text('XYZ Supermarket', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 19),),
                subtitle: const Text('15 March 2021, 8:30 pm', style: TextStyle(color: Color(0xFFBFBFBF),),),
                trailing: SizedBox(
                  width: widthMax * 0.25,
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('-₦12,000', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 15),),
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF3A3A3A), size: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

