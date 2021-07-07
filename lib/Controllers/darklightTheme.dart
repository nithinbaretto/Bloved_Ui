import 'package:bloved/utilities/StorageManager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeValue extends GetxController {
  final box = GetStorage();

  var themeValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    sharedPrefValue();
  }

  updateValue(String themeV) {
    themeValue.value = themeV;
  }

  sharedPrefValue() {
    StorageManager.readData('themeMode').then((value) {
      var val = value.toString();
      print(val);
      updateValue(val);
    });
  }
}
