import 'package:btn_didong/Mau/color.dart';
import 'package:flutter/material.dart';

class TK_Item extends StatelessWidget {
  const TK_Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              child: Center(
                child: Image.network(
                    "https://nettruyen.mobi/wp-content/uploads/2021/12/thumb-3566-cover-175x238.jpg.webp"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tên",
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: primaryColor,
                        size: 20,
                      ),
                      Text(
                        "Xem",
                        style: TextStyle(
                            color: textColor, ),
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
