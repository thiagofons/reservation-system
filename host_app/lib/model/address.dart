class Address {
  int id;
  String cep;
  String street;
  String neighborhood;
  String locality;
  String uf;
  String state;

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
      : id = json['id'],
        cep = json['cep'],
        street = json['street'],
        neighborhood = json['neighborhood'],
        locality = json['locality'],
        uf = json['uf'],
        state = json['state'];

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
