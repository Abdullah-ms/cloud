import 'package:http/http.dart' as http;
import 'dart:convert';

String serverAPI = "http://10.4.1.208/myphp";
String accountingAPI = "$serverAPI/mydata/accounting.php";
String announcementsAPI = "$serverAPI/mydata/announcements.php";
String backofficeAPI = "$serverAPI/mydata/backoffice.php";
String billingAPI = "$serverAPI/mydata/billing.php";

String ChatAPI = "$serverAPI/mydata/chat.php";

String noServiceAPI = "$serverAPI/mydata/noservice.php";
String requestsAPI = "$serverAPI/mydata/requestes.php";
String resellerTicketAPI = "$serverAPI/mydata/ticketReseller.php";
String salesAPI = "$serverAPI/mydata/sales.php";
String scriptAPI = "$serverAPI/mydata/script.php";
String shabakatyAPI = "$serverAPI/mydata/shabakaty.php";
String slowServiceAPI = "$serverAPI/mydata/slowService.php";
String specialCasesAPI = "$serverAPI/mydata/specialCases.php";
String supportTicketAPI = "$serverAPI/mydata/support.php";
String ticketsAPI = "$serverAPI/mydata/tickets.php";
String vipAPI = "$serverAPI/mydata/vip.php";
String notificationsAPI = "$serverAPI/mydata/notification.php";
//links
String linksAPI = "$serverAPI/mylinks/links.php";

readData(String apiUrl) async {
  var res = await http.get(Uri.parse(apiUrl));
  if (res.statusCode == 200) {
    var resBody = jsonDecode(res.body);
    return resBody;
  }
  else {
    throw Exception('Failed to load data');
  }
}

getData() async {
  await readData(serverAPI);
}
