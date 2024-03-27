import 'package:flutter/material.dart';

class AppBarTitle extends StatefulWidget {
  final String title;

  const AppBarTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title , style: TextStyle(color: Colors.white ),);
  }
}
