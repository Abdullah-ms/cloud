import 'package:cloud/constants/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../core/functions/url_LaunchInBrowserView.dart';


TextButton buildUrlLaunchButton(String buttonText, String mylink) {
  return TextButton.icon(
    onPressed: () {
      launchInBrowserView(mylink);
    },
    icon: Icon(
      Icons.label_important,
      size: iconsize,
      color: lightsubiconcolor,
    ),
    label: Text(buttonText, style: textOfFAB),
    style: textbuttonStyle,
  );
}


//-------------------------


Size screenSize = WidgetsBinding.instance.window.physicalSize;
double screenWidth = screenSize.width;
double screenHeight = screenSize.height;

TextButton DialogButton (String buttonTitle, String buttonBody) {

  return TextButton.icon(
    onPressed: () {
      Get.defaultDialog(
        buttonColor: Colors.red,
        textCancel: "Close".tr,
        cancelTextColor: Colors.red,
        onCancel: () {
          Get.previousRoute;
        },
        title: buttonTitle.tr,
        content: Expanded(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            margin: const EdgeInsets.all(3),
            padding: EdgeInsets.all(borderpadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: lighttextandtitle, width: borderwidth),
            ),
            child: SingleChildScrollView(
              child: SelectableText(
                showCursor: true,
                cursorColor: Colors.redAccent,
                onTap: () {
                  Clipboard.setData(ClipboardData(
                    text: buttonBody,
                  ));
                },
                buttonBody,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: lightbodycolor),
              ),
            ),
          ),
        ),
        backgroundColor: lightdialogbackground,
        titleStyle: TextStyle(color: lightbodycolor),
      );
    },
    icon: Icon(
      Icons.label_important,
      size: iconsize,
      color: iconcolor,
    ),
    label: Text(
      buttonTitle.tr,
      style: TextStyle(
          fontSize: textsize),
    ),
    style: textbuttonStyle,
  );
}

