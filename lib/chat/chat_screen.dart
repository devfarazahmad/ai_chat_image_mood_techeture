// chat_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aiiamge/view_model/chat_view_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Psychic Advisor'), centerTitle: true),
        body: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // Date header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Today',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),

                // Chat messages
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    reverse: false,
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final message = viewModel.messages[index];
                      return _buildMessageBubble(message);
                    },
                  ),
                ),

                // Message input
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      // Main input container
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Mic icon button
                              IconButton(
                                icon: Image.asset(
                                  'assets/images/mic-16-filled.png',
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () {},
                                padding: const EdgeInsets.all(12),
                              ),

                              // Text field
                              Expanded(
                                child: TextField(
                                  controller: viewModel.messageController,
                                  decoration: const InputDecoration(
                                    hintText: 'Ask Aura Analyst',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                  onSubmitted: (text) =>
                                      viewModel.sendMessage(),
                                ),
                              ),

                              // Share icon button
                              IconButton(
                                icon: Image.asset(
                                  'assets/images/share.png',
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () {},
                                padding: const EdgeInsets.all(12),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Send button (now outside the container)
                      const SizedBox(width: 8), // Add some spacing
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.send),
                          color: Colors.blue,
                          onPressed: () => viewModel.sendMessage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: message.isUser
                  ? const Color.fromARGB(255, 48, 169, 255)
                  : const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(message.text, style: const TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 4),
          Text(
            message.time,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
