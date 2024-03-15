import 'dart:io';


class JsonUtils {
  static String  readJsonFile(String fileName) {
    String dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = dir.replaceAll('/test', '');
    }
    return File('$dir/test/dummy_data/$fileName.json').readAsStringSync();
  }
}