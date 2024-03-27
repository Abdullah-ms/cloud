import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
import '../constants/variables.dart';



class AlnukhbaSearchAPI extends StatefulWidget {
  const AlnukhbaSearchAPI({Key? key}) : super(key: key);

  @override
  State<AlnukhbaSearchAPI> createState() => _AlnukhbaSearchAPIState();
}

class _AlnukhbaSearchAPIState extends State<AlnukhbaSearchAPI> {


  final List<Posts> _list = [];
  final List<Posts> _search = [];
  var loading = false;

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
    await http.get(Uri.parse("http://10.4.1.208/myphpcloud/search/search.php"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map<String, dynamic> i in data) {
          _list.add(Posts.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = TextEditingController();


  late final String text;

  onSearch(String text) async {
    _search.clear();
    if (text.toLowerCase().isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.title.contains(text) || f.content.contains(text)) {
        _search.add(f);
      }
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
         backgroundColor: cloudMainColor,
        elevation: 0,),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            color: cloudMainColor,
            child: Card(
              elevation: 0,
              child: ListTile(

                leading: Icon(Icons.search, color: cloudMainColor),
                title: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      hintText: "Type to search...",
                      hintStyle: TextStyle(color: cloudMainColor, fontSize: 12),
                      border: InputBorder.none),
                ),

                trailing: IconButton(
                  onPressed: () {
                    controller.clear();
                    onSearch('');
                  },
                  icon: Icon(Icons.cancel, color: earthred),
                ),
              ),
            ),
          ),
          loading
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.transparent,
            ),
          )
              : Expanded(
            child: _search.isNotEmpty || controller.text.isNotEmpty
                ? ListView.builder(
              itemCount: _search.length,
              itemBuilder: (context, i) {
                final item = _search[i];
                return  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RichText(
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              style: DefaultTextStyle
                                  .of(context)
                                  .style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: item.title.contains(controller.text.toLowerCase())
                                        ?
                                    item.title.substring(0,
                                        item.title.indexOf(controller.text.toLowerCase()))
                                        : item.title,
                                    style: const TextStyle(color: Colors.blue)
                                ),
                                item.title.contains(controller.text.toLowerCase()) ?
                                TextSpan(
                                    text: controller.text.toLowerCase(),
                                    style: const TextStyle(
                                      backgroundColor: Colors.yellowAccent,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,)
                                ) :
                                const TextSpan(),
                                item.title.contains(controller.text.toLowerCase()) ?
                                TextSpan(
                                    text: item.title.substring(
                                        item.title.indexOf(controller.text.toLowerCase()) +
                                            (controller.text.toLowerCase()).length),
                                    style: const TextStyle(color: Colors.blue)
                                ) : const TextSpan(),
                              ],
                            )
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        /* RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: item.body.substring(0, item.body.indexOf(controller.text)),
                                    style: const TextStyle(color: Colors.black)
                                ),
                                item.title.contains(controller.text) ?
                                TextSpan(
                                    text: controller.text,
                                    style: const TextStyle(backgroundColor: Colors.yellowAccent )
                                ):
                                TextSpan(
                                    text: item.body.substring(item.body.indexOf(controller.text) + controller.text.length),
                                    style: const TextStyle(color: Colors.black)
                                ),
                              ],
                            )
                        ),*/
                        RichText(
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              style: DefaultTextStyle
                                  .of(context)
                                  .style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: item.content.contains(
                                        controller.text.toLowerCase()) ?
                                    item.content.substring(0, item.content.indexOf(
                                        controller.text.toLowerCase())) : item
                                        .content,
                                    style: const TextStyle(
                                        color: Colors.black)
                                ),
                                item.content.contains(
                                    controller.text.toLowerCase()) ?
                                TextSpan(
                                    text: controller.text.toLowerCase(),
                                    style: const TextStyle(
                                        backgroundColor: Colors.yellowAccent,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)
                                ) :
                                const TextSpan(),
                                item.content.contains(
                                    controller.text.toLowerCase()) ?
                                TextSpan(
                                    text: item.content.substring(
                                        item.content.indexOf(
                                            controller.text.toLowerCase()) +
                                            controller.text.length),
                                    style: const TextStyle(
                                        color: Colors.black)
                                ) : const TextSpan(
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                        ),
                        Divider(color: Colors.black45 ),
                      ],
                    ));

              },
            )
                : ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, i) {
                final a = _list[i];
                return Center(
                  child: Container(
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Posts {
  final String title;
  final String content;

  Posts({required this.title, required this.content});

  factory Posts.formJson(Map <String, dynamic> json){
    return Posts(
      title: json['title'].toLowerCase(), content: json['content'].toLowerCase(),
    );
  }
}



