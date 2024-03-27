import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Color footerColor;

  const Footer({
    Key? key,
    required this.footerColor,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: widget.footerColor,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Copyright© 2023-2024 Technical_Support_Quality ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
