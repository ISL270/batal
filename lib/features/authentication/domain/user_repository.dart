import 'package:batal/core/isar/cache_model.dart';
import 'package:batal/core/models/generic_exception.dart';
import 'package:batal/features/authentication/data/sources/local/user_isar_source.dart';
import 'package:batal/features/authentication/data/sources/remote/user_firestore_source.dart';
import 'package:batal/features/authentication/data/sources/remote/user_fs.dart';
import 'package:batal/features/authentication/domain/user.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

abstract base class UserRepository<D extends User, R extends UserFS, C extends CacheModel<D>> {
  @protected
  final UserIsarSource<D, C> _localSource;
  @protected
  final UserFirestoreSource<R> _remoteSource;

  const UserRepository(this._localSource, this._remoteSource);

  D? get cachedUser => _localSource.first?.toDomain();

  Future<void> saveUserLocally(D user) => _localSource.put(user);

  Future<void> deleteLocalUser() => _localSource.clear();

  Future<Either<GenericException, User>> getUserRemote({
    required String uid,
  }) async {
    try {
      final userInfoRM = await _remoteSource.getUserInfo(uid);
      return right(userInfoRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }

  Future<Either<GenericException, User>> saveUserInfoRemote({
    required String id,
    required String email,
    required String name,
    required String phoneNumber,
  });
}
