import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'text') {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid username must contain the @ symbol';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Invalid email';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Invalid phone';
    }
  }

  if (val.isEmpty) {
    return "can't be empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be longer than $max";
  }

}
