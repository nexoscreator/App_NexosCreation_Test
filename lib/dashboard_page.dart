import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'webview_page.dart';

class DashboardPage extends StatelessWidget {
  final String imageUrl =
      'https://via.placeholder.com/1280x768.png?text=Background+Image';
  final String title = 'Nexos Creation';
  final String description = 'Welcome to Nexos Creation!';

  final List<Map<String, String>> socialLinks = [
    {'icon': 'assets/youtube.png', 'url': 'https://youtube.com/@nexoscreator'},
    {'icon': 'assets/discord.png', 'url': 'https://discord.com/invite/ejfxG2Qpjk'},
    {'icon': 'assets/twitter.png', 'url': 'https://twitter.com/nexoscreator'},
    {'icon': 'assets/github.png', 'url': 'https://github.com/nexoscreator'},
  ];

  final List<Map<String, dynamic>> cardItems = [
    {
      'icon': Icons.person_outline,
      'title': 'Nexos Creator',
      'description': 'Description for Nexos Creator',
      'url': 'https://www.nexoscreator.pro'
    },
    {
      'icon': Icons.create,
      'title': 'Nexos Creation',
      'description': 'Description for Nexos Creation',
      'url': 'https://www.nexoscreation.com'
    },
    {
      'icon': Icons.settings,
      'title': 'Nexos Crafter',
      'description': 'Description for Nexos Crafter',
      'url': 'https://craft.nexoscreation.com'
    },
    {
      'icon': Icons.file_copy,
      'title': 'Docs',
      'description': 'Documentation for Nexos',
      'url': 'https://docs.nexoscreator.pro'
    },
    {
      'icon': Icons.build,
      'title': 'Projects',
      'description': 'Projects for Nexos',
      'url': 'https://projects.nexoscreator.pro'
    },
    {
      'icon': Icons.construction,
      'title': 'Tools',
      'description': 'Tools for Nexos',
      'url': 'https://tools.nexoscreation.com'
    },
    {
      'icon': Icons.more,
      'title': 'More',
      'description': 'More about Nexos',
      'url': 'https://status.nexoscreation.com'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: socialLinks
                      .map((link) => IconButton(
                            icon: SizedBox(
                              width: 30, // Set the width here
                              height: 30, // Set the height here
                              child: Image.asset(link['icon']!), 
                            ),
                            onPressed: () => _launchURL(link['url']!),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 25),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 9 / 3,
                  ),
                  itemCount: cardItems.length,
                  itemBuilder: (context, index) {
                    final item = cardItems[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: item['url']!),
                        ),
                      ),
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item['icon'] as IconData),
                              const SizedBox(height: 10),
                              Text(item['title']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(item['description']!,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
