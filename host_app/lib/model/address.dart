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
        street =
            json['logradouro'] != null ? json['logradouro'] as String : null,
        neighborhood = json['bairro'] != null ? json['bairro'] as String : null,
        locality =
            json['localidade'] != null ? json['localidade'] as String : null,
        uf = json['uf'] != null ? json['uf'] as String : null,
        state = json['estado'] != null ? json['estado'] as String : null;

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
