import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  void write(String key, dynamic value) => _box.write(key, value);

  dynamic read(String key) => _box.read(key);

  void remove(String key) => _box.remove(key);

  void erase() => _box.erase();
}
