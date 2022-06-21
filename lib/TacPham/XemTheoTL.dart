// import 'package:btn_didong/TacPham/Xem.dart';
// import 'package:btn_didong/my_profile/class_the_loai.dart';
// import 'package:btn_didong/my_profile/class_truyen.dart';
// import 'package:flutter/material.dart';
// // import '../../models/product.dart';
// // import '../../screens/product_overview/product_overview.dart';
//
// class XemTheoTL extends StatelessWidget {
//   theloai tr;
//   XemTheoTL({Key? key, required this.tr}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 5),
//           decoration: BoxDecoration(
//               border: Border.all(width: 1, color: Colors.grey[500]!),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20)),
//           child: Column(
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: Image.network(
//                       tr.AnhTL!,
//                     ),
//                   )),
//               Expanded(
//                   child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//                 child: Column(
//                   children: [
//                     Text(
//                       tr.TenTL!.length > 30
//                           ? tr.TenTL!.substring(0, 30) + "..."
//                           : tr.TenTL!,
//                       style: TextStyle(fontSize: 12),
//                       textAlign: TextAlign.center,
//                     ),
//                     // Text(
//                     //   sp.gia.toString(),
//                     //   style: TextStyle(fontSize: 12, color: Colors.red),
//                     // ),
//                   ],
//                 ),
//               )),
//             ],
//           )),
//       // onTap: () {
//       //   Navigator.of(context).push(MaterialPageRoute(
//       //       builder: (context) => XemChiTiet(tr: tl,
//       //
//       //           )));
//       // },
//     );
//   }
// }
