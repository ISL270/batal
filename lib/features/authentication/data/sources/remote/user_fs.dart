import 'package:batal/core/firestore/remote_model.dart';
import 'package:batal/features/authentication/domain/user.dart';

abstract base class UserFS implements RemoteModel<User> {
  @override
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  const UserFS({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  User toDomain();

  UserFS fromDomain(User user);

  Map<String, dynamic> toJson();
}
