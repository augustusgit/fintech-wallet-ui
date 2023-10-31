import 'package:balance/utils/next_screen.dart';
import 'package:balance/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/balances.dart';
import '../utils/currency_symbol.dart';
import '../widgets/balance_list.dart';
import 'balance.dart';


class AddTransactionScreen extends StatefulWidget {
  static var tag = "/AddTransactionScreen";
  const AddTransactionScreen(this.vendorName, {super.key});

  final String vendorName;

  @override
  AddTransactionScreenState createState() => AddTransactionScreenState();
}

class AddTransactionScreenState extends State<AddTransactionScreen> {
  // late List<Theme3Dish> mListings;
  bool isLoading = false;
  List<String> inputList = [];

  List<Object> list = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    ".",
    "0",
    const Icon(Icons.arrow_back),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    double widthMax = MediaQuery.of(context).size.width;
    double heightMax = MediaQuery.of(context).size.height;

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
                    height: (context.height()) / 6.8,
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[Color(0xFF40D3F2), Color(0xFF40D3F2)]),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
                    ),
                  ),
                  Container(
                    height: (context.height()) / 7,
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[Color(0xFF4960F9), Color(0xFF1937FE)]),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
                    ),
                  ),
                  BalanceAppBar(titleName: widget.vendorName, showBack: true, showTitle: true,),
                ],
              ),

              SizedBox(height: heightMax * 0.1),

              const Text('Enter amount', style: TextStyle(color: Color(0xFF2743FE),fontSize: 17),),
              SizedBox(height: heightMax * 0.02),

              inputList.isNotEmpty ? Text('${getCurrency()}${inputList.join()}', style: const TextStyle(color: Color(0xFF2743FE),fontSize: 35, fontWeight: FontWeight.bold),) :
              Container(
                margin: EdgeInsets.only(left: widthMax * 0.43),
                child: Row(
                  children: [
                    Text(getCurrency(), style: const TextStyle(color: Color(0xFF2743FE),fontSize: 35, fontWeight: FontWeight.bold),),
                    const Text('0', style: TextStyle(color: Color(0xFFB6BFFF),fontSize: 35, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: heightMax * 0.01),
              SizedBox(
                width: widthMax * 0.5,
                  child: Divider(),
              ),
              SizedBox(height: heightMax * 0.01),
              const Text('To', style: TextStyle(color: Color(0xFF2743FE),fontSize: 17),),
              SizedBox(height: heightMax * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover, scale: 4,),
                  ),
                  SizedBox(width: widthMax * 0.03),
                  const Text('John Doe', style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 17, fontFamily: 'Montserrat'),),


                ],
              ),

              SizedBox(height: heightMax * 0.04),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                // height: heightMax * .4,
                width: widthMax,
                child: GridView.builder(
                    itemCount: list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    // to disable GridView's scrolling
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 5,
                      childAspectRatio: (1.5 / 1),
                    ),
                    itemBuilder: (context, i) {
                      return categoryCustom(list[i]);
                    }),
              ),
              SizedBox(height: heightMax * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCustom(Object object) {
    double widthMax = MediaQuery.of(context).size.width;
    double heightMax = MediaQuery.of(context).size.height;
    if (object.runtimeType == String) {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              if(inputList.isEmpty && object.toString() == "."){
                inputList.add("0");
                inputList.add(".");
                return;
              }
              inputList.add(object.toString());
              // print(currentIndex);
              // otpList[currentIndex].text = object.toString();
              // if (currentIndex != 5) {
              //   currentIndex = currentIndex + 1;
              //   swapColor = kPrimaryColor.withOpacity(.5);
              // } else if (currentIndex == 5 && getOTP(otpList) != "Wrong") {
              //   swapColor = kPrimaryColor;
              // }
            });
          },
          child: Container(
            width: widthMax * 0.25,
            height: heightMax * 0.08,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              shape: BoxShape.rectangle,
              boxShadow: const <BoxShadow>[
                BoxShadow(color: Color(0x95E9EBF0), blurRadius: 2.5, spreadRadius: 2.5),
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                object.toString(),
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2743FE),),
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          width: widthMax * 0.25,
          height: heightMax * 0.08,
          decoration: BoxDecoration(
            color: const Color(0xFF2743FE),
            shape: BoxShape.rectangle,
            boxShadow: const <BoxShadow>[
              BoxShadow(color: Color(0x95E9EBF0), blurRadius: 2.5, spreadRadius: 2.5),
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
            child: IconButton(
              icon: Image.asset("assets/icons/arrowforward.png", width: 30),
              // color: const Color(0xFFffffff),
              onPressed: () {
                nextScreen(context, const BalanceScreen("Transaction"),);
              },
            ),
            // child: const Icon(Icons.arrow_forward, color: Color(0xFFFEFEFE),),
        ),
      );
    }
  }

}

