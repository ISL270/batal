import 'package:equatable/equatable.dart';

sealed class SET extends Equatable {
  final int value;
  const SET(this.value);

  SET copyWith(int value);

  Map<String, dynamic> toJson();

  static SET fromJson(Map<String, dynamic> json) => switch (json['type'] as String) {
        Regular.key => Regular((json['value'] as num).toInt()),
        _ => throw UnimplementedError('Unkonwn set type'),
      };

  @override
  List<Object?> get props => [value];
}

class Regular extends SET {
  const Regular(super.value);
  factory Regular.first() => const Regular(1);

  @override
  Regular copyWith(int value) => Regular(value);

  @override
  Map<String, dynamic> toJson() => {
        'type': key,
        'value': value,
      };

  static const key = 'regular';
}

// We'll need the code below when we introduce other SET types.

// class WarmUp extends SET {
//   const WarmUp(super.value);
//   factory WarmUp.first() => const WarmUp(1);

//   @override
//   WarmUp copyWith(int value) => WarmUp(value);
// }

// class DropSet extends SET {
//   const DropSet(super.value);
//   factory DropSet.first() => const DropSet(1);

//   @override
//   DropSet copyWith(int value) => DropSet(value);
// }

// class Failure extends SET {
//   const Failure(super.value);
//   factory Failure.first() => const Failure(1);

//   @override
//   Failure copyWith(int value) => Failure(value);
// }
