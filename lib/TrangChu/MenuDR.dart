import 'package:btn_didong/Search/TimKiem.dart';
import 'package:btn_didong/TacPham/Xem.dart';
import 'package:btn_didong/TrangChu/TrangChu.dart';
import 'package:btn_didong/my_profile/my_profile.dart';
import 'package:flutter/material.dart';

import '../yeuThich/TrangYeuThich.dart';

// import '../cloud_firestore/page_home_friebase_app.dart';

class MNDrawer extends StatefulWidget {
  const MNDrawer({Key? key}) : super(key: key);

  @override
  State<MNDrawer> createState() => _MNDrawerState();
}

class _MNDrawerState extends State<MNDrawer> {
  Widget listTile(
      {IconData? icon, required String title, required Null Function() onTap,}) {
    return ListTile(
      onTap: onTap,
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => MyProfile(),
      //     ),
      //   );
      // },
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amberAccent,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage('https://www.kindpng.com/picc/m/206-2060399_discord-png-avatar-anime-transparent-png.png'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Chào Duy"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text("Đăng Nhập"),

                          // shape: RoundedRectangleBorder(
                          //
                          // )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            listTile(
              icon: Icons.home_outlined,
              title: "Trang chủ",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TrangChu(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.perm_identity,
              title: "Tài khoản",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.favorite,
              title: "Yêu thích",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCartPage(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.search,
              title: "Tìm kiếm",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
            ),
            // listTile(
            //   icon: Icons.remove_red_eye_rounded,
            //   title: "Tiến Hóa Cuồng",
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => XemChiTiet(
            //             productImage:
            //             'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3566-cover-175x238.jpg.webp',
            //             productName: 'Tiến Hóa Cuồng',
            //             productND: 'Sau khi Đoạn Phi ở kiếp trước chết đi thì không ngờ lại trọng sinh về 20 năm trước, ngay trước mấy tiếng then chốt khi tai họa tiến tới. Chuyện mà 20 năm qua Đoạn Phi hối hận cuối cùng cũng có thể cứu vãn, lợi dụng kiến thức của kiếp trước để trang…',
            //
            //         ),
            //       ),
            //     );
            //   },
            // ),
            // listTile(
            //   icon: Icons.remove_red_eye_rounded,
            //   title: "Tiến Hóa Cuồng",
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => XemChiTiet(
            //             productImage:
            //             'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3566-cover-175x238.jpg.webp',
            //             productName: 'Tiến Hóa Cuồng',
            //             productND: 'Sau khi Đoạn Phi ở kiếp trước chết đi thì không ngờ lại trọng sinh về 20 năm trước, ngay trước mấy tiếng then chốt khi tai họa tiến tới. Chuyện mà 20 năm qua Đoạn Phi hối hận cuối cùng cũng có thể cứu vãn, lợi dụng kiến thức của kiếp trước để trang…',
            //
            //         ),
            //       ),
            //     );
            //   },
            // ),
            // listTile(
            //   icon: Icons.remove_red_eye_rounded,
            //   title: "Tiến Hóa Cuồng",
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => XemChiTiet(
            //           productImage:
            //           'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3566-cover-175x238.jpg.webp',
            //           productName: 'Tiến Hóa Cuồng',
            //           productND: 'Sau khi Đoạn Phi ở kiếp trước chết đi thì không ngờ lại trọng sinh về 20 năm trước, ngay trước mấy tiếng then chốt khi tai họa tiến tới. Chuyện mà 20 năm qua Đoạn Phi hối hận cuối cùng cũng có thể cứu vãn, lợi dụng kiến thức của kiếp trước để trang…',
            //
            //         ),
            //       ),
            //     );
            //   },
            // ),
            // listTile(icon: Icons.home_outlined, title: "Home"),
            // listTile(icon: Icons.home_outlined, title: "Home"),
            // listTile(icon: Icons.home_outlined, title: "Home"),
            // listTile(icon: Icons.home_outlined, title: "Home"),
            // listTile(icon: Icons.home_outlined, title: "Home"),
            // listTile(icon: Icons.home_outlined, title: "Home"),
          ],
        ),
      ),
    );
  }
}
