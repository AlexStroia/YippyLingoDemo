import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String name;
  final String description;
  final String age;

  const Review({
    required this.id,
    required this.name,
    required this.description,
    required this.age,
  });

  factory Review.empty() {
    return const Review(id: '', name: '', description: '', age: '');
  }

  @override
  List<Object?> get props => [
        id,
        age,
        description,
      ];
}
