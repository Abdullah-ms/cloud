import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/my_url_button.dart';
import '../../constants/variables.dart';

class CloudScriptNew extends StatefulWidget {
  const CloudScriptNew({Key? key}) : super(key: key);

  @override
  State<CloudScriptNew> createState() => _CloudScriptNewState();
}

class _CloudScriptNewState extends State<CloudScriptNew> {
  @override
  void initState() {
    getScriptAnswerTheCall();
    getScriptCommunicationSkills();
    getScriptEnding();
    getScriptRequests();
    getScriptComplaints();
    getScriptOtherCallCases();
    super.initState();
  }

//--------------
  List cloudAnswerTheCall = [];

  Future readDataScriptAnswerTheCall() async {
    var url = "http://10.4.1.208/myphpcloud/newScript/answer.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        cloudAnswerTheCall.addAll(resbody);
      });
    }
  }

  getScriptAnswerTheCall() async {
    await readDataScriptAnswerTheCall();
  }

//--------------
  List alNukhbaCommunicationSkills = [];

  Future readDataScriptCommunicationSkills() async {
    var url = "http://10.4.1.208/myphpcloud/newScript/communication.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        alNukhbaCommunicationSkills.addAll(resbody);
      });
    }
  }

  getScriptCommunicationSkills() async {
    await readDataScriptCommunicationSkills();
  }

//--------------
  List alNukhbaScriptEnding = [];

  Future readDataScriptEnding() async {
    var url = "http://10.4.1.208/myphpcloud/newScript/ending.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        alNukhbaScriptEnding.addAll(resbody);
      });
    }
  }

  getScriptEnding() async {
    await readDataScriptEnding();
  }

//--------------
  List alNukhbaScriptRequests = [];

  Future readDataScriptRequests() async {
    var url = "http://10.4.1.208/myphpcloud/newScript/requests.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        alNukhbaScriptRequests.addAll(resbody);
      });
    }
  }

  getScriptRequests() async {
    await readDataScriptRequests();
  }

//--------------
  List alnukhbaScriptComplaints = [];

  Future readDataScriptComplaints() async {
    var url = "http://10.4.1.208/myphpcloud/newScript/complaints.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        alnukhbaScriptComplaints.addAll(resbody);
      });
    }
  }

  getScriptComplaints() async {
    await readDataScriptComplaints();
  }

//--------------
  List alnukhbaScriptOtherCallCases = [];

  Future readDataScriptOtherCallCases() async {
    var url = "http://10.4.1.208/myphpcloud/newScript/othercall.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        alnukhbaScriptOtherCallCases.addAll(resbody);
      });
    }
  }

  getScriptOtherCallCases() async {
    await readDataScriptOtherCallCases();
  }

//--------------

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text('Communication Script'.tr,
              style: TextStyle(
                  color: lighttextandtitle,
                  fontSize: titlefontsize,
                  fontWeight: FontWeight.bold)),
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
                  title: "Answer The Call".tr,
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
                          itemCount: cloudAnswerTheCall.length,
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
                                        text: "${cloudAnswerTheCall[index]['title']}\n\n"
                                            "${cloudAnswerTheCall[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.redAccent,
                                    )),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                          "${cloudAnswerTheCall[index]['title']}",
                                    ));
                                  },
                                  "${cloudAnswerTheCall[index]['title']}",
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
                                        text:
                                            "${cloudAnswerTheCall[index]['content']}",
                                      ));
                                    },
                                    "${cloudAnswerTheCall[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Answer The Call'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close",
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Communication Script",
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
                          itemCount: alNukhbaCommunicationSkills.length,
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
                                        text: "${alNukhbaCommunicationSkills[index]['title']}\n\n"
                                            "${alNukhbaCommunicationSkills[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.redAccent,
                                    )),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                          "${alNukhbaCommunicationSkills[index]['title']}",
                                    ));
                                  },
                                  "${alNukhbaCommunicationSkills[index]['title']}",
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
                                        text:
                                            "${alNukhbaCommunicationSkills[index]['content']}",
                                      ));
                                    },
                                    "${alNukhbaCommunicationSkills[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Communication Script',
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "End The Call".tr,
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
                          itemCount: alNukhbaScriptEnding.length,
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
                                        text: "${alNukhbaScriptEnding[index]['title']}\n\n"
                                            "${alNukhbaScriptEnding[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.redAccent,
                                    )),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                          "${alNukhbaScriptEnding[index]['title']}",
                                    ));
                                  },
                                  "${alNukhbaScriptEnding[index]['title']}",
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
                                        text:
                                            "${alNukhbaScriptEnding[index]['content']}",
                                      ));
                                    },
                                    "${alNukhbaScriptEnding[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'End The Call'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Requests".tr,
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
                          itemCount: alNukhbaScriptRequests.length,
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
                                        text: "${alNukhbaScriptRequests[index]['title']}\n\n"
                                            "${alNukhbaScriptRequests[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.redAccent,
                                    )),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                          "${alNukhbaScriptRequests[index]['title']}",
                                    ));
                                  },
                                  "${alNukhbaScriptRequests[index]['title']}",
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
                                        text:
                                            "${alNukhbaScriptRequests[index]['content']}",
                                      ));
                                    },
                                    "${alNukhbaScriptRequests[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Requests'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Complaints and abuses".tr,
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
                          itemCount: alnukhbaScriptComplaints.length,
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
                                        text: "${alnukhbaScriptComplaints[index]['title']}\n\n"
                                            "${alnukhbaScriptComplaints[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.redAccent,
                                    )),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                          "${alnukhbaScriptComplaints[index]['title']}",
                                    ));
                                  },
                                  "${alnukhbaScriptComplaints[index]['title']}",
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
                                        text:
                                            "${alnukhbaScriptComplaints[index]['content']}",
                                      ));
                                    },
                                    "${alnukhbaScriptComplaints[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Complaints and abuses'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Other Call Cases".tr,
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
                          itemCount: alnukhbaScriptOtherCallCases.length,
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
                                        text: "${alnukhbaScriptOtherCallCases[index]['title']}\n\n"
                                            "${alnukhbaScriptOtherCallCases[index]['content']}",
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.redAccent,
                                    )),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                          "${alnukhbaScriptOtherCallCases[index]['title']}",
                                    ));
                                  },
                                  "${alnukhbaScriptOtherCallCases[index]['title']}",
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
                                        text:
                                            "${alnukhbaScriptOtherCallCases[index]['content']}",
                                      ));
                                    },
                                    "${alnukhbaScriptOtherCallCases[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Other Call Cases'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
          ],
        ),
      ],
    );
  }
}
