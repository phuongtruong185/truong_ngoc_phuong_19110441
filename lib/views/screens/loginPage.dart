import 'package:flutter/material.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/homePage.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObsure = true;

  void onLoginClick() {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/profile.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                decoration: InputDecoration(
                  labelText: 'USERNAME',
                  labelStyle: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
             Stack(
               alignment: AlignmentDirectional.centerEnd,
              children:  <Widget>[
                TextField(
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                  obscureText: _isObsure,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      color: Color(0xff888888),
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 10,
                  child: TextButton(
                    child: Text(
                      _isObsure ? 'SHOW' : 'UNSHOW'
                    ),
                    onPressed: () => setState(() {
                      _isObsure = !_isObsure;
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: onLoginClick,
              child: Text("SIGN IN"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 48)

              ),
            )

          ],
        )

    )
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
