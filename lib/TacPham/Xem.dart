import 'package:flutter/material.dart';
import 'package:btn_didong/Mau/color.dart';

class XemChiTiet extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productND;

  XemChiTiet({Key? key,required this.productImage,required this.productName,required this.productND}) : super(key: key);



  @override
  State<XemChiTiet> createState() => _XemChiTietState();
}

class _XemChiTietState extends State<XemChiTiet> {
  Widget btNaBar({
    required Color iconCL,
    required Color bgCL,
    required Color cl,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: bgCL,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconCL,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: cl),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          btNaBar(
            bgCL: textColor,
            cl: Colors.white70,
            iconCL: Colors.grey,
            title: "Thêm vào danh sách yêu thích",
            iconData: Icons.favorite,
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Truyện",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.productName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                        widget.productImage),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tóm tắt truyện",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text( widget.productND,
                  // "Ngô Kỳ, một sát thủ truyền kỳ lỡ tay bị giết, người sát hại mình là ai cũng không biết. Hệ thống Sát Ý bất ngờ xuất hiện trước mặt hắn, chỉ cần hắn hoàn thành nhiệm vụ là giúp hắn hồi sinh, và cho hắn biết chân tướng về cái chết của hắn. Ngô…",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),

              ],
            ),
          ),),
        ],
      ),
    );
  }
}
