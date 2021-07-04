import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget kLoadingWidget(context) => Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Center(child: CircularProgressIndicator()),
    );
