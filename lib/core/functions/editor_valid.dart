editorValid(String val, int min, int max) {
  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be longer than $max";
  }

  if (val.isEmpty) {
    return "can't be empty";
  }
}
