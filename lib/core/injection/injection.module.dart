//@GeneratedMicroModule;BtlCorePackageModule;package:batal/core/injection/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:batal/core/firestore/firestore_service.dart' as _i900;
import 'package:batal/core/injection/auth_module.dart' as _i205;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

class BtlCorePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final authModule = _$AuthModule();
    gh.singleton<_i900.FirestoreService>(() => _i900.FirestoreService());
    gh.singleton<_i59.FirebaseAuth>(() => authModule.auth);
    gh.singleton<_i116.GoogleSignIn>(() => authModule.googleSignIn);
  }
}

class _$AuthModule extends _i205.AuthModule {}
