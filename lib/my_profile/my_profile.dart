import 'package:btn_didong/Mau/color.dart';
import 'package:btn_didong/TrangChu/MenuDR.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amberAccent,
        elevation: 0.0,
        title: Text(
          "Tài khoản",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      drawer: MNDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.amberAccent,
              ),
              Container(
                height: 655,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nguyễn Khánh Duy",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("duy.nk.61cntt@ntu.edu.vn"),
                                ],
                              ),
                              // CircleAvatar(
                              //   radius: 15,
                              //   backgroundColor: primaryColor,
                              //   child: CircleAvatar(
                              //     radius: 12,
                              //     child: Icon(
                              //       Icons.edit,
                              //       color: primaryColor,
                              //     ),
                              //     backgroundColor: scaffoldBackgroundColor,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.file_copy_outlined, title: "Giới thiệu"),
                    listTile(
                        icon: Icons.star,
                        title: "Đánh giá"),
                    listTile(
                        icon: Icons.messenger_outline_sharp, title: "Góp ý"),
                    listTile(icon: Icons.add_chart, title: "Điều khoản"),

                    listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: "Đăng suất"),


                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.kindpng.com/picc/m/206-2060399_discord-png-avatar-anime-transparent-png.png"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
