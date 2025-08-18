import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  // You can add any state management logic here
  // For example, data for recent chats could be managed here
  
  final List<Map<String, String>> recentChats = [
    {
      'question': 'Why is my aura mostly blue?',
      'date': 'May 9, 10:32 AM',
    },
    // Add more recent chats as needed
  ];
}