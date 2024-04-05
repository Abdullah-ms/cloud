import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/my_url_button.dart';
import '../../constants/variables.dart';
import 'cloud_agents.dart';

class CloudFAQsNew extends StatefulWidget {
  const CloudFAQsNew({Key? key}) : super(key: key);

  @override
  State<CloudFAQsNew> createState() => _CloudFAQsNewState();
}

class _CloudFAQsNewState extends State<CloudFAQsNew> {
  @override
  void initState() {
    getFaqCommon();
    getAgents();
    super.initState();
  }

//--------------

  List cloudFAQCommon = [];

  Future readDataFaqCommon() async {
    var url = "http://10.4.1.208/myphpcloud/newFAQ/commonQuestion.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      setState(() {
        cloudFAQCommon.addAll(resBody);
      });
    }
  }

  getFaqCommon() async {
    await readDataFaqCommon();
  }

  //--------------

  List cloudAgents = [];

  Future readDataAgents() async {
    var url = "http://10.4.1.208/myphpcloud/newfaq/agents.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      setState(() {
        cloudAgents.addAll(resBody);
      });
    }
  }

  getAgents() async {
    await readDataAgents();
  }



  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('FAQs'.tr,
              style:
                  TextStyle(color: lighttextandtitle, fontSize: titlefontsize,fontWeight: FontWeight.bold)),
        ),
        Divider(
          color: lighttextandtitle,
          thickness: 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  title: "Common Questions".tr,
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
                      child: ListView.builder(
                          itemCount: cloudFAQCommon.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              color: index % 2 == 0
                                  ? expandlistcolor1
                                  : expandlistcolor2,
                              child: ExpansionTile(
                                leading: IconButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                        text: "${cloudFAQCommon[index]['title']}\n\n"
                                            "${cloudFAQCommon[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(Icons.copy, color: Colors.redAccent,)),
//key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: "${cloudFAQCommon[index]['title']}",
                                    ));
                                  },
                                  "${cloudFAQCommon[index]['title']}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(color: lightbodycolor),
                                ),
                                initiallyExpanded: isExpanded,
                                onExpansionChanged: (bool expanding) {
                                  setState(() {});
                                },
                                children: <Widget>[
                                  SelectableText(
                                    showCursor: true,
                                    cursorColor: Colors.redAccent,
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                        text: "${cloudFAQCommon[index]['content']}",
                                      ));
                                    },
                                    "${cloudFAQCommon[index]['content']}",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: lightbodycolor),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  backgroundColor: lightdialogbackground,
                  titleStyle: TextStyle(color: lightbodycolor),
                );
              },
              icon: Icon(
                Icons.question_answer_sharp,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Common Questions'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            CloudAgents(title: 'Agents', myList: cloudAgents,)
          ],
        ),
      ],
    );
  }
}
