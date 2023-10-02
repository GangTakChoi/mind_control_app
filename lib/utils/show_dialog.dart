import 'package:flutter/material.dart';
import 'package:mind_control/utils/loading.dart';

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

Future<dynamic> showDialogConfirm(context, Function onPressed,
    {title = String, content = String, actionText = String}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: content),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            '취소',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            LoadingBar.show(context);
            await onPressed();
            LoadingBar.down(context);
            Navigator.pop(context, 'Ok');
          },
          child: Text(
            actionText,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
