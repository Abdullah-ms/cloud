import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import '../../../constants/variables.dart';

class AppBarNotificationButton extends StatefulWidget {
  final String updateBodyText;

  const AppBarNotificationButton({
    Key? key,
    required this.updateBodyText,
  }) : super(key: key);

  @override
  State<AppBarNotificationButton> createState() =>
      _AppBarNotificationButtonState();
}

class _AppBarNotificationButtonState extends State<AppBarNotificationButton> {
  var notificationCounter = 0;

  @override
  Widget build(BuildContext context) {
    return IconBadge(
        icon: const Icon(
          Icons.notifications_none,
          color: Colors.white,
        ),
        itemCount: notificationCounter + 1,
        badgeColor: Colors.red,
        itemColor: Colors.white,
        hideZero: true,
        onTap: () {
          setState(
            () {
              Get.defaultDialog(
                title: '''
Updates : 
            ''',
                content: Container(
                  height: 400,
                  width: 800,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      showCursor: true,
                      cursorColor: Colors.redAccent,
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                          text: widget.updateBodyText,
                        ));
                      },
                      widget.updateBodyText,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: lightbodycolor),
                    ),
                  ),
                ),
                backgroundColor: lightdialogbackground,
                titleStyle: TextStyle(color: lightbodycolor),
              );
              notificationCounter = -1;
            },
          );
        });
  }
}
