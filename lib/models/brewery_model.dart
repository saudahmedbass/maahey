class BreweryModel {
  BreweryModel({
    this.id,
    this.name,
    this.breweryType,
    this.street,
    this.address2,
    this.address3,
    this.city,
    this.state,
    this.countyProvince,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.updatedAt,
    this.createdAt,
  });

  BreweryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    breweryType = json['brewery_type'];
    street = json['street'];
    address2 = json['address_2'];
    address3 = json['address_3'];
    city = json['city'];
    state = json['state'];
    countyProvince = json['county_province'];
    postalCode = json['postal_code'];
    country = json['country'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    phone = json['phone'];
    websiteUrl = json['website_url'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
  String? id;
  String? name;
  String? breweryType;
  String? street;
  String? address2;
  String? address3;
  String? city;
  String? state;
  String? countyProvince;
  String? postalCode;
  String? country;
  String? longitude;
  String? latitude;
  String? phone;
  String? websiteUrl;
  String? updatedAt;
  String? createdAt;
  BreweryModel copyWith({
    String? id,
    String? name,
    String? breweryType,
    String? street,
    String? address2,
    String? address3,
    String? city,
    String? state,
    String? countyProvince,
    String? postalCode,
    String? country,
    String? longitude,
    String? latitude,
    String? phone,
    String? websiteUrl,
    String? updatedAt,
    String? createdAt,
  }) =>
      BreweryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        breweryType: breweryType ?? this.breweryType,
        street: street ?? this.street,
        address2: address2 ?? this.address2,
        address3: address3 ?? this.address3,
        city: city ?? this.city,
        state: state ?? this.state,
        countyProvince: countyProvince ?? this.countyProvince,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        phone: phone ?? this.phone,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['brewery_type'] = breweryType;
    map['street'] = street;
    map['address_2'] = address2;
    map['address_3'] = address3;
    map['city'] = city;
    map['state'] = state;
    map['county_province'] = countyProvince;
    map['postal_code'] = postalCode;
    map['country'] = country;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['phone'] = phone;
    map['website_url'] = websiteUrl;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    return map;
  }
}
