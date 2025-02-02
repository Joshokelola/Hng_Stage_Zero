import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG Stage 0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    var hireFlutterUrl = Uri(
      scheme: 'https',
      host: 'hng.tech',
      path: '/hire/flutter-developers',
    );
    var githubRepoUrl = Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'Joshokelola/Hng_Stage_Zero',
    );
    var telexUrl = Uri(
      scheme: 'https',
      host: 'telex.im',
    );
    var delveUrl = Uri(
      scheme: 'https',
      host: 'delve.fun',
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text(
          'Link Explorer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Links',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                _buildButton(
                  'View GitHub Repository',
                  () => _launchURL(githubRepoUrl),
                  const Color(0xFF2196F3),
                ),
                const SizedBox(height: 16),
                _buildButton(
                  'Hire Flutter Developers',
                  () => _launchURL(hireFlutterUrl),
                  const Color(0xFF4CAF50),
                ),
                const SizedBox(height: 16),
                _buildButton(
                  'Telex',
                  () => _launchURL(telexUrl),
                  const Color(0xFFFF9800),
                ),
                const SizedBox(height: 16),
                _buildButton(
                  'Delve',
                  () => _launchURL(delveUrl),
                  const Color(0xFF9C27B0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, Color color) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.link,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
