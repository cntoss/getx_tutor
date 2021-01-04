import 'package:get/get.dart';

class Messages extends Translations {
@override
  Map<String, Map<String, String>> get keys => {
   'en_US' : {
     'title' : 'This is getx tutorials',
     'no_click': 'Number of clicks',
     'move': 'Move to Storage Page',
   },
   'ne_NP' : {
     'title' : 'यो getx ट्यूटोरियल हो',
     'no_click': 'क्लिकको संख्या',
     'move': 'भण्डारण पृष्ठमा सार्नुहोस्',
   }
  };
}