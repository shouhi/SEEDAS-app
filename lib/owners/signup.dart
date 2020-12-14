import 'package:seedas/importer.dart';
import 'package:flutter/cupertino.dart';

// import 'package:seedas/shared/globals.dart';
// import 'package:pro_task/root.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  bool _showPassword;

  @override
  initState() {
    super.initState();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();

    _showPassword = false;

    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailInputController.dispose();
    pwdInputController.dispose();
    super.dispose();
  }

  // e-Mailバリデーション
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return '正しいEmailのフォーマットで入力してください';
    } else {
      return null;
    }
  }

  // passwordバリデーション
  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    } else {
      return null;
    }
  }

  void errorDialog(err) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("アカウント作成に失敗しました"),
          content: Text(err.toString()),
          actions: <Widget>[
            // ボタン領域
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  // アカウント登録
  void registeUser() {
    if (_signupKey.currentState.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailInputController.text,
              password: pwdInputController.text)
          .then((result) => {
            FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              'date': '',
              'member': '',
              'goal': '',
              'job': '',
              'message': '',
              'name': '',
            }),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileEdit()),
                    (_) => false),
                emailInputController.clear(),
                pwdInputController.clear(),
              })
          .catchError((err) {
        Utils.showErrorDialog(err, context);
      })
         .catchError((err) {
        Utils.showErrorDialog(err, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset('assets/Icon/coffee_time.png'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _signupKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: 'メールアドレス*'),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFormField(
                        controller: pwdInputController,
                        obscureText: !_showPassword,
                        validator: pwdValidator,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'パスワード*',
                          suffixIcon: IconButton(
                              icon: Icon(_showPassword
                                  ? FontAwesomeIcons.solidEye
                                  : FontAwesomeIcons.solidEyeSlash),
                              onPressed: () {
                                this.setState(() {
                                  _showPassword = !_showPassword;
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      registeUser();
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "アカウント作成",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                          (_) => false);
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "ログイン",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
