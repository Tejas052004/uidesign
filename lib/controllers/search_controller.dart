import 'package:get/get.dart';

class SearchController extends GetxController {
  // List of recent places
  var recentPlaces = [
    {
      "title": "Office",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
      "distance": "2.7km"
    },
    {
      "title": "Coffee shop",
      "address": "1901 Thornridge Cir. Shiloh, Hawaii 81063",
      "distance": "1.1km"
    },
    {
      "title": "Shopping center",
      "address": "4140 Parker Rd. Allentown, New Mexico 31134",
      "distance": "4.9km"
    },
    {
      "title": "Shopping mall",
      "address": "4140 Parker Rd. Allentown, New Mexico 31134",
      "distance": "4.0km"
    },
  ].obs;

  // Clear all function
  void clearAll() {
    recentPlaces.clear();
  }
}
