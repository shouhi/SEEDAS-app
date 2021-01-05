import 'package:flutter/material.dart';
import 'package:seedas/importer.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
Widget drawerMain(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        SizedBox(height: 30),
        Center(
          child: Column(
            children: [
              const Text('設定'),
            ],
          ),
        ),
        Divider(),
        ListTile(
            title: const Text(
              'プロフィール編集',
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                  (_) => false);
            }),
        ListTile(
            title: const Text('パスワード変更'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()),
              );
            }),
        ListTile(
          title: const Text('ログアウト'),
          onTap: () {
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                      title: new Text("ログアウトしますか？"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('キャンセル'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                            child: Text('OK'),
                            onPressed: () async {
                              await _auth.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()),
                                  (_) => false);
                            })
                      ],
                    ));
          },
        ),
      ],
    ),
  );
}
