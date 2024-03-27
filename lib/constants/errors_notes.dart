/*

1- في حال استخدام Expansion Tile ويطلع error عند فتح اكثر من واحدة ...الحل هو الغاء ال Key.

------------------------------------------------------------------------------------------------

م/ مرات من تنصب فلاتر جديدة الموقع مال جيك لست ميشتغل والحل هو بهذا الفديو :
https://www.youtube.com/watch?v=H-q-_0oGOzg

او بالخطوات التالية :

    1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
    2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
    3- Find '--disable-extensions' disable it .
    4- Add '--disable-web-security'

-------------------------------------------------------------------------------------------------

هذه الاوامر لمعالجة الاخطاء مرة واحدة في كل المشروع مثلا
المكاتب غير المستخدمةunnecessary_import
prefer_const_constructors_in_immutables او اضافة كونست
...الخ

dart fix --dry-run      Preview the proposed changes but make no changes.
dart fix --apply        Apply the proposed changes.

-------------------------------------------------------------------------------------------------





 */