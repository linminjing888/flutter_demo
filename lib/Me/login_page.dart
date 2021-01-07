import 'package:flutter/material.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';
import 'package:flutter_demo/Support/user_manager.dart';

/// 登录按钮状态
enum ButtonStatus {
  none,
  loading,
  done,
}

class MJLoginPage extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _MJLoginPageState createState() => _MJLoginPageState();
}

class _MJLoginPageState extends State<MJLoginPage> {
  TextEditingController _phoneEdit = TextEditingController();
  TextEditingController _passwordEdit = TextEditingController();
  ButtonStatus _buttonStatus = ButtonStatus.none;

  loginAction() async {
    if (_phoneEdit.text.length == 0) {
      MJToast.show("请输入用户名");
    } else if (_passwordEdit.text.length == 0) {
      MJToast.show("请输入密码");
    } else {
      // print("user:${phoneEdit.text} psw:${passwordEdit.text}");
      setState(() {
        _buttonStatus = ButtonStatus.loading;
      });

      var phone = _phoneEdit.text;
      var psw = _passwordEdit.text;
      try {
        var response = await Request.post(action: "login", params: {
          "phone": phone,
          "psw": psw,
        });
        UserManager.instance.login(response);

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _buttonStatus = ButtonStatus.done;
          });
          Navigator.pop(context);
          // MJToast.show("登陆成功");
        });
      } catch (e) {
        MJToast.show(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登录"),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          // 包裹，防止键盘弹出时出错
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(
                "assets/images/top_bg.jpg",
                height: 100,
              ),
              SizedBox(height: 20),
              _buildContent(),
            ],
          ),
        ));
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25),
          _buildPhone(),
          _buildPassword(),
          SizedBox(height: 30),
          _buildLogin(),
          SizedBox(height: 5),
          _buildRegister(),
        ],
      ),
    );
  }

  Widget _buildPhone() {
    return Container(
      child: TextField(
        controller: _phoneEdit,
        decoration: InputDecoration(
          hintText: "请输入您的用户名",
          hintStyle: TextStyle(color: Colors.black26),
          icon: Image.asset(
            "assets/images/tab_me@2x.png",
            width: 22,
          ), //Icon(Icons.people),
          // 边框在失焦时的颜色
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          // 边框在选中时的颜色
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.red),
          // ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      child: TextField(
        controller: _passwordEdit,
        decoration: InputDecoration(
          hintText: "请输入您的密码",
          hintStyle: TextStyle(color: Colors.black26),
          icon: Image.asset(
            "assets/images/tab_data@2x.png",
            width: 22,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
        obscureText: true, // 密码
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 45,
      child: FlatButton(
        onPressed: loginAction,
        child: _buildLoginChild(),
      ),
    );
  }

  Widget _buildLoginChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return Text(
        "登录",
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
    return Container();
  }

  Widget _buildRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
            onPressed: () {
              MJToast.show("忘记密码？");
            },
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "忘记密码？",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            )),
        FlatButton(
            onPressed: () {
              MJToast.show("注册点击");
            },
            padding: EdgeInsets.only(left: 50),
            child: Text(
              "注册",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ))
      ],
    );
  }
}
