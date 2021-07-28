Map<String, dynamic> processData(Map<String, dynamic> data) {
  var result = <String, dynamic> {};
  data.forEach((key, value) {
    if (value is Map) {
      var innerMap = Map.fromEntries(
          value.entries.map((e) => MapEntry('${key}_${e.key}', e.value)));
      result.addAll(processData(innerMap));
    } else {
      result[key] = value;
    }
  });
  return result;
}
