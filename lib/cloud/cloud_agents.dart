import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/my_url_button.dart';
import '../../constants/variables.dart';

class CloudAgents extends StatefulWidget {
  final String title;

  final List myList;

  const CloudAgents({super.key, required this.title, required this.myList});

  @override
  State<CloudAgents> createState() => _CloudAgentsState();
}

class _CloudAgentsState extends State<CloudAgents> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Get.defaultDialog(
          buttonColor: Colors.blue,
          textCancel: "Back".tr,
          cancelTextColor: Colors.blue,
          onCancel: () {
            Get.previousRoute;
          },
          title: widget.title,
          content: Expanded(
            child: Container(
                height: screenHeight,
                width: screenWidth,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                  Border.all(color: lighttextandtitle, width: borderwidth),
                ),
                child: ListView.builder(
                    itemCount: widget.myList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Table(
                          border: TableBorder.all(
                              color: index % 2 == 0 ? tablecolor1 : tablecolor2,
                              width: 1),
                          columnWidths: const {
                            0: FlexColumnWidth(0.5),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(2),
                            3: FlexColumnWidth(2),
                            4: FlexColumnWidth(2),
                            5: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(children: [
                              index == 0
                                  ? const Text("")
                                  : IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${widget.myList[index]['agent_name']}\n${widget.myList[index]['agent_office']}\n${widget.myList[index]['agent_address']}\n ${widget.myList[index]['agent_zone']} \n${widget.myList[index]['agent_num']}\n",
                                    ));
                                  },
                                  icon: const Icon(
                                    size: 15,
                                    Icons.copy,
                                    color: Colors.grey,
                                  )),
                              Center(
                                child: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${widget.myList[index]['agent_name']}",
                                    ));
                                  },
                                  "${widget.myList[index]['agent_name']}",
                                  textDirection: TextDirection.rtl,
                                  style: index == 0
                                      ? const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                      : TextStyle(color: lightbodycolor),
                                ),
                              ),
                              Center(
                                child: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${widget.myList[index]['agent_office']}",
                                    ));
                                  },
                                  "${widget.myList[index]['agent_office']}",
                                  textDirection: TextDirection.rtl,
                                  style: index == 0
                                      ? const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                      : TextStyle(color: lightbodycolor),
                                ),
                              ),
                              Center(
                                child: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${widget.myList[index]['agent_address']}",
                                    ));
                                  },
                                  "${widget.myList[index]['agent_address']}",
                                  textDirection: TextDirection.rtl,
                                  style: index == 0
                                      ? const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                      : TextStyle(color: lightbodycolor),
                                ),
                              ),
                              Center(
                                child: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${widget.myList[index]['agent_zone']}",
                                    ));
                                  },
                                  "${widget.myList[index]['agent_zone']}",
                                  textDirection: TextDirection.rtl,
                                  style: index == 0
                                      ? const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                      : TextStyle(color: lightbodycolor),
                                ),
                              ),
                              Center(
                                child: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${widget.myList[index]['agent_num']}",
                                    ));
                                  },
                                  "${widget.myList[index]['agent_num']}",
                                  textDirection: TextDirection.rtl,
                                  style: index == 0
                                      ? const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                      : TextStyle(color: lightbodycolor),
                                ),
                              ),
                            ]),
                          ]);
                    })),
          ),
          backgroundColor: lightdialogbackground,
          titleStyle: TextStyle(color: lightbodycolor),
        );
      },
      icon: Icon(
        Icons.table_chart_sharp,
        size: cascadeiconsize,
        color: iconcolor,
      ),
      label: Text(
        widget.title,
        style: TextStyle(fontSize: textsize),
      ),
      style: textbuttonStyle,
    );
  }
}