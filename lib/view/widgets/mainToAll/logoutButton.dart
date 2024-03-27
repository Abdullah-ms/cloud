import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/route_names.dart';
import '../../../main.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          sharedPref.clear();
          Get.offAllNamed(AppRoute.login);
        },
        icon: const Icon(
          Icons.exit_to_app,
          size: 25,
          color: Colors.redAccent,
        ));
  }
}
