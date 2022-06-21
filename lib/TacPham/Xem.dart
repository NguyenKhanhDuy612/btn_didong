

import 'package:flutter/material.dart';
import 'package:btn_didong/Mau/color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../my_profile/class_truyen.dart';
import '../yeuThich/yeuThich.dart';

class XemChiTiet extends StatefulWidget {
  truyen tr;

  XemChiTiet({Key? key, required this.tr}) : super(key: key);

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

  late truyen tr;

  @override
  void initState() {
    tr = widget.tr;
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    ReviewCartProvider provider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: (){
              provider.addReviewCart(
                AnhT: tr.AnhT,
                TenT: tr.TenT,
              );
              provider.fetchReviewCartData();

              Fluttertoast.showToast(
                  msg: "Đã thêm ${tr.TenT} vào danh sách yêu thích",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.amberAccent,
                  textColor: Colors.black87,
                  fontSize: 16.0
              );

            },
            child: SingleChildScrollView(
              child: Container(
                width: width,
                height:40 ,

                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.amberAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      child: Text("Thêm vào yêu thích",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // btNaBar(
          //   bgCL: Colors.amberAccent,
          //   cl: Colors.black,
          //   iconCL: Colors.red,
          //   title: "Thêm vào yêu thích",
          //   iconData: Icons.favorite,
          //
          // ),

        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Truyện",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child:
        Column(
          children: [

            Expanded(
              // flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    // ),
                    Container(
                      height: 250,
                      width: 500,
                      // padding: EdgeInsets.all(40),
                      child: Image.network(tr.AnhT!),
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          tr.TenT!.toUpperCase(),
                          style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600 ),
                        ),
                      ),
                    ),
                    Text(
                      "Tóm tắt truyện",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        tr.NdT!,
                        // "Ngô Kỳ, một sát thủ truyền kỳ lỡ tay bị giết, người sát hại mình là ai cũng không biết. Hệ thống Sát Ý bất ngờ xuất hiện trước mặt hắn, chỉ cần hắn hoàn thành nhiệm vụ là giúp hắn hồi sinh, và cho hắn biết chân tướng về cái chết của hắn. Ngô…",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
