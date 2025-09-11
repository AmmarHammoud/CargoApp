import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';

import '../../models/user_model.dart';

abstract class StorageHelper {
  static late GetStorage _storage;

  static init() async {
    await GetStorage.init();
    _storage = GetStorage();
    // _storage.remove('token');
  }

  static late LatLng myInitialLocation;

  static storeUser(UserModel user) {
    _storage.write('id', user.id);
    _storage.write('email', user.email);
    _storage.write('userName', user.userName);
    _storage.write('phone', user.phone);
    _storage.write('token', user.token);
  }

  static UserModel getUser() {
    return UserModel(
      id: _storage.read('id'),
      userName: _storage.read('userName'),
      email: _storage.read('email'),
      phone: _storage.read('phone'),
    );
  }

  static removeUser(){
    _storage.remove('id');
    _storage.remove('userName');
    _storage.remove('email');
    _storage.remove('phone');
    _storage.remove('token');
  }

  static String? getUserToken() {
    return _storage.read('token');
  }
}
