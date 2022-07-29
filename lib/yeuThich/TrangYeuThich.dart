

import 'package:btn_didong/yeuThich/yeuThich.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/single_item.dart';
import 'class_yeu_thich.dart';





class ReviewCartPage extends StatefulWidget {
  const ReviewCartPage({Key? key}) : super(key: key);

  @override
  State<ReviewCartPage> createState() => _ReviewCartPageState();
}

class _ReviewCartPageState extends State<ReviewCartPage> {
  ReviewCartProvider? cartProvider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReviewCartProvider provider = Provider.of(context, listen: false);
    provider.fetchReviewCartData();

  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of(context, listen: true);
    List<ReviewCart>? listCart = cartProvider?.getListCart;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amberAccent,
        title: const Text("Danh sách yêu thích", style: TextStyle(color: Colors.black),),
      ),
      body: listCart!.isEmpty? const Center(child: Text("Chưa có"))
          : ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (context, index){
          var reviewCart = listCart[index];
          return Container(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                SingleItem(
                  inCart: true,
                  reviewCart: reviewCart,
                ),
                const Divider(height: 10,thickness: 2,)
              ],
            ),
          );
        },
      ),
    );
  }
}

