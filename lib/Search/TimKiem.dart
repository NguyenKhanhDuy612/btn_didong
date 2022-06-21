import 'package:btn_didong/Search/TK_Item.dart';
import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../TacPham/Xem.dart';
import '../my_profile/class_the_loai.dart';
import '../my_profile/provider.dart';
import '../widget/oneTr.dart';

class Search extends StatefulWidget {
  List<truyen>? listT;
  VoidCallback? onTap;
  theloai? tl;
  Search({Key? key, this.listT, this.onTap, this.tl}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchCtrl = TextEditingController();
  String? searchData;

  List<truyen>? listT;
  List<truyen>? newListT;
  @override
  void initState() {
    listT = widget.listT;
    if (listT == null) {
      ProductProvider productProvider = Provider.of(context, listen: false);
      listT = productProvider.getDStruyen;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Tìm kiếm theo tên",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amberAccent,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          // const ListTile(
          //   title: Text("Item"),
          // ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: searchCtrl,
              onChanged: (value) => searchData = value,
              decoration: InputDecoration(
                fillColor: Color(0xffc2c2c2),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none),
                hintText: "Nhập tên truyện cần tìm",
                suffixIcon: InkWell(
                  child: const Icon(Icons.search),
                  onTap: () {
                    setState(() {
                      newListT = listT
                          ?.where((element) => element.TenT!
                              .toUpperCase()
                              .contains(searchData == null
                                  ? ""
                                  : searchData?.toUpperCase() ?? ""))
                          .toList();
                      searchData = "";
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          searchData == null
              ? SizedBox(
                  height: 0.1,
                )
              : Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      newListT == null || newListT?.length == 0
                          ? "0"
                          : newListT!.length.toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      "kết quả tìm được!",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
          Expanded(
              child: (newListT == null || newListT?.length == 0)
                  ? const SizedBox(
                      height: 0.1,
                    )
                  : Container(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: newListT?.length,
                        itemBuilder: (context, index) {
                          var tr = newListT![index];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Image.network(tr.AnhT!),
                                    ),
                                    // child: SingleChildScrollView(
                                    //   scrollDirection: Axis.horizontal,
                                    //   child: Row(
                                    //       children: listT.where((e) => e.MaTL == tl.MaTL).map(
                                    //             (e) {
                                    //           return HTTruyen(
                                    //             tr: e,
                                    //             onTap: () => Navigator.of(context).push(
                                    //               MaterialPageRoute(
                                    //                 builder: (context) => XemChiTiet(tr: e),
                                    //               ),
                                    //             ),
                                    //           );
                                    //         },
                                    //       ).toList()),
                                    // ),
                                  ),
                                  Expanded(
                                      child: Center(
                                    child: Container(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 5, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  tr.TenT!.length > 30
                                                      ? tr.TenT!.substring(
                                                              0, 30) +
                                                          "..."
                                                      : tr.TenT!,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          XemChiTiet(
                                                        tr: tr,
                                                      ),
                                                    ));
                                                  },
                                                  child: Column(
                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        "Xem chi tiết",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                // RichText(
                                                //     maxLines: 2,
                                                //     overflow: TextOverflow.clip,
                                                //     text: TextSpan(
                                                //         text: tr.gia!.toString(),
                                                //         style: const TextStyle(
                                                //             fontSize: 17,
                                                //             color: Colors.black54,
                                                //             shadows: [
                                                //               BoxShadow(
                                                //                   color: Colors.white,
                                                //                   offset: Offset(1,1),
                                                //                   blurRadius: 3
                                                //               )
                                                //             ]
                                                //         ),
                                                //         children: const [
                                                //           TextSpan(
                                                //               text: "VNĐ",
                                                //               style: TextStyle(
                                                //                   color: Colors.grey,
                                                //                   fontSize: 10
                                                //               )
                                                //           )
                                                //         ]
                                                //     )
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),),
                                ],
                              ),
                              const Divider(
                                height: 10,
                                thickness: 2,
                              )
                            ],
                          );
                        },
                      ),
                    ))
        ],
      ),
    );
  }
}

// class Search extends StatelessWidget {
//   const Search({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TÌm kiếm"),
//           actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               onPressed: () {
//               },
//               icon: Icon(Icons.sort),
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           // ListTile(
//           //   title: Text("I"),
//           // ),
//           Container(
//             height: 52,
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: Color(0xffc2c2c2),
//                 filled: true,
//                 hintText: "Tìm....",
//                 suffixIcon: Icon(Icons.search)
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TK_Item(),
//           TK_Item(),TK_Item(),TK_Item(),
//
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:btn_didong/TacPham/Xem.dart';
// // import 'package:btn_didong/TrangChu/TheLoai.dart';
// import 'package:flutter/material.dart';
//
// class Search extends StatefulWidget {
//   final List<XemChiTiet> search;
//   Search({ required this.search});
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   String query = "";
//
//
//   searchItem(String query) {
//     List<XemChiTiet> searchFood = widget.search.where((element) {
//       return element.productName.toLowerCase().contains(query);
//     }).toList();
//     return searchFood;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<XemChiTiet> _searchItem = searchItem(query);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               onPressed: () {
//               },
//               icon: Icon(Icons.sort),
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text("Items"),
//           ),
//           Container(
//             height: 52,
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   query = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: Color(0xffc2c2c2),
//                 filled: true,
//                 hintText: "Search for items in the store",
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // Column(
//           //   children: _searchItem.map((data) {
//           //     return SingleItem(
//           //       isBool: false,
//           //       productImage: data.productImage,
//           //       productName: data.productName,
//           //       productPrice: data.productPrice,
//           //     );
//           //   }).toList(),
//           // )
//         ],
//       ),
//     );
//   }
// }
