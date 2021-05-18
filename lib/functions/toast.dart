import 'package:fluttertoast/fluttertoast.dart';

void showTextToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
  );
}
