import 'package:equatable/equatable.dart';

class Review extends Equatable {

  final String id;
  final String title;
  final String description;
  final int rating;
  final String owner;
  final String timestamp;

  const Review({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.owner,
    required this.timestamp,
  });


  factory Review.empty() {
    return const Review(
      id: '',
      title: '',
      description: '',
      rating: 0,
      owner: '',
      timestamp: '',
    );
  }




  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}