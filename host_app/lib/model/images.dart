class Images {
  int id;
  String propertyId;
  String url;

  Images({
    required this.id,
    required this.propertyId,
    required this.url,
  });

  Images.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        propertyId = json['property_id'],
        url = json['url'];

  toJson() {
    return {
      'id': id,
      'property_id': propertyId,
      'url': url,
    };
  }
}
