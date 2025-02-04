class Images {
  int? id;
  int? propertyId;
  String? url;

  Images({
    required this.id,
    required this.propertyId,
    required this.url,
  });

  Images.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] as int : null,
        propertyId =
            json['property_id'] != null ? json['property_id'] as int : null,
        url = json['url'] != null ? json['url'] as String : null;

  toJson() {
    return {
      'id': id,
      'property_id': propertyId,
      'url': url,
    };
  }
}
