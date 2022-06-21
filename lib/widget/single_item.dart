import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/dialogs.dart';
import '../yeuThich/class_yeu_thich.dart';
import '../yeuThich/yeuThich.dart';

class SingleItem extends StatefulWidget {
  bool? inCart;
  ReviewCart? reviewCart;

  SingleItem({
    Key? key,
    this.inCart,
    this.reviewCart,
  }) : super(key: key);

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  ReviewCartProvider? provider;
  bool? inCart = false;
  ReviewCart? reviewCart;
  String? AnhT, TenT;
  // truyen? tr;
  List<truyen>? tr = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inCart = widget.inCart;
    reviewCart = widget.reviewCart;
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Row(
      children: [
        Expanded(
            child: Container(
          child: Image.network(
            reviewCart!.AnhT!,
            fit: BoxFit.fill,
          ),
        )),
        Expanded(

            // can
            child: Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: inCart == false
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      reviewCart!.TenT!.length > 30
                          ? reviewCart!.TenT!.substring(0, 30) + "..."
                          : reviewCart!.TenT!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
        Expanded(
          child: inCart == false
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey)),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        child: Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 30,
                        ),
                        onTap: () {
                          setState(() {
                            _xoa(context, reviewCart!.TenT!);
                            provider?.fetchReviewCartData();
                          });
                        }),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
        )
      ],
    );
  }

  void _xoa(BuildContext context, String TenT) async {
    String? confirm;
    confirm = await showConfirmDialog(context, "Bạn muốn xóa $TenT");
    if (confirm == "ok") {
      await provider!.deleteViewCart(reviewCart!.TenT!).whenComplete(() {
        provider?.fetchReviewCartData();
        showSnackBar(context, "Xóa thành công", 3);
      }).onError((error, stackTrace) {
        showSnackBar(context, "Xóa không thành công", 3);
        return Future.error("Xóa dữ liệu không thành công");
      });
    }
  }
}
