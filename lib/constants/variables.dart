
import 'dart:core';
import 'package:flutter/material.dart';



Color helpertitleTextColor = const Color.fromRGBO(0, 159, 255, 1);

late var myusername, myemail, mypassword;




bool isarabic = true;

TextStyle textOfFAB =  TextStyle(color: earthblue , fontSize: 15  );
TextStyle textOfdroplists =  const TextStyle(color:  Color.fromRGBO(154, 35, 89, 1) ,  fontSize: 14 , fontWeight: FontWeight.bold );
ButtonStyle  textbuttonStyle =  ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.pink;
        }
        return lighttextandtitle ; // null throus error in flutter 2.2+.
      }
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.yellow;
        }
        return Colors.transparent ; // null throus error in flutter 2.2+.
      }
  ),
);
ButtonStyle  droptextbuttonStyle =  ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.blue;
        }
        return  const Color.fromRGBO(154, 35, 89, 1); // null throus error in flutter 2.2+.
      }
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.yellow;
        }
        return Colors.transparent ; // null throus error in flutter 2.2+.
      }
  ),
);



Color cloudMainColor = Color.fromRGBO(2, 32, 252, 1);


Color mainColor =  const Color.fromRGBO(154, 35, 89, 1);
Color earthblue = const Color.fromRGBO(0, 128, 128, 1); // const Color.fromRGBO(0, 159, 255, 1);
Color earthred =  const Color.fromRGBO(244, 26, 32, 1);
Color barColor = const Color.fromRGBO(0, 128, 128, 1); // const Color.fromRGBO(0, 159, 255, 1);


Color borderofTextFieldForLoginAndSignup = earthblue ;
Color enabledborder = Colors.deepPurpleAccent;
//light mode
//Color lightappbar = const Color.fromRGBO(0, 128, 128, 1); //  const Color.fromRGBO(0, 159, 255, 1);
Color lightbackground =   const Color.fromRGBO(255, 255, 255, 1);
Color lightappbartitle =  const Color.fromRGBO(255, 255, 255, 1);
Color lighttextandtitle = const Color.fromRGBO(0, 0, 38, 1); // const Color.fromRGBO(0, 159, 255, 1);
Color iconcolor = const Color.fromRGBO(244, 26, 32, 1);
Color lightbodycolor = Colors.black;
Color lightdialogbackground = Colors.white;
Color lightMainBackground = Color.fromRGBO(230, 233, 238, 1);
Color lightcolorOFFABbackground = const Color.fromRGBO(255, 255, 255, 1);
Color lightsubiconcolor = const Color.fromRGBO(244, 26, 32, 1);
Color lightFAB = const Color.fromRGBO(0, 128, 128, 0.7); // const Color.fromRGBO(0, 159, 255, 0.7);
Color lightring = const Color.fromRGBO(0, 128, 128, 0.07); //  const Color.fromRGBO(0, 159, 255, 0.07);
Color lightdropdownColor =Colors.white;// const Color.fromRGBO(158, 165, 188 ,1);
Color mydropFocusColor =  const Color.fromRGBO(214, 63, 121 ,1);
// Color lightdroptextcolor =  lightappbar;//const Color.fromRGBO(0, 159, 255, 1);
Color lightactionicons = const Color.fromRGBO(255, 255, 255 ,1);
Color mylight =  Color.fromRGBO(7, 137, 140, 0.4);
Color mylightlight =  Color.fromRGBO(7, 137, 140, 0.08);
Color lightexpandlistcolor1 =   Color.fromRGBO(232, 233, 235, 1) ;
Color lightexpandlistcolor2 =   Color.fromRGBO(190, 195, 198, 1) ;
Color lighttextlogo =   Color.fromRGBO(40, 55, 71, 1);




// dark mmode
Color darkappbar =  const Color.fromRGBO(154, 35, 89, 1);
Color darkbackground = const Color.fromRGBO(35, 43, 54, 1) ;
Color darkappbartitle = Colors.white;  // const Color.fromRGBO(0, 159, 255, 1);
Color darktextandtitle = Colors.white;  // const Color.fromRGBO(0, 159, 255, 1);
Color darkcolor = const Color.fromRGBO(244, 26, 32, 1);
Color darkbodycolor = Colors.white;
Color darkdialogbackground = const Color.fromRGBO(35, 43, 54, 1);
Color darkMainBackground =  Color.fromRGBO(35, 43, 54, 1);
Color darkcolorOFFABbackground = const Color.fromRGBO(35, 43, 54, 1) ;
Color darksubiconcolor= const Color.fromRGBO(244, 26, 32, 1);
Color darkFAB = const Color.fromRGBO(154, 35, 89, 1);
Color darkring = const Color.fromRGBO(154, 35, 89, 0.2);
Color darkdroptextcolor = darkappbar; // const Color.fromRGBO(154, 35, 89, 1);
Color darkdropdownColor =  Colors.white;
Color mydark =  Color.fromRGBO(154, 35, 89, 0.4);
Color mydarkdark =  Color.fromRGBO(35, 43, 54, 0.15);
Color darkexpandlistcolor1 =   const Color.fromRGBO(77, 75, 79, 1) ;
Color darkexpandlistcolor2 =   Color.fromRGBO(54, 69, 79, 1) ;
Color darktextlogo =   Color.fromRGBO(255, 255, 255, 1);



//fuchsia mode
Color fuchsiaappbar =  const Color.fromRGBO(219, 61, 132, 1);
Color fuchsiabackground =  const Color.fromRGBO(255, 255, 255, 1);
Color fuchsiaappbartitle =  const Color.fromRGBO(255, 255, 255, 1);
Color fuchsiatextandtitle = const Color.fromRGBO(255, 255, 255, 1);
Color fuchsiacolor = const Color.fromRGBO(219, 61, 132, 1);
Color fuchsiabodycolor = Colors.white;
Color fuchsiadialogbackground = const Color.fromRGBO(219, 61, 132, 1);

//violet mode
Color violetappbar =  const Color.fromRGBO(127, 0, 255, 1);
Color violetbackground =  const Color.fromRGBO(255, 255, 255, 1);
Color violetappbartitle =  const Color.fromRGBO(255, 255, 255, 1);
Color violettextandtitle =  Colors.white;
Color violetcolor = const Color.fromRGBO(127, 0, 255, 1);
Color violetbodycolor = Colors.white;
Color violetdialogbackground =  const Color.fromRGBO(127, 0, 255, 1);


Color backgroundOfLoginStart =  const Color.fromRGBO(255, 134, 116, 0.7);
Color backgroundOfLoginEnd =  const Color.fromRGBO(249, 139, 136, 1);

Color expandlistcolor1 =  Color.fromRGBO(0, 102, 153, 0.08);
Color expandlistcolor2 =   Color.fromRGBO(0, 102, 153, 0.3) ;


Color tablecolor1 =  Color.fromRGBO(0, 128, 128, 1);
Color tablecolor2 =   Color.fromRGBO(0, 128, 128, 0.5) ;

double cascadeiconsize = 20;

// double titlefontsize = 4.sp;
// double textsize = 2.75.sp;
// double dialoghieght = 450;
// double dialogwidth = 500;
// double listviewcontainer = 25.w;
// double iconsize = 3.sp;
// double borderpadding = 6.0 ;
// double borderwidth= 1 ;

double dialoghieght = 460; // Get.height/1.4; // old = 400
double dialogwidth = 910;   // Get.width/1.2;  // old = 500
double titlefontsize = 22;
double textsize = 20;
double tabsfontSize = 14;
//double listviewcontainer = 25.w;
double iconsize = 15;
double borderpadding = 6.0 ;
double borderwidth= 1 ;


double nornalSupportTextSize = 40 ;
double onFlipSupportTextSize = 70 ;

double nornalMoreTextSize = 40 ;
double onFlipMoreTextSize = 70 ;

double nornalVipTextSize = 40 ;
double onFlipVipTextSize = 70 ;


double HightOfHelperTabs = 35;

