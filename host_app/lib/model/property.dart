class Property {
  int? id;
  String? userId;
  String? addressId;
  String? title;
  String? description;
  int? number;
  String? complement;
  double? price;
  int? maxGuest;
  String? thumbnail;

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
      : id = json['id'] != null ? json['id'] as int : null,
        userId = json['user_id'] != null ? json['user_id'] as String : null,
        addressId =
            json['address_id'] != null ? json['address_id'] as String : null,
        title = json['title'] != null ? json['title'] as String : null,
        description =
            json['description'] != null ? json['description'] as String : null,
        number = json['number'] != null ? json['number'] as int : null,
        complement =
            json['complement'] != null ? json['complement'] as String : null,
        price = json['price'] != null ? json['price'] as double : null,
        maxGuest = json['max_guest'] != null ? json['max_guest'] as int : null,
        thumbnail =
            json['thumbnail'] != null ? json['thumbnail'] as String : null;

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
