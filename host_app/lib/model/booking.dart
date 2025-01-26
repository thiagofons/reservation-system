class Booking {
  int? id;
  int? userId;
  int? propertyId;
  int? checkInDate;
  int? checkOutDate;
  int? totalDays;
  double? totalPrice;
  int? amoutGuest;
  double? rating;

  Booking({
    required this.id,
    required this.userId,
    required this.propertyId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.totalDays,
    required this.totalPrice,
    required this.amoutGuest,
    required this.rating,
  });

  Booking.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] as int : null,
        userId = json['user_id'] != null ? json['user_id'] as int : null,
        propertyId =
            json['property_id'] != null ? json['property_id'] as int : null,
        checkInDate =
            json['check_in_date'] != null ? json['check_in_date'] as int : null,
        checkOutDate = json['check_out_date'] != null
            ? json['check_out_date'] as int
            : null,
        totalDays =
            json['total_days'] != null ? json['total_days'] as int : null,
        totalPrice =
            json['total_price'] != null ? json['total_price'] as double : null,
        amoutGuest =
            json['amout_guest'] != null ? json['amout_guest'] as int : null,
        rating = json['rating'] != null ? json['rating'] as double : null;

  toJson() {
    return {
      'id': id,
      'user_id': userId,
      'property_id': propertyId,
      'check_in_date': checkInDate,
      'check_out_date': checkOutDate,
      'total_days': totalDays,
      'total_price': totalPrice,
      'amout_guest': amoutGuest,
      'rating': rating,
    };
  }
}
