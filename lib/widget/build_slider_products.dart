import 'package:btn_didong/TacPham/Xem.dart';
import 'package:btn_didong/my_profile/class_the_loai.dart';
import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:flutter/material.dart';
import 'oneTr.dart';

Widget buidProduct(
    {required BuildContext context,
    required List<truyen> listT,
    required theloai tl
      }) {
  return listT.where((e) => e.MaTL == tl.MaTL).length >= 1
      ? Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tl.TenTL),
                  InkWell(
                    // onTap: (){
                    //   Navigator.of(context).push(
                    //       MaterialPageRoute(builder: (context) => XemChiTiet(tr: tl,),)
                    //   );
                    // },
                    child: const Text(
                      "Tất cả",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: listT.where((e) => e.MaTL == tl.MaTL).map(
                  (e) {
                    return HTTruyen(
                      tr: e,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => XemChiTiet(tr: e),
                        ),
                      ),
                    );
                  },
                ).toList()),
              ),
            ),
          ],
        )
      : SizedBox(
          height: 0.1,
        );
  // : const SizedBox(height: 0.1,);
}
