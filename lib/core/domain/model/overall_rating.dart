import 'package:equatable/equatable.dart';

class OverallRating extends Equatable {
  const OverallRating({
    required this.rating,
    required this.count,
  });

  const OverallRating.empty()
      : rating = 0,
        count = 0;

  final double rating;
  final int count;

  @override
  List<Object?> get props => [
        rating,
        count,
      ];

  OverallRating copyWith({
    double? rating,
    int? count,
  }) {
    return OverallRating(
      rating: rating ?? this.rating,
      count: count ?? this.count,
    );
  }
}