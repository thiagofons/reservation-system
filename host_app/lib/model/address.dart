class Address {
  int? id;
  String? cep;
  String? street;
  String? neighborhood;
  String? locality;
  String? uf;
  String? state;

  Address({
    required this.id,
    required this.cep,
    required this.street,
    required this.neighborhood,
    required this.locality,
    required this.uf,
    required this.state,
  });

  Address.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] as int : null,
        cep = json['cep'] != null ? json['cep'] as String : null,
        street = json['street'] != null ? json['street'] as String : null,
        neighborhood = json['neighborhood'] != null
            ? json['neighborhood'] as String
            : null,
        locality = json['locality'] != null ? json['locality'] as String : null,
        uf = json['uf'] != null ? json['uf'] as String : null,
        state = json['state'] != null ? json['state'] as String : null;

  toJson() {
    return {
      'id': id,
      'cep': cep,
      'street': street,
      'neighborhood': neighborhood,
      'locality': locality,
      'uf': uf,
      'state': state,
    };
  }
}
