import 'package:flutter/material.dart';
import 'package:host_app/model/address.dart';
import 'package:host_app/model/property.dart';
import 'package:host_app/service/address.dart';
import 'package:host_app/service/property.dart';

class PropertyViewModel extends ChangeNotifier {
  final AddressService _addressService;
  final PropertyService _propertyService;

  PropertyViewModel(this._addressService, this._propertyService);

  List<Property> _properties = [];

  List<Property> get properties => _properties;

  /// Call the service to get all properties
  void getAllProperties(int userId) async {
    final fetchedProperties = await _propertyService.getAllProperties(userId);

    if (fetchedProperties == null) {
      throw Error();
    }

    _properties = fetchedProperties;

    notifyListeners();
  }

  /// Call the services to create a new property
  void createProperty(Property property, Address address, int userId) async {
    // Call address service to generate an address id
    final createdAddress = await _addressService.createAddress(address);

    if (createdAddress == null) {
      throw Error();
    }

    // Call property service to generate a new property with the generated address id
    property.addressId = createdAddress.id;

    final createdProperty = await _propertyService.createProperty(property);

    if (createdProperty == null) {
      throw Error();
    }

    // Add the property to the state
    _properties.add(createdProperty);

    notifyListeners();
  }
}
