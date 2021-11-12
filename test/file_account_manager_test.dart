import 'dart:async';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'file_account_manager_test.mocks.dart';

@GenerateMocks([FileSystemManager])
void main() {
  late MockFileSystemManager mockedFileSystem;
  late FileAccountManager accountManager;
  String accountFullPath = 'any-path/newAccount';

  Future<bool> createAccount(path) async {
    return accountManager.create(path);
  }

  void fileCreationWillSucceed(path) {
    when(mockedFileSystem.create(path)).thenAnswer((_) async => File(''));
  }

  void fileCreationWillFail(path) {
    when(mockedFileSystem.create(path))
        .thenThrow(FileSystemException('file could not be created'));
  }

  setUp(() {
    mockedFileSystem = MockFileSystemManager();
    accountManager = FileAccountManager(mockedFileSystem);
  });

  group('Degenerate cases', () {
    test('it raises argument error', () {
      expect(
          () async => await createAccount('  '), throwsA(isA<ArgumentError>()));
    });
  });

  group('Given FileSystemException occurs', () {
    test('it returns false', () async {
      fileCreationWillFail(accountFullPath);

      expect(await createAccount(accountFullPath), isFalse);
    });
  });

  group('Given file creation is a success', () {
    test('it triggers a file creation', () async {
      fileCreationWillSucceed(accountFullPath);
      await createAccount(accountFullPath);

      verify(mockedFileSystem.create(accountFullPath));
    });

    test('it returns true', () async {
      fileCreationWillSucceed(accountFullPath);

      expect(await createAccount(accountFullPath), isTrue);
    });
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
