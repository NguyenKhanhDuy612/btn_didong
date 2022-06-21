import 'package:btn_didong/TacPham/Xem.dart';
import 'package:btn_didong/TacPham/catogery.dart';
import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:flutter/material.dart';

import '../my_profile/class_the_loai.dart';

class TruyenPage extends StatelessWidget {
  // const TruyenPage({Key? key}) : super(key: key);
  List<truyen> listT;
  theloai tl;
  TruyenPage({Key? key, required this.listT, required this.tl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tl.TenTL),
      ),
      body: GridView(
          padding: const EdgeInsets.all(10),
          children: listT.where((element) => element.MaTL == tl.MaTL).map((e) => XemChiTiet( tr: e,)).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10

          )
      ),
    );
  }
}
