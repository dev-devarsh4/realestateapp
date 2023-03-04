import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;
import 'package:logger/logger.dart';
import 'package:realestateapp/core/colors/color_list.dart';

import '../../di/injection_container.dart';
import '../preference/pref_helper.dart';
import '../string_constants/message_constants.dart';
import 'base_view.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with WidgetsBindingObserver
    implements BaseView {
  Logger? logger = sl();
  PrefHelper? prefHelper = sl();

  @override
  void initState() {
    printLogger();
    super.initState();

    logger = sl();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context);

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void removeFocus() => FocusScope.of(context).requestFocus(FocusNode());

  @override
  void showErrorDialog(String errorMessage) => toast.Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2);

  @override
  void showToast(String message,
      {toast.ToastGravity? gravity = toast.ToastGravity.BOTTOM}) {
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength: gravity == toast.ToastGravity.TOP
          ? toast.Toast.LENGTH_LONG
          : toast.Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: ColorList.black,
      textColor: ColorList.white,
      timeInSecForIosWeb: 2,
    );
  }

  @override
  void serverError() {
    toast.Fluttertoast.showToast(
        msg: labelPleaseCheckInternetConnection,
        toastLength: toast.Toast.LENGTH_LONG,
        gravity: toast.ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3);
  }

  @override
  void checkInternetConnectionError() => toast.Fluttertoast.showToast(
      msg: labelPleaseCheckInternetConnection,
      toastLength: toast.Toast.LENGTH_LONG,
      gravity: toast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3);

  @override
  void showMessageArrivedMessage() {}

  comingSoon() {
    showToast("Coming soon");
  }

  exitApp() {
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }

  showKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.show');
  }

  String className = "";

  void printLogger() {
    className = runtimeType.toString();
  }
}
