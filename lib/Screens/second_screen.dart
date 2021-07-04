import 'package:flutter/material.dart';
import 'package:my_location/Utils/colors.dart';
import 'package:my_location/Utils/custom_style.dart';
import 'package:my_location/Utils/dimensions.dart';
import 'package:my_location/api_service.dart';
import 'package:my_location/Widgets/back_widget.dart';
import 'package:my_location/Widgets/loading_widget.dart';

import '../author_model.dart';
import '../user_helper.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isLoading = true;
  List<AuthorModel> authorModel;

  @override
  void initState() {
    getData().then((value) {
      if (value != null) {
        authorModel = value;
        setState(() {
          isLoading = false;
        });
      } else {
        authorModel = [];
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.blueColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              BackWidget(name: 'Second Screen', isBack: true),
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 2),
              topRight: Radius.circular(Dimensions.radius * 2),
            )),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        18.0,
                      ),
                      topRight: Radius.circular(
                        18.0,
                      ),
                      bottomLeft: Radius.circular(
                        18.0,
                      ),
                      bottomRight: Radius.circular(
                        18.0,
                      ))),
              width: MediaQuery.of(context).size.width,
              child: (!isLoading)
                  ? GridView.builder(
                      itemCount: authorModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        AuthorModel authorData = authorModel.elementAt(index);
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Image.network(authorData.downloadUrl,
                                    width: 80, height: 80, errorBuilder:
                                        (BuildContext context, Object exception,
                                            StackTrace stackTrace) {
                                  return errorAvatarImage(context, 30, 30);
                                }, fit: BoxFit.cover),
                              ),
                              Text(authorData.author,
                                  style: CustomStyle.defaultStyle)
                            ],
                          ),
                        );
                      },
                    )
                  : kLoadingWidget(context),
            ),
          ],
        )),
      ),
    );
  }
}
