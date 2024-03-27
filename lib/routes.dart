import 'package:get/get_navigation/src/routes/get_route.dart';
import 'cloud/cloud.dart';
import 'core/constants/route_names.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: ()=>   CloudHome()  ,)  ,
];

