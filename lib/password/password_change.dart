import 'package:seedas/importer.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  TextEditingController _userEmailInputController;
  TextEditingController _oldPasswordInputController;
  TextEditingController _newPasswordInputController;

  bool _showOldPassword;
  bool _showNewPassword;

  @override
  initState() {
    super.initState();
    _userEmailInputController = TextEditingController();
    _oldPasswordInputController = TextEditingController();
    _newPasswordInputController = TextEditingController();

    _showOldPassword = false;
    _showNewPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワードを変更"),
        backgroundColor: Const.utilColor["mild_black"],
      ),
      body: Center(
        child: Form(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    _formTitle(),
                    SizedBox(
                      height: 30,
                    ),
                    _userEmail(),
                    _oldPasswordForm(),
                    _newPassword(),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () {
                        _changePassword();
                      },
                      child: Text("変更する"),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _userEmailInputController.dispose();
    _oldPasswordInputController.dispose();
    _newPasswordInputController.dispose();
  }

  Widget _formTitle() {
    return Text(
      "登録されているメールアドレスと古いパスワードを入力してください",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _userEmail() {
    return TextFormField(
      controller: _userEmailInputController,
      autocorrect: false,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: '現在のメールアドレス',
      ),
    );
  }

  Widget _oldPasswordForm() {
    return TextFormField(
      controller: _oldPasswordInputController,
      autocorrect: false,
      obscureText: !_showOldPassword,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: '古いパスワード',
          suffixIcon: IconButton(
              icon: Icon(_showOldPassword
                  ? FontAwesomeIcons.solidEye
                  : FontAwesomeIcons.solidEyeSlash),
              onPressed: () {
                this.setState(() {
                  _showOldPassword = !_showOldPassword;
                }
                );
              }
          )
      ),
    );
  }

  Widget _newPassword() {
    return TextFormField(
      controller: _newPasswordInputController,
      autocorrect: false,
      obscureText: !_showNewPassword,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: '新しいパスワード',
          suffixIcon: IconButton(
              icon: Icon(_showNewPassword
                  ? FontAwesomeIcons.solidEye
                  : FontAwesomeIcons.solidEyeSlash),
              onPressed: () {
                this.setState(() {
                  _showNewPassword = !_showNewPassword;
                }
                );
              }
          )
      ),
    );
  }

  _changePassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text("パスワード更新中"),
                  )
                ],
              ),
            ),
          );
        });

    var auth = FirebaseAuth.instance;
    var user = await auth.currentUser;

    auth.signInWithEmailAndPassword(
        email: _userEmailInputController.text,
        password: _oldPasswordInputController.text).then((_) {
      user.updatePassword(_newPasswordInputController.text).then((success) {
        Navigator.pop(context);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("パスワードを更新しました"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }).catchError((err) {
        Navigator.pop(context);
        Utils.showErrorDialog(err, context);
      });
    }).catchError((err) {
      Navigator.pop(context);
      Utils.showErrorDialog(err, context);
    });
  }
}