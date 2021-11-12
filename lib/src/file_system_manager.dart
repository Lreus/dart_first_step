import 'dart:io';

class FileSystemManager {
  Future<File> create(fullPath) async {
    var file = File(fullPath);
    return file.create();
  }
}
