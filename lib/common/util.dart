import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//Toast工具类
class ToastUtil {
  ToastUtil(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color(0xFF9E9E9E),
        textColor: Color(0xFFFFFFFF)
    );
  }
}


Widget gmAvatar(String url, {
  double width = 30,
  double height,
  BoxFit fit,
  BorderRadius borderRadius,
}) {
  var placeholder = Image.asset(
      "imgs/avatar-default.png", //头像占位图，加载过程中显示
      width: width,
      height: height
  );
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>placeholder,
      errorWidget: (context, url, error) =>placeholder,
    ),
  );
}

//加载动画弹窗
showLoadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text(message),
            )
          ],
        ),
      );
    },
  );
}