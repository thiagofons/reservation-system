class Property {
  int? id;
  int? userId;
  int? addressId;
  String? title;
  String? description;
  int? number;
  String? complement;
  double? price;
  int? maxGuest;
  String? thumbnail;

  Property({
    this.id,
    this.userId,
    this.addressId,
    this.title,
    this.description,
    this.number,
    this.complement,
    this.price,
    this.maxGuest,
    this.thumbnail,
  });

  Property.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] as int : null,
        userId = json['user_id'] != null ? json['user_id'] as int : null,
        addressId =
            json['address_id'] != null ? json['address_id'] as int : null,
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
