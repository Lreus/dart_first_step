import 'dart:async';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'file_account_manager_test.mocks.dart';

@GenerateMocks([FileSystemManager])
void main() {
  late FileSystemManager mockedFileSystem;
  late FileAccountManager accountManager;

  setUp(() {
    mockedFileSystem = MockFileSystemManager();
    accountManager = FileAccountManager(mockedFileSystem);
  });

  test('creating a file to hold an account', () async {
    var accountFullPath = 'any-path/newAccount';
    when(mockedFileSystem.create(accountFullPath))
        .thenAnswer((_) async => File(''));

    bool managerResult = await accountManager.create(accountFullPath);

    verify(mockedFileSystem.create(accountFullPath));
    expect(managerResult, isTrue);
  });
}

class FileSystemManager {
  Future<File> create(fullPath) async {
    var file = File(fullPath);
    return file.create();
  }
}

class FileAccountManager {
  FileSystemManager systemManager;

  FileAccountManager(this.systemManager);

  Future<bool> create(String name) async {
    try {
      await systemManager.create(name);

      return true;
    } on FileSystemException {
      print('error creating file');

      return false;
    }
  }
}
