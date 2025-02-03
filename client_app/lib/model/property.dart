class Property {
  final int id;
  final int userId;
  final int addressId;
  final String title;
  final String description;
  final String number;
  final String complement;
  final double price;
  final int maxGuest;
  final String thumbnail;

  Property({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.title,
    required this.description,
    required this.number,
    required this.complement,
    required this.price,
    required this.maxGuest,
    required this.thumbnail,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      userId: json['userId'],
      addressId: json['addressId'],
      title: json['title'],
      description: json['description'],
      number: json['number'],
      complement: json['complement'],
      price: json['price'].toDouble(),
      maxGuest: json['maxGuest'],
      thumbnail: json['thumbnail'],
    );
  }
}
