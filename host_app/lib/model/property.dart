class Property {
  int id;
  String userId;
  String addressId;
  String title;
  String description;
  int number;
  String complement;
  double price;
  int maxGuest;
  String thumbnail;

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

  Property.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['user_id'],
        addressId = json['address_id'],
        title = json['title'],
        description = json['description'],
        number = json['number'],
        complement = json['complement'],
        price = json['price'],
        maxGuest = json['max_guest'],
        thumbnail = json['thumbnail'];

  toJson() {
    return {
      'id': id,
      'user_id': userId,
      'address_id': addressId,
      'title': title,
      'description': description,
      'number': number,
      'complement': complement,
      'price': price,
      'max_guest': maxGuest,
      'thumbnail': thumbnail,
    };
  }
}
