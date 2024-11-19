import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final int id;
  final String name;
  final String type;

  const Payment({
    required this.id,
    required this.name,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
      ];
}
