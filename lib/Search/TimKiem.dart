import 'package:btn_didong/Search/TK_Item.dart';
import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_profile/provider.dart';


class Search extends StatefulWidget {
  List<truyen>? listT;
  Search({Key? key, this.listT}) : super(key: key);

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
    if(listT == null){
      ProductProvider productProvider = Provider.of(context, listen: false);
      listT = productProvider.getDStruyen;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.blue,
        actions: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.menu_rounded),)
        ],
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text("Item"),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: searchCtrl,
              onChanged: (value)=> searchData = value,
              decoration: InputDecoration(
                fillColor: Color(0xffc2c2c2),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none
                ),
                hintText: "Search items in the store",
                suffixIcon: InkWell(
                  child: const Icon(Icons.search),
                  onTap: (){
                    setState(() {
                      newListT = listT?.where((element) => element.TenT!.toUpperCase().contains(searchData == null?"" : searchData?.toUpperCase()??"")).toList();
                      searchData = "";
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          searchData ==null ?
          SizedBox(height: 0.1,)
              : Row(
            children: [
              const SizedBox(width: 20,),
              Text(newListT == null || newListT?.length ==0 ? "0" : newListT!.length.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(width: 3,),
              const Text("Kết quả tìm được!",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Expanded(
              child: (newListT ==null || newListT?.length ==0)?
              const SizedBox(height: 0.1,)
                  :Container(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: newListT?.length,
                  itemBuilder: (context, index){
                    var tr = newListT![index];
                    return Column(
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  child: Image.network(tr.AnhT!),
                                )
                            ),
                            Expanded(
                                child: Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(tr.TenT!.length > 30 ? tr.TenT!.substring(0,30) +"..." : tr.TenT!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(height: 5,),
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
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                        const Divider(height: 10,thickness: 2,)
                      ],
                    );
                  },

                ),
              )
          )
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