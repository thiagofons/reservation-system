import 'package:host_app/model/property.dart';
import 'package:host_app/repository/property.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class PropertyService {
  final repository = PropertyRepository();

  PropertyService();

  getAllProperties(String id) async {
    try {
      final properties = await repository.getAllProperties(id);

      if (properties.isEmpty) {
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
}
