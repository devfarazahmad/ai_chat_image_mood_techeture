import 'package:aiiamge/chat/chat_screen.dart';
import 'package:aiiamge/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_home_screen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 24),
                    _buildQuoteSection(),
                    const SizedBox(height: 12),
                    _buildFeatureGrid(context),
                    const SizedBox(height: 4),
                    _buildRecentChatsSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 37,
          height: 37,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/Vector.png',
              width: 20,
              height: 20,
            ),
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/profile_pic.png'),
        ),
      ],
    );
  }

  Widget _buildQuoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Hi Aqsa',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/images/stabilization.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'A Calm Mind Makes Your',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const Text(
          'Aura Glow Brighter.',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.8, // Increased aspect ratio for larger cards
      mainAxisSpacing: 0.01,
      crossAxisSpacing: 4,
      children: [
        _buildFeatureCard(
          title: 'Capture Aura',
          subtitle: 'tag line text here',
          imagePath: 'assets/images/camera.png',
          backgroundImagePath: 'assets/images/home_fc.png',
        ),
        _buildFeatureCard(
          title: 'Upload Image',
          subtitle: 'tag line text here',
          imagePath: 'assets/images/basil_image-solid.png',
          backgroundImagePath: 'assets/images/home_fc.png',
        ),
        _buildFeatureCard(
          title: 'Psychic Advisor',
          subtitle: 'tag line text here',
          imagePath: 'assets/images/Group.png',
          backgroundImagePath: 'assets/images/home_fc.png',
        ),
        _buildFeatureCard(
          title: 'My Last Readings',
          subtitle: 'tag line text here',
          imagePath: 'assets/images/user-reading-filled.png',
          backgroundImagePath: 'assets/images/home_fc.png',
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required String imagePath,
    required String backgroundImagePath,
  }) {
    return Container(
      height: 180, // Fixed height for larger cards
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Increased padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 48, // Increased icon size
              height: 48,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 48, color: Colors.purple),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16, // Slightly larger font
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentChatsSection() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Recent Chats',
                  style: TextStyle(
                    fontSize: 20, // Slightly larger font
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/guidance_left-arrow.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...viewModel.recentChats.map(
              (chat) => Container(
                width: double.infinity,
                height: 90, // Increased height for chat cards
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/chat_Card.png'),
                    fit: BoxFit.cover,
                    
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                // padding: const EdgeInsets.all(20), // Increased padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        chat['question'] ?? "No Question",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${chat['date'] ?? ""},',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              chat['time'] ?? "",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}