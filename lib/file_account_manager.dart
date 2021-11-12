import 'dart:io';
import 'src/file_system_manager.dart';

class FileAccountManager {
  FileSystemManager systemManager;

  FileAccountManager(this.systemManager);

  Future<bool> create(String name) async {
    if (name.trim().isEmpty) {
      throw ArgumentError('Argument name is required');
    }

    try {
      await systemManager.create(name);
      return true;
    } on FileSystemException {
      return false;
    }
  }
}