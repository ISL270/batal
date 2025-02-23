// ignore_for_file: unused_field

import 'package:btl_core/core/firestore/firestore_helper.dart';
import 'package:btl_core/core/firestore/firestore_service.dart';
import 'package:btl_core/core/firestore/remote_model.dart';
import 'package:btl_core/features/authentication/data/sources/remote/user_info_fs.dart';
import 'package:btl_core/features/authentication/domain/user.dart';

abstract interface class UserFirestoreSource<FS extends RemoteModel<User>> with FirestoreHelper {
  final FirestoreService _firestoreSvc;
  const UserFirestoreSource(this._firestoreSvc);

  Future<UserFS> getUserInfo(String uid);

  Future<UserFS> saveUserInfo();
}
