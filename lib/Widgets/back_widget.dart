import 'package:flutter/material.dart';
import 'package:my_location/utils/dimensions.dart';
import 'package:my_location/utils/strings.dart';

class BackWidget extends StatefulWidget {
  final String name;
  final bool isBack;

  const BackWidget({Key key, this.name, this.isBack}) : super(key: key);

  @override
  _BackWidgetState createState() => _BackWidgetState();
}

class _BackWidgetState extends State<BackWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: (widget.isBack)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                Strings.back,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                : SizedBox(),
          ),
        ),
        Container(
          height: 70,
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
