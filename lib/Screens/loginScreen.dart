import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _scaffKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController pwdEditingController;
  TextEditingController emailEditingController;
  String macAddress = "";
  bool _obscureText = true;
  String fcmToken = "";

  double clipVal = 0;
  @override
  void initState() {
    super.initState();
    pwdEditingController = TextEditingController(text: "\$Draksh03");
    emailEditingController = TextEditingController(text: "rakeshd");

    getFcmToken();
  }

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    pwdEditingController.dispose();
  }

  Future getFcmToken() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // fcmToken = prefs.getString('fcmToken');
  }

  _login(BuildContext context) {
    // showLoader(context: context);
    // secureBoxApi
    //     .sendOtp(emailEditingController.text.trim(), pwdEditingController.text)
    //     .then((onValue) {
    //   Navigator.of(context).pop();
    //   if (onValue["status"] == 200) {
    //     print("otpSent");
    //     verifyOtpPopup(context);
    //   }
    // }).catchError((error) {
    //   Navigator.of(context).pop();
    //   Fluttertoast.showToast(
    //     msg: error.toString(),
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.BOTTOM,
    //   );
    // });
  }

  void verifyOtpPopup(BuildContext context) {
    bool enableResend = false;
    TextEditingController pinController = TextEditingController(text: "");
    bool enableVerify = false;

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStateOTP) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0xFFF3F7FF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Enter Verification Code",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF585858),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "An OTP is sent to your E-mail ID & Phone Number.",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF585858)),
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: enableResend
                                      ? () {
                                          setStateOTP(() {
                                            enableResend = false;
                                          });
                                        }
                                      : null,
                                  child: Text(
                                    'Resend Code',
                                    style: TextStyle(
                                        color: enableResend
                                            ? Color(0xff14279B)
                                            : Color(0xff14279B).withOpacity(.4),
                                        fontFamily: 'Roboto Medium',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: ElevatedButton(
                                    onPressed: !enableVerify
                                        ? null
                                        : () {
                                            // showLoader(context: context);
                                            // secureBoxApi
                                            //     .login(
                                            //         emailEditingController.text
                                            //             .trim(),
                                            //         pwdEditingController.text,
                                            //         pinController.text,
                                            //         macAddress,
                                            //         fcmToken,
                                            //         context)
                                            //     .then((value) async {
                                            //   var data = value;
                                            //   userBloc
                                            //       .addUser(User.fromJson(data));
                                            //   setSecureBoxLogin(true);
                                            //   print("logged in woooooo!!!!!");
                                            //   Navigator.of(context)
                                            //     ..pop()
                                            //     ..pop();

                                            //   Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           SecureBox(),
                                            //       settings: RouteSettings(
                                            //         name: SecureBox.routeName,
                                            //       ),
                                            //     ),
                                            //   );
                                            // }).catchError((error) {
                                            //   Navigator.of(context).pop();
                                            //   Fluttertoast.showToast(
                                            //     msg: error.toString(),
                                            //     toastLength: Toast.LENGTH_LONG,
                                            //     gravity: ToastGravity.BOTTOM,
                                            //   );
                                            // });
                                          },
                                    child: Text(
                                      'Verify & Continue',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 16.0)),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff14279B)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            );
          });
        });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffKey,
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: Container(
                    child: Transform.rotate(
                  angle: -pi / 3.5,
                  child: ClipPath(
                    clipper: ClipPainter(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffE6E6E6),
                            Color(0xff14279B),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Movie',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff14279B),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Box',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ]),
                        ),
                        SizedBox(height: 50),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "User Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    obscureText: false,
                                    controller: emailEditingController,
                                    maxLength: 64,
                                    // validator: (str) =>
                                    //     sChooseValidator(UserName, str),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      counterText: "",
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      obscureText: _obscureText,
                                      controller: pwdEditingController,
                                      // validator: (str) =>
                                      //     sChooseValidator(Password, str),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true,
                                        suffixIcon: IconButton(
                                          icon: _obscureText
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off),
                                          onPressed: _toggle,
                                          color: Colors.grey,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              _login(context);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xff14279B),
                                  Color(0xff14279B),
                                ],
                              ),
                            ),
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHome(),
                                  ),
                                );
                              },
                              child: Text('Skip LogIn ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                        ),
                        SizedBox(height: height * .055),
                        Visibility(
                          visible: false,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Don\'t have an account ?',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Color(0xff14279B),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 0, top: 10, bottom: 10),
                          child: Icon(Icons.keyboard_arrow_left,
                              color: Colors.black),
                        ),
                        Text('Back',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
