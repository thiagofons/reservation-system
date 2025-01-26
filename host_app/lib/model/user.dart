class User {
  int? id;
  String? name;
  String? email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] as int : null,
        name = json['name'] != null ? json['name'] as String : null,
        email = json['email'] != null ? json['email'] as String : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
