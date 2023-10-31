import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BalanceAppBar extends StatefulWidget {
  final String titleName;
  final bool showBack;
  final bool showTitle;

  const BalanceAppBar( {required this.titleName, required this.showBack, required this.showTitle, super.key});

  @override
  State<StatefulWidget> createState() {
    return BalanceAppBarState();
  }
}

class BalanceAppBarState extends State<BalanceAppBar> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: 60,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                widget.showBack ? IconButton(
                  icon: Image.asset("assets/icons/arrowback.png", width: 25),
                  // icon: const Icon(Icons.arrow_back),
                  color: const Color(0xFFffffff),
                  onPressed: () {
                    if(Navigator.canPop(context)){
                      Navigator.pop(context);
                    }
                  },
                ) : Container(),

              ],
            ),
            widget.showTitle ? Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Center(
                child: SizedBox(
                  width: maxWidth * 0.6,
                  child: Text(
                    widget.titleName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: boldTextStyle(size: 18, color: const Color(0xFFffffff)),
                  ),
                ),
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}