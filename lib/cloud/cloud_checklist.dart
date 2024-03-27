import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants/my_url_button.dart';
import '../constants/variables.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CloudCheckList extends StatefulWidget {
  const CloudCheckList({Key? key}) : super(key: key);

  @override
  State<CloudCheckList> createState() => _CloudCheckListState();
}

class _CloudCheckListState extends State<CloudCheckList> {
  List cloudCheckList = [];

  Future readDataAlnukhbaCheckList() async {
    var url = "http://10.4.1.208/myphpcloud/mydata/cloud_checklist.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      setState(() {
        cloudCheckList.addAll(resBody);
      });
      return resBody;
    }
  }

  getData() async {
    await readDataAlnukhbaCheckList();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text('CheckList'.tr,
              style: TextStyle(
                  color: lighttextandtitle,
                  fontSize: titlefontsize,
                  fontWeight: FontWeight.bold)),
        ),
        Divider(
          color: lighttextandtitle,
          thickness: 3,
        ),
        ListView.builder(
            itemCount: cloudCheckList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Get.defaultDialog(
                        buttonColor: Colors.red,
                        textCancel: "cancel".tr,
                        cancelTextColor: Colors.red,
                        onCancel: () {
                          Get.previousRoute;
                        },
                        title: "${cloudCheckList[index]["title"]}".tr,
                        content: Expanded(
                          child: Container(
                            height: screenHeight,
                            width: screenWidth,
                            margin: const EdgeInsets.all(3),
                            padding: const EdgeInsets.all(8.0),
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
                                    text: '${cloudCheckList[index]["body"]}'
                                        .tr,
                                  ));
                                },
                                '${cloudCheckList[index]["body"]}'.tr,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: lightbodycolor, fontSize: textsize),
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
                      size: cascadeiconsize,
                      color: iconcolor,
                    ),
                    label: Text(
                      '${cloudCheckList[index]["title"]}'.tr,
                      style: TextStyle(
                          color: lighttextandtitle, fontSize: textsize),
                    ),
                    style: textbuttonStyle,
                  ),
                ],
              );
            }),
      ],
    );
  }
}
