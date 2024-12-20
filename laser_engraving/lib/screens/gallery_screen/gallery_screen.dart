import 'package:flutter/material.dart';
import '../../widgets/customer_drawer.dart';

class GalleryItem {
  final String imageUrl;
  final String title;
  final String description;

  GalleryItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final List<GalleryItem> galleryItems = [
    GalleryItem(
      imageUrl: 'assets/images/project1.jpg',
      title: 'Custom Wood Engraving',
      description: 'Personalized wooden box with intricate design',
    ),
    GalleryItem(
      imageUrl: 'assets/images/project2.jpg',
      title: 'Metal Marking',
      description: 'Industrial component with serial number and QR code',
    ),
    // Add more gallery items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Gallery'),
      ),
      drawer: const CustomDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: galleryItems.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {
                // Show detailed view
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          galleryItems[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                galleryItems[index].title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                galleryItems[index].description,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      galleryItems[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      galleryItems[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}