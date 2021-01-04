
import 'package:get/get.dart';
class IncrementController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}