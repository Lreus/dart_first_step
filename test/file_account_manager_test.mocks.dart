// Mocks generated by Mockito 5.0.16 from annotations
// in first_step/test/file_account_manager_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:io' as _i2;

import 'package:first_step/src/file_system_manager.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFile_0 extends _i1.Fake implements _i2.File {}

/// A class which mocks [FileSystemManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileSystemManager extends _i1.Mock implements _i3.FileSystemManager {
  MockFileSystemManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.File> create(dynamic fullPath) =>
      (super.noSuchMethod(Invocation.method(#create, [fullPath]),
              returnValue: Future<_i2.File>.value(_FakeFile_0()))
          as _i4.Future<_i2.File>);
  @override
  String toString() => super.toString();
}
