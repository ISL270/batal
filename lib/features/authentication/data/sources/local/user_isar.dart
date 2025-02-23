import 'package:btl_core/core/isar/cache_model.dart';
import 'package:btl_core/features/authentication/domain/user.dart';

abstract base class UserIsar extends CacheModel<User> {
  @override
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  const UserIsar({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
  });

  @override
  User toDomain();
}
