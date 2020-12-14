import 'package:flutter/cupertino.dart';
import 'package:seedas/importer.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEdit createState() => _ProfileEdit();
}

class _ProfileEdit extends State {
  String name = '';
  String date = '';
  String job = '';
  String member = '';
  String message = '';
  String goal = '';

  final currentUserUid = FirebaseAuth.instance.currentUser.uid;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<int> showCupertinoBottomBar() {
    //選択するためのボトムシートを表示
    return showCupertinoModalPopup<int>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            message: Text('写真をアップロードしますか？'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(
                  'カメラで撮影',
                ),
                onPressed: () {
                  Navigator.pop(context, 0);
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  'アルバムから選択',
                ),
                onPressed: () {
                  Navigator.pop(context, 1);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('キャンセル'),
              onPressed: () {
                Navigator.pop(context, 2);
              },
              isDefaultAction: true,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('お店形態'),
        ),
        body: Form(
          key: _formKey,
          child: Center(
              child: ListView(children: [
            const SizedBox(height: 20),
            // 入力項目
            TextFormField(
              validator: (name) {
                if (name.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (name) {
                this.name = name;
              },
              onSaved: (name) => this.name = name,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.emoji_people),
                ),
                labelText: '店名',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (date) {
                if (date.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (date) {
                this.date = date;
              },
              onSaved: (date) => this.date = date,
              decoration: InputDecoration(
                labelText: '開店日',
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.emoji_people),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (job) {
                this.job = job;
              },
              onSaved: (job) => this.job = job,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.apartment),
                ),
                labelText: 'Job',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (member) {
                this.member = member;
              },
              onSaved: (member) => this.member = member,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.account_box_outlined),
                ),
                labelText: '人数',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (message) {
                this.message = message;
              },
              onSaved: (message) => this.message = message,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.comment),
                ),
                contentPadding: const EdgeInsets.all(30.0),
                labelText: 'Comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (goal) {
                this.goal = goal;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSaved: (goal) => this.goal = goal,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.star_border_purple500_outlined),
                ),
                labelText: 'Goal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: const Padding(
                padding: const EdgeInsets.only(
                    right: 12, left: 12, top: 14, bottom: 14),
                child: Text(
                  '画像をアップロード',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                  ),
                ),
              ),
              onPressed: () {
                print('画像アップロード');
              },
            ),
            const SizedBox(height: 20),
            // ボタン表示
            RaisedButton(
              child: Text(
                '登録',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
              onPressed: () async {
                SaveData();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RootWidget()),
                    (_) => false);
              },
            )
          ])),
        ));
  }

  Future<void> SaveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserUid)
            .update({
          'date': date,
          'member': member,
          'goal': goal,
          'job': job,
          'message': message,
          'name': name,
        });
      } catch (e) {
        print("Error");
      }
    }
  }
}
