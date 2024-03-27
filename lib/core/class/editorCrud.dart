// مكتبة الكونفرت للتحويل من json الى dart
import 'dart:convert';
import 'package:http/http.dart' as http;

// لربط فلاتر مع الباك ايند
//  ال url هو لنك الapi لصفحة الphpالتي نريدها وهو للقراءة


class CrudAdmin {

  getRequest( String url )async {
    try{
      var response = await http.get(Uri.parse(url)) ;
      if (response.statusCode == 200){
        //الdecode لتحويل json الى dart
        var responsebody = jsonDecode(response.body);
        return  responsebody ;
      }else{
        print("Error ${response.statusCode}");
      }
    }catch(e){
      print("Error catch $e ");
    }
  }

  // الdata هي الركوست الموجود داخل الbody يعني اسماء الحقول وقيمهم

  postRequest( String url , Map data )async {

    // await Future.delayed(Duration(seconds: 10 ));
    // الديتا هي اسماء الركويست التي يتم ارسالها

    try{
      var response = await http.post(Uri.parse(url), body: data) ;
      if (response.statusCode == 200){
        var responsebody = jsonDecode(response.body);
        return  responsebody ;
      }else{
        print("Error ${response.statusCode}");
      }
    }catch(e){
      print("Error catch $e ");
    }
  }

}
