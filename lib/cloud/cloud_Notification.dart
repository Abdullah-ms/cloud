import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CloudNotification extends StatefulWidget {
  const CloudNotification({Key? key}) : super(key: key);

  @override
  State<CloudNotification> createState() => _CloudNotificationState();
}

class _CloudNotificationState extends State<CloudNotification> {
  List cloudNotifications = [];

  Future readDataNotifications() async {
    var url = "http://10.4.1.208/myphpcloud/mydata/notification.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        cloudNotifications.addAll(resbody);
      });
    }
  }

  getDataNotifications() async {
    await readDataNotifications();
  }

  @override
  void initState() {
    getDataNotifications();
    super.initState();
  }

//--------------

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('Notifications'.tr,
              style: TextStyle(
                  color: lighttextandtitle,
                  fontSize: titlefontsize,
                  fontWeight: FontWeight.bold)),
        ),
        Divider(
          color: lighttextandtitle,
          thickness: 3,
        ),
        Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color:  const Color.fromRGBO(255, 121, 22, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 400,
          child: ListView.builder(
              itemCount: cloudNotifications.length,
              //reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0 ? expandlistcolor1 : expandlistcolor2,
                  child: Text("${cloudNotifications[index]['content']}",
                      style: TextStyle(color: lighttextandtitle, fontSize: 18),
                      textDirection: TextDirection.rtl),
                );
              }),
        ),
      ],
    );
  }
}
