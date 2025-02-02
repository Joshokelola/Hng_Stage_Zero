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
      ),
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
      path: 'hire-flutter-developers',
    );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('HNG Stage 0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _launchURL('YOUR_GITHUB_REPO_URL'),
              child: const Text('View GitHub Repository'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL(hireFlutterUrl),
              child: const Text('HNG Flutter Developers'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://telex.hng.tech'),
              child: const Text('Telex'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://delve.hng.tech'),
              child: const Text('Delve'),
            ),
          ],
        ),
      ),
    );
  }
}
