import 'package:bloved/Models/MessageModel.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final messageList = List<MessageModel>.filled(
          1,
          MessageModel(
              "assets/images/img1.png", "Maria Bailey", "4", "12:30", false),
          growable: true)
      .obs;

  @override
  void onInit() {
    super.onInit();
    listItems();
  }

  Future listItems() async {
    Future.delayed(Duration(seconds: 2));
    var items = [
      MessageModel(
          "assets/images/img1.png", "Maria Bailey", "4", "12:30", false),
      MessageModel(
          "assets/images/img1.png", "Maria Bailey", "4", "12:30", false),
      MessageModel(
          "assets/images/img1.png", "Maria Bailey", "4", "12:30", false),
      MessageModel(
          "assets/images/img1.png", "Maria Bailey", "4", "12:30", false),
    ];
    messageList.value = items;
  }
}
