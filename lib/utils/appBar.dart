import 'package:flutter/material.dart';
import 'package:seedas/importer.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Image.asset(
      'assets/Icon/logo.png',
      height: 100,
    ),
    backgroundColor: Const.utilColor["white"],
  );
}