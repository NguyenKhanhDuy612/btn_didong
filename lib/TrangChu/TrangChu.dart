import 'package:btn_didong/Mau/color.dart';
import 'package:btn_didong/Search/TimKiem.dart';
import 'package:btn_didong/TacPham/Xem.dart';
import 'package:btn_didong/TrangChu/MenuDR.dart';
import 'package:btn_didong/TrangChu/TheLoai.dart';
import 'package:btn_didong/models/product_model.dart';
import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:btn_didong/widget/build_slider_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_profile/class_the_loai.dart';
import '../my_profile/provider.dart';
import '../yeuThich/TrangYeuThich.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({Key? key}) : super(key: key);

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.TLData();
    productProvider.TruyenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context, listen: true);
    List<theloai> listTL = productProvider.getTLtruyen;
    List<truyen> listT = productProvider.getDStruyen;

    return Scaffold(
      // backgroundColor: Color(0xffcbcbcb),
      drawer: MNDrawer(),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Trang chủ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amberAccent,
        actions: [
          // CircleAvatar(
          //   radius: 12,
          //   backgroundColor: Colors.grey,
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => Search(),
          //         ),
          //       );
          //     },
          //     icon: Icon(
          //       Icons.search,
          //       size: 20,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.amberAccent,
                ),
              ),
              // radius: 12,
              // child: Icon(
              //   Icons.favorite,
              //   size: 20,
              //   color: Colors.red,
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ReviewCartPage(),)
                  );
                },
                icon: Icon(
                  Icons.favorite,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              // radius: 12,
              // child: Icon(
              //   Icons.favorite,
              //   size: 20,
              //   color: Colors.red,
              // ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/a1.jpg"))),
            ),

            const Divider(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: productProvider.getTLtruyen
                      .map((e) => buidProduct(
                          context: context,
                      listT: productProvider.getDStruyen, tl: e))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
