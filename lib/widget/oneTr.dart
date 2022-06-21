import 'package:btn_didong/my_profile/class_truyen.dart';
import 'package:flutter/material.dart';

class HTTruyen extends StatelessWidget {
  // const HTTruyen({Key? key}) : super(key: key);
  truyen tr;
  VoidCallback? onTap;
  HTTruyen({Key? key, required this.tr, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: onTap,

            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[500]!),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: 150,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            // child: FadeInImage(
                            //   placeholder: AssetImage(urlImage+"loading_1.gif"),
                            //   image: NetworkImage(sp.anh!,
                            //   ),
                            // )
                          child: Image.network(tr.AnhT!),
                        )
                    ),
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Text(tr.TenT!.length > 30 ? tr.TenT!.substring(0,30)+"..." : tr.TenT!,
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                              // Text(tr.gia.toString(),
                              //   style: TextStyle(fontSize: 12, color: Colors.red),
                              // ),
                            ],
                          ),
                        )
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
