
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubePage extends StatelessWidget {
  const YouTubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                'https://via.placeholder.com/1280x768', // Replace with your image URL
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nexos Creator',
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Welcome to Nexos Creation! 🚀',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Channel logo
                                radius: 20,
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Channel Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '1.23M subscribers',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Subscribe'),
                            // style: ElevatedButton.styleFrom(
                              // primary: Colors.red,
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                VideoCard(
                  thumbnailUrl: 'https://via.placeholder.com/320x180', // Replace with video thumbnail
                  title: 'Video Title 1',
                  url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Replace with video URL
                ),
                VideoCard(
                  thumbnailUrl: 'https://via.placeholder.com/320x180',
                  title: 'Video Title 2',
                  url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                ),
                VideoCard(
                  thumbnailUrl: 'https://via.placeholder.com/320x180',
                  title: 'Video Title 3',
                  url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String url;

  const VideoCard({super.key, 
    required this.thumbnailUrl,
    required this.title,
    required this.url,
  });

  void _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(context, url),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(thumbnailUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
