class Booking {
  final int id;
  final int userId;
  final int propertyId;
  final String checkinDate;
  final String checkoutDate;
  final int totalDays;
  final double totalPrice;
  final int amountGuest;
  final double rating;

  Booking({
    required this.id,
    required this.userId,
    required this.propertyId,
    required this.checkinDate,
    required this.checkoutDate,
    required this.totalDays,
    required this.totalPrice,
    required this.amountGuest,
    required this.rating,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['userId'],
      propertyId: json['propertyId'],
      checkinDate: json['checkinDate'],
      checkoutDate: json['checkoutDate'],
      totalDays: json['totalDays'],
      totalPrice: json['totalPrice'].toDouble(),
      amountGuest: json['amountGuest'],
      rating: json['rating'].toDouble(),
    );
  }
}