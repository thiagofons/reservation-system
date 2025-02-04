import 'package:host_app/model/property.dart';
import 'package:host_app/repository/property.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class PropertyService {
  final PropertyRepository _propertyRepository;

  const PropertyService(this._propertyRepository);

  /// Returns all properties of user with [userId]
  Future<List<Property>?> getAllProperties(int userId) async {
    try {
      final properties = await _propertyRepository.getAllByUserId(userId);

      if (properties == null) {
        throw Error.safeToString(
            "🏠 Property Service - ❌ Properties not found");
      }

      logger.d("🏠 Property Service - ✅ Properties found");

      return properties.map((property) => Property.fromJson(property)).toList();
    } catch (error) {
      logger.e(error);
      return null;
    }
  }

  /// Create a new property [property]
  Future<Property?> createProperty(Property property) async {
    try {
      final response = await _propertyRepository.insert(property.toJson());

      if (response == 0) {
        throw Error.safeToString(
            "🏠 Property Service - ❌ Error creating property");
      }

      logger.d("🏠 Property Service - ✅ Property created");

      return property;
    } catch (error) {
      logger.e(error);
      return null;
    }
  }
}
