import 'package:flutter/material.dart';

Future<dynamic> showDialog1(context, {title = String, content = String}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      // content: Text('[${task.title}]를 삭제하시겠습니까?'),
      content: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '$content'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'OK');
          },
          child: const Text(
            '확인',
          ),
        ),
      ],
    ),
  );
}
