class Book{
  static const String columnTitle = "title";
  static const String columnAuthor ="author";
  static const String columnPublisher ="publisher";
  static const String columnPrice = "price";

  final String title;
  final String author;
  final String publisher;
  final int price;

  const Book({
    required this.title,
    required this.author,
    required this.publisher,
    required this.price,
  });
  Map<String, dynamic> toMap(){
    return{
      columnTitle: title,
      columnAuthor: author,
      columnPublisher: publisher,
      columnPrice: price,
    };
  }
}