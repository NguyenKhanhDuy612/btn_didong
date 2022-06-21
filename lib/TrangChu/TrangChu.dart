import 'package:btn_didong/Mau/color.dart';
import 'package:btn_didong/Search/TimKiem.dart';
import 'package:btn_didong/TacPham/Xem.dart';
import 'package:btn_didong/TrangChu/MenuDR.dart';
import 'package:btn_didong/TrangChu/TheLoai.dart';
import 'package:btn_didong/models/product_model.dart';
import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:btn_didong/provider/product_provider.dart';
import 'package:btn_didong/widget/build_slider_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_profile/class_the_loai.dart';
import '../my_profile/provider.dart';

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
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        backgroundColor: Colors.amberAccent,
        actions: [
          CircleAvatar(
            radius: 12,
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
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 12,
              child: Icon(
                Icons.favorite,
                size: 20,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),

      // body: ListView.builder(
      //   itemCount: listTL.length,
      //   itemBuilder: (context, index) {
      //     theloai tl = listTL[index];
      //     return ListTile(
      //       leading: CircleAvatar(
      //         child: Image.network(tl.AnhTL),
      //       ),
      //       title: Text(tl.TenTL),
      //       subtitle: Text(tl.MaTL),
      //     );
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
      //   },
      // ),

      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //   child: ListView(
      //     children: [
      //       Container(
      //         height: 150,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //               fit: BoxFit.cover, image: AssetImage('assets/a1.jpg')),
      //           color: Colors.red,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //       ),
      //
      //
      //       // SingleChildScrollView(
      //       //   scrollDirection: Axis.vertical,
      //       //   child: Column(
      //       //     children: productProvider.getTLtruyen
      //       //         .map((e) => buidProduct(
      //       //             context: context,
      //       //             listT: productProvider.getDStruyen,
      //       //             tl: e))
      //       //         .toList(),
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: const EdgeInsets.symmetric(vertical: 5),
      //       //   child: Row(
      //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       //     children: [
      //       //       Text(
      //       //         "Trinh thám",
      //       //         style: TextStyle(
      //       //             color: Colors.black, fontWeight: FontWeight.bold),
      //       //       ),
      //       //       Text(
      //       //         "Tất cả",
      //       //         style: TextStyle(color: Colors.grey),
      //       //       )
      //       //     ],
      //       //   ),
      //       // ),
      //
      //       // Text("Truyện", style: TextStyle(
      //       //   fontSize: 40,
      //       //   color: Colors.green[100],
      //       //   fontWeight: FontWeight.bold
      //       // ),)
      //       // SingleChildScrollView(
      //       //   scrollDirection: Axis.horizontal,
      //       //   child: Row(
      //       //     children: [
      //       //       // productModel.gettruyenCuoiData.map((truyenCuoiData) => {},).toList()
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/08/thumb-2031-cover-175x238.jpg.webp',
      //       //                   productName: 'Vạn Ác Bất Xá',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/08/thumb-2031-cover-175x238.jpg.webp',
      //       //         tenTr: "Vạn Ác Bất Xá",
      //       //         nd: 'Ngô Kỳ, một sát thủ truyền kỳ lỡ tay bị giết, người sát hại mình là ai cũng không biết. Hệ thống Sát Ý bất ngờ xuất hiện trước mặt hắn, chỉ cần hắn hoàn thành nhiệm vụ là giúp hắn hồi sinh, và cho hắn biết chân tướng về cái chết của hắn. Ngô…',
      //       //       ),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-4596-cover-175x238.jpg.webp',
      //       //                   productName: 'Kim Tiền Thượng',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-4596-cover-175x238.jpg.webp',
      //       //         tenTr: "Kim Tiền Thượng",
      //       //         nd: 'Bạn đã quá chán với những manhua tổng tài “mì ăn liền”??? Hãy đến với bộ truyện mới toanh được dịch và đăng bởi CRAZY GIRL TEAM 😁 1 bộ truyện tranh manhua độc đáo với hàng tá câu hỏi đặt ra về ý nghĩa của tiền bạc và tình yêu. Một chàng trai nghèo…',
      //       //       ),
      //       //       // TheLoai(
      //       //       //   onTap: () {
      //       //       //     Navigator.of(context).push(
      //       //       //       MaterialPageRoute(
      //       //       //         builder: (context) => XemChiTiet(
      //       //       //             productImage:
      //       //       //                 'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3898-cover-175x238.jpg.webp',
      //       //       //             productName: 'Trong Bóng Tối',
      //       //       //             productND: ''),
      //       //       //       ),
      //       //       //     );
      //       //       //   },
      //       //       //   anhTr:
      //       //       //       'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3898-cover-175x238.jpg.webp',
      //       //       //   tenTr: "Trong Bóng Tối",
      //       //       //   nd: 'Rốt cục tôi là ai? Cái chết chỉ là một khởi đầu mới. Trở về cảnh cục sau khi kết thúc nhiệm vụ nằm vùng, một kí ức khác trong người Tạ Lam Sơn dần dần thức tỉnh. Lang thang trên mũi đao nhọn, chạy loạn quanh vùng tội ác. Cảnh sát hình sự…',
      //       //       // ),
      //       //
      //       //
      //       //       // TheLoai(
      //       //       //   onTap: () {
      //       //       //     Navigator.of(context).push(
      //       //       //       MaterialPageRoute(
      //       //       //         builder: (context) => XemChiTiet(
      //       //       //           productImage:
      //       //       //               'https://avatarfiles.alphacoders.com/310/310744.jpg',
      //       //       //           productName: 'Người',
      //       //       //         ),
      //       //       //       ),
      //       //       //     );
      //       //       //   },
      //       //       //   anhTr: 'https://avatarfiles.alphacoders.com/310/310744.jpg',
      //       //       //   tenTr: "Người",
      //       //       // ),
      //       //     ],
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: const EdgeInsets.symmetric(vertical: 5),
      //       //   child: Row(
      //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       //     children: [
      //       //       Text(
      //       //         "Xuyên không",
      //       //         style: TextStyle(
      //       //             color: Colors.black, fontWeight: FontWeight.bold),
      //       //       ),
      //       //       Text(
      //       //         "Tất cả",
      //       //         style: TextStyle(color: Colors.grey),
      //       //       )
      //       //     ],
      //       //   ),
      //       // ),
      //       // SingleChildScrollView(
      //       //   scrollDirection: Axis.horizontal,
      //       //   child: Row(
      //       //     children: [
      //       //       // productProvider.gettruyenCuoiData.map((e) => NULL).toList(),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-4850-cover-175x238.jpg.webp',
      //       //                   productName: 'Công Tước Bạch Long',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-4850-cover-175x238.jpg.webp',
      //       //         tenTr: "Tước Bạch Long",
      //       //         nd: 'Sinh ra là người kế vị của một gia đình quý tộc hạng thấp, Raven Varte bị gán cho tội danh âm mưu nổi dậy chống lại hoàng gia. Để được ân xá, hắn được cử đi chiến đấu với lũ quái vật cùng với quân đoàn tồi tàn nhất trong vương quốc, quân đoàn…',
      //       //       ),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-4862-cover-175x238.jpg.webp',
      //       //                   productName: 'Khu Thần',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-4862-cover-175x238.jpg.webp',
      //       //         tenTr: "Khu Thần",
      //       //         nd: 'Truyện tranhKhu Thần được cập nhật nhanh và đầy đủ nhất tại NetTruyen.Mobi. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen.Mobi ra các chương mới nhất của truyện Khu Thần.',
      //       //       ),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/08/thumb-2201-cover-175x238.jpg.webp',
      //       //                   productName: 'Ta Là Tà Đế',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/08/thumb-2201-cover-175x238.jpg.webp',
      //       //         tenTr: "Ta Là Tà Đế",
      //       //         nd: 'Truyện tranh Ta Là Tà Đế được cập nhật nhanh và đầy đủ nhất tại NetTruyen. Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ NetTruyen.mobi ra các chương mới nhất của truyện Ta Là Tà Đế.',
      //       //       ),
      //       //
      //       //     ],
      //       //   ),
      //       // ),
      //       // // //thu3
      //       // Padding(
      //       //   padding: const EdgeInsets.symmetric(vertical: 5),
      //       //   child: Row(
      //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       //     children: [
      //       //       Text(
      //       //         "Kiếm khách",
      //       //         style: TextStyle(
      //       //             color: Colors.black, fontWeight: FontWeight.bold),
      //       //       ),
      //       //       Text(
      //       //         "Tất cả",
      //       //         style: TextStyle(color: Colors.grey),
      //       //       )
      //       //     ],
      //       //   ),
      //       // ),
      //       // SingleChildScrollView(
      //       //   scrollDirection: Axis.horizontal,
      //       //   child: Row(
      //       //     children: [
      //       //       // productProvider.gettruyenCuoiData.map((e) => NULL).toList(),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/09/thumb-3297-cover-175x238.jpg.webp',
      //       //                   productName: 'Yêu Thần Ký',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/09/thumb-3297-cover-175x238.jpg.webp',
      //       //         tenTr: "Yêu Thần Ký",
      //       //         nd: 'Yêu Thần Vừa Xuất, Ai Dám Tranh Phong Yêu Linh Sư Mạnh Nhất Thánh Linh Đại Lục Nhiếp Li, bởi vì một cuốn sách thần bí Yêu Linh Thời Không mà trở về năm 13 tuổi, tu luyện mạnh nhất công pháp, mạnh nhất yêu linh chi lực, đột phá tới võ đạo đỉnh phong……',
      //       //       ),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/08/thumb-2189-cover-175x238.jpg.webp',
      //       //                   productName: 'Kiếm Thương',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/08/thumb-2189-cover-175x238.jpg.webp',
      //       //         tenTr: "Kiếm Thương",
      //       //         nd: 'Vì đánh bại kẻ đã khiến hắn tan cửa nát nhà, thiếu niên Huyền Thiên bước lên kiếm đạo tu hành. Từ thiếu niên ngây thơ đến nhất đại Kiếm Thần, đã từng cho rằng cường giả hiện tại đã như hạt bụi nhỏ. Một chỉ tru thần đều im lặng diệt, ta bằng vào…',
      //       //       ),
      //       //       TheLoai(
      //       //         onTap: () {
      //       //           Navigator.of(context).push(
      //       //             MaterialPageRoute(
      //       //               builder: (context) => XemChiTiet(
      //       //                   productImage:
      //       //                   'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3566-cover-175x238.jpg.webp',
      //       //                   productName: 'Tiến Hóa Cuồng',
      //       //                   productND: ''),
      //       //             ),
      //       //           );
      //       //         },
      //       //         anhTr:
      //       //         'https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3566-cover-175x238.jpg.webp',
      //       //         tenTr: "Tiến Hóa Cuồng",
      //       //         nd: 'Sau khi Đoạn Phi ở kiếp trước chết đi thì không ngờ lại trọng sinh về 20 năm trước, ngay trước mấy tiếng then chốt khi tai họa tiến tới. Chuyện mà 20 năm qua Đoạn Phi hối hận cuối cùng cũng có thể cứu vãn, lợi dụng kiến thức của kiếp trước để trang…',
      //       //       ),
      //       //
      //       //     ],
      //       //   ),
      //       // ),
      //       // SingleChildScrollView(
      //       //   scrollDirection: Axis.horizontal,
      //       //   child: Row(
      //       //     children: [
      //       //       TheLoai(),
      //       //       TheLoai(),
      //       //     ],
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}

// class TrangChu extends StatelessWidget {
//   // const TrangChu({Key? key}) : super(key: key);
//
//
//   @override
//   void initState(){
//     ProductProvider  productProvider = Provider.of(context,listen: false)
//     productProvider.truyenCuoiData();
//     super.initState();
//   }
//   // ProductProvider? productProvider;
//   // List<theloai>? listTL;
//   @override
//   Widget build(BuildContext context) {
//     ProductProvider productProvider = Provider.of(context);
//     List<theloai> listTL = productProvider.getTLtruyen;
//     List<truyen> listT = productProvider.getDStruyen;
//
//     // productProvider = Provider.of(context, listen: true);
//     // listTL = productProvider!.gettruyenCuoiData;
//
//   }
// }
