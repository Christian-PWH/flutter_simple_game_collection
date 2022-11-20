import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    final VoidCallback? onOkPressed}) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(title),
      content: SizedBox(
        height: 300.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(content),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () => onOkPressed!(),
          child: SizedBox(
            width: 75.0,
            height: 25.0,
            child: Center(
              child: Text(
                defaultActionText,
                style: kElevatedButtonTextStyle,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
