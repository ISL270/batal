// ignore_for_file: unused_field

import 'package:batal/core/firestore/firestore_helper.dart';
import 'package:batal/core/firestore/firestore_service.dart';
import 'package:batal/core/firestore/remote_model.dart';
import 'package:batal/features/authentication/data/sources/remote/user_fs.dart';
import 'package:batal/features/authentication/domain/user.dart';

abstract interface class UserFirestoreSource<FS extends RemoteModel<User>> with FirestoreHelper {
  final FirestoreService _firestoreSvc;
  const UserFirestoreSource(this._firestoreSvc);

  Future<UserFS> getUserInfo(String uid);

  Future<UserFS> saveUserInfo();
}
