class Booking {
  int id;
  int userId;
  int propertyId;
  int checkInDate;
  int checkOutDate;
  int totalDays;
  double totalPrice;
  int amoutGuest;
  double rating;

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
      : id = json['id'],
        userId = json['user_id'],
        propertyId = json['property_id'],
        checkInDate = json['check_in_date'],
        checkOutDate = json['check_out_date'],
        totalDays = json['total_days'],
        totalPrice = json['total_price'],
        amoutGuest = json['amout_guest'],
        rating = json['rating'];

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
