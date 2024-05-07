import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../theme/theme.dart';


class MethodHelper {
  String urlValidator(String url) {
    String value = '';
    if (isURL(url)) {
      value = url;
    } else {
      value = "https://www.google.com/search?q=$url";
    }

    return value;
  }

  Widget generateDashedDivider(double width, Color color) {
    int n = width ~/ 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          n,
          (index) => (index % 2 == 0)
              ? Container(
                  height: 2,
                  width: width / n,
                  color: color,
                )
              : SizedBox(
                  width: width / n,
                )),
    );
  }

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  handleCopy({required String data, required BuildContext context}) {
    Clipboard.setData(ClipboardData(text: data));
    showSnack(
        context: context,
        content: "Copy Success",
        backgorund: AppColor.successColor);
  }

  showSnack({
    required BuildContext context,
    required String content,
    required Color backgorund,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        icon: const SizedBox(),
        messagePadding: const EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: backgorund,
        textStyle: AppFont.medium16.copyWith(color: AppColor.darkText1),
        message: content,
      ),
      displayDuration: const Duration(milliseconds: 1000),
      animationDuration: const Duration(milliseconds: 800),
    );
  }

  shortAddress({required String address, int length = 8}) {
    if (address != '') {
      return "${address.substring(0, length)}...${address.substring(address.length - length)}";
    } else {
      return '';
    }
  }

  Future<void> pasteFromClipboard(TextEditingController controller) async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      controller.text = clipboardData.text!;
    }
  }

  Uint8List convertBase64ToUint8List(String base64String) {
    List<int> byteList = base64Decode(base64String);
    Uint8List uint8List = Uint8List.fromList(byteList);
    return uint8List;
  }

  String convertUint8ListToString(Uint8List uint8List) {
    String base64String = base64Encode(uint8List);
    return base64String;
  }

  bool isURL(String text) {
    // Regular expression pattern to match a URL
    RegExp urlRegex = RegExp(
      r'^(?:http|https):\/\/[\w\-]+(?:\.[\w\-]+)+(?:[\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$',
      caseSensitive: false,
      multiLine: false,
    );

    return urlRegex.hasMatch(text);
  }

  BigInt convertToGwei(double amount) {
    BigInt gweiBigInt = (BigInt.from(amount * 1000000000) ~/ BigInt.one);
    return gweiBigInt;
  }

  List<dynamic> accumulateVolume(List<dynamic> list) {
    List<dynamic> total = [];
    List<dynamic> volArr = [];
    for (var i = 0; i < list.length; i++) {
      volArr.add(double.parse(list[i][1] != '' ? list[i][1] : '0'));
    }
    for (var i = 0; i < volArr.length; i++) {
      var accumulator = i - 1 > -1 ? total[i - 1] : 0;
      total.add(accumulator + volArr[i]);
    }
    return total;
  }

  dynamic calcMaxVolume(bids, asks) {
    List<dynamic> combinedList = [
      ...accumulateVolume(bids),
      ...accumulateVolume(asks)
    ];
    final maxValue =
        combinedList.isNotEmpty ? combinedList.cast<num>().reduce(max) : 0.0;
    return maxValue;
  }

  dynamic mapValues(maxVolume, data) {
    var resultData = data != null && maxVolume != 0 && data.length > 0
        ? data.map((currentVolume) {
            return {"value": (currentVolume / maxVolume) * 100};
          }).toList()
        : [];

    return resultData;
  }

  static String convertToNumber(String formattedNumber) {
    String number = "";
    if (formattedNumber.contains(',')) {
      number = formattedNumber.replaceAll(',', '');
    } else {
      number = formattedNumber;
    }

    return number;
  }

  String formatedTime(Duration duration) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(duration.inMinutes.remainder(60));
    final seconds = strDigits(duration.inSeconds.remainder(60));
    return "$minutes : $seconds";
  }

  String formatEthAddress(String ethAddress) {
    // Format the Ethereum address
    String formattedAddress =
        "${ethAddress.substring(0, 6)}...${ethAddress.substring(38)}";

    return formattedAddress;
  }

  static Color colorStatusOrder(String status) {
    switch (status) {
      case "done":
        return AppColor.successColor;
      case "cancel":
        return AppColor.errorColor;

      default:
        return AppColor.warningColor;
    }
  }
}

double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).floor().toDouble() / mod);
}
