import 'package:flutter/material.dart';

Future<String?> showConfirmDialog(BuildContext context, String dispMessage) async{
  AlertDialog alertDialog = AlertDialog(
    title: const Text("Xác nhận"),
    content: Text(dispMessage),
    actions: [
      ElevatedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop("cancel"),
          child: const Text("Hủy")),
      ElevatedButton(onPressed: () => Navigator.of(context, rootNavigator: true).pop("ok"),
          child: const Text("Ok")),
    ],
  );
  String? res = await showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (context) => alertDialog);
  return res;
}
Future<String?> showConfirmDialog1(BuildContext context, String dispMessage) async {
  AlertDialog dialog = AlertDialog(
    title: const Text("Xác nhân!"),
    content: Text(dispMessage),
    actions: [
      ElevatedButton(
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop("cancel");
          },
          child: const Text("Hủy")),
      ElevatedButton(
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop("ok");
          },
          child: const Text("Xóa!")),
    ],
  );

  String? res = await showDialog<String?>(
    barrierDismissible: false, // bat buoc chon xoa hoac huy
    context: context,
    builder: (BuildContext context) => dialog,
  );
  return res;
}

void showSnackBar(BuildContext context, String message, int second){
  Scaffold.of(context).removeCurrentSnackBar();
  Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: second))
  );
}