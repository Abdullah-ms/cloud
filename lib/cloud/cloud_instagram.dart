import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants/variables.dart';
import '../core/functions/url_LaunchInBrowserView.dart';

class CloudInstagram extends StatefulWidget {
  const CloudInstagram({Key? key}) : super(key: key);

  @override
  State<CloudInstagram> createState() => _CloudInstagramState();
}

class _CloudInstagramState extends State<CloudInstagram> {
  List cloudSocialMedia = [];

  Future readDataSocialMedia() async {
    var url = "http://10.4.1.208/myphpcloud/mylinks/socialmedia.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        cloudSocialMedia.addAll(resbody);
      });
    }
  }

  getDataSocialMedia() async {
    await readDataSocialMedia();
  }

  @override
  void initState() {
    getDataSocialMedia();
    super.initState();
  }

  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchInBrowserView("${cloudSocialMedia[1]['myurl']}");
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: CircleAvatar(
            radius: 12,
            backgroundColor: _isHovering ? Colors.white : Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(0), // Border radius
              child: ClipOval(
                child: Image.asset(
                  "assets/images/instagram.png",
                  color: _isHovering
                      ? Color.fromRGBO(255, 8, 109, 1)
                      : lighttextandtitle,
                ),
              ),
            )),
      ),
    );
  }
}
