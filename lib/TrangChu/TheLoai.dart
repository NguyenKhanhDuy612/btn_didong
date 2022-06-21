// import 'package:btn_didong/TacPham/Xem.dart';
// import 'package:flutter/material.dart';
//
// class TheLoai extends StatelessWidget {
//   final String anhTr;
//   final String tenTr;
//   final String nd;
//   final Function onTap;
//   TheLoai(
//       {Key? key, required this.anhTr, required this.tenTr,required this.nd, required this.onTap})
//       : super(key: key);
//   // const TheLoai({Key? key, }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             height: 230,
//             width: 160,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   // onTap: widget.onTap,
//                   // onTap: () {
//                   //   Navigator.of(context).push(
//                   //     MaterialPageRoute(
//                   //       builder: (context) => XemChiTiet(),
//                   //     ),
//                   //   );
//                   // },
//                   child: Container(
//                     height: 150,
//                     padding: EdgeInsets.all(5),
//                     width: double.infinity,
//                     child: Image.network(anhTr),
//                   ),
//                 ),
//                 // Expanded(
//                 //   flex: 2,
//                 //   child: Image.network(
//                 //       'https://www.pngitem.com/pimgs/m/115-1156076_anime-girls-holding-programming-books-hd-png-download.png'),
//                 // ),
//                 Expanded(
//                   child: Container(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             tenTr,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           // Text(
//                           //   'Truyện cười',
//                           //   style: TextStyle(
//                           //       color: Colors.black,
//                           //       fontWeight: FontWeight.bold),
//                           // ),
//                           Container(
//                             height: 20,
//                             child: OutlinedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => XemChiTiet(
//                                       productImage: anhTr,
//                                       productName: tenTr,
//                                       productND: nd,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Row(
//                                 children: [Text("Xem chi tiết")],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
