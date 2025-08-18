// chat_view_model.dart
import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final String time;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.time,
    required this.isUser,
  });
}

class ChatViewModel extends ChangeNotifier {
  final TextEditingController messageController = TextEditingController();
  final List<ChatMessage> messages = [
    ChatMessage(
      text: "Hi there! I'm your Aura Analyst. Ask me anything about your aura, energy, or what your colors mean.",
      time: "09:18 PM",
      isUser: false,
    ),
  ];

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Add user message
    messages.add(ChatMessage(
      text: text,
      time: _getCurrentTime(),
      isUser: true,
    ));

    // Add bot response
    messages.add(ChatMessage(
      text: _generateResponse(text),
      time: _getCurrentTime(),
      isUser: false,
    ));

    messageController.clear();
    notifyListeners();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour < 12 ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $period';
  }

  String _generateResponse(String userMessage) {
    // Simple response logic - replace with your actual AI integration
    if (userMessage.toLowerCase().contains('green')) {
      return "Green auras represent healing, growth, and compassion. You may be nurturing, balanced, and drawn to nature or helping others heal emotionally or physically.";
    } else if (userMessage.toLowerCase().contains('improve')) {
      return "To improve your aura, try meditation, spending time in nature, practicing gratitude, and surrounding yourself with positive energy.";
    }
    return "I sense your energy is strong. Could you tell me more about what you're experiencing?";
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}