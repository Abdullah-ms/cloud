import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/my_url_button.dart';
import '../../../constants/variables.dart';
import '../alternativeImage.dart';

class CloudHelper extends StatefulWidget {
  const CloudHelper({Key? key}) : super(key: key);

  @override
  State<CloudHelper> createState() => _CloudHelperState();
}

class _CloudHelperState extends State<CloudHelper> {
  @override
  void initState() {
    getHelper();
    super.initState();
  }

  List cloudHelper = [];

  Future imageDataHelper() async {
    var url = "http://10.4.1.208/myphpcloud/mydata/helper.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      setState(() {
        cloudHelper.addAll(resBody);
      });
      return resBody;
    }
  }

  getHelper() async {
    await imageDataHelper();
  }

//----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text('Helper'.tr,
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
            shrinkWrap: true,
            itemCount: cloudHelper.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Get.defaultDialog(
                        buttonColor: Colors.red,
                        textCancel: "Close".tr,
                        cancelTextColor: Colors.red,
                        onCancel: () {
                          Get.previousRoute;
                        },
                        title: "${cloudHelper[index]["title"]}".tr,
                        content: Expanded(
                          child: Container(
                            height: screenHeight,
                            width: screenWidth,
                            margin: const EdgeInsets.all(3),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: lighttextandtitle,
                                  width: borderwidth),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(cloudHelper[index]['text1'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image1']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text2'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image2']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text3'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image3']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text4'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image4']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text5'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image5']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text6'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image6']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text7'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image7']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text8'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image8']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text9'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image9']}',
                                      alternateText: '',
                                    ),
                                  ),
                                  Center(
                                    child: Text(cloudHelper[index]['text10'],
                                        textDirection: TextDirection.rtl,
                                        style:
                                            TextStyle(color: lightbodycolor)),
                                  ),
                                  Center(
                                    child: ImageOrTextWidget(
                                      imagePath:
                                          '${cloudHelper[index]['image10']}',
                                      alternateText: '',
                                    ),
                                  ),
                                ],
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
                      '${cloudHelper[index]["title"]}'.tr,
                      style: TextStyle(
                          color: lighttextandtitle, fontSize: textsize),
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
