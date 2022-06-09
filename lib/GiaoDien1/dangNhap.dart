import 'package:btn_didong/TrangChu/TrangChu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DangNhap extends StatefulWidget {
  // const DangNhap({Key? key}) : super(key: key);

  @override
  State<DangNhap> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhap> {
  // UserProvider userProvider;
  Future<UserCredential> signWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/bg1.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Vui lòng đăng nhập",
                    style: TextStyle(fontSize: 20, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Text(
                  //   "WELCOM",
                  //   style: TextStyle(
                  //       fontSize: 50,
                  //       color: Colors.white,
                  //       shadows: [
                  //         BoxShadow(
                  //             blurRadius: 5,
                  //             color: Colors.green.shade900,
                  //             offset: Offset(3, 3))
                  //       ]),
                  // ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Google,
                        text: "Đăng nhập bằng Google",
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đăng nhập ...'),
                            ),
                          );
                          // showSnackBar(context,"singning ////",3000);
                          var user = await signWithGoogle();
                          if (user != null) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const TrangChu()),
                                (Route<dynamic> route) => false);
                          } else {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('loi.'),
                                ),
                              );
                            });
                          }
                        },
                      ),
                      // SignInButton(
                      //   Buttons.Email,
                      //   text: "Đăng nhập bằng Email",
                      //   onPressed: () {
                      //     GoogleSignIn().then(
                      //       (value) => Navigator.of(context).pushReplacement(
                      //         MaterialPageRoute(
                      //           builder: (context) => HomeScreen(),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 70,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          "Bằng cách đăng nhập bạn đồng ý với các",
                          style: TextStyle(color: Colors.grey[100], fontSize: 15),
                        ),
                        Text(
                          "Điều khoản và Chính sách Bảo mật của chúng tôi",
                          style: TextStyle(color: Colors.grey[100], fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

