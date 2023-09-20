import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_control/services/user_service.dart';
import 'package:mind_control/utils/show_dialog.dart';

class DeleteUserTile extends StatelessWidget {
  const DeleteUserTile({
    super.key,
  });

  void deleteMe(context) async {
    UserService userService = UserService();
    final isSuccess = await userService.delete();
    if (isSuccess) {
      await showDialog1(context, title: '탈퇴완료', content: '탈퇴가 완료되었습니다.');
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      await showDialog1(context,
          title: '오류발생',
          content: '탈퇴를 실패하였습니다.\n문제가 지속되는 경우 재 로그인하여 다시 시도해주세요.');
      final storage = FlutterSecureStorage();
      storage.delete(key: 'token');
      Navigator.pop(context);
      return;
    }
  }

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
              onPressed: () async {
                deleteMe(context);
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
