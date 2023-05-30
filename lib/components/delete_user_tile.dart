import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteUserTile extends StatelessWidget {
  const DeleteUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: SvgPicture.asset('images/user_delete.svg'),
      title: Text(
        '탈퇴하기',
        style: TextStyle(fontSize: 22, color: Colors.red),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('탈퇴'),
          // content: Text('[${task.title}]를 삭제하시겠습니까?'),
          content: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '정말 탈퇴하시겠습니까?\n\n'),
                TextSpan(
                    text: '*회원님의 데이터는 탈퇴 즉시 모두 소멸되며 복구 불가능합니다.',
                    style: TextStyle(color: Colors.black54)),
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
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text(
                '탈퇴',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
