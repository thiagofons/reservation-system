import 'package:host_app/model/address.dart';
import 'package:host_app/repository/address.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class AddressService {
  final AddressRepository _addressRepository;

  const AddressService(this._addressRepository);

  Future<Address?> createAddress(Address address) async {
    try {
      final id = await _addressRepository.insert(address.toJson());

      if (id == 0) {
        throw Error.safeToString(
            "🌍 Address Service - ❌ Error creating address");
      }

      final newAddress = Address(
          id: id,
          cep: address.cep,
          street: address.street,
          neighborhood: address.neighborhood,
          locality: address.locality,
          uf: address.uf,
          state: address.state);

      logger.d("🌍 Address Service - ✅ Address created");

      return newAddress;
    } catch (error) {
      logger.e(error);
      return null;
    }
  }
}
