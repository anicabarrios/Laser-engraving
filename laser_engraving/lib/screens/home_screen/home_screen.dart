import 'package:flutter/material.dart';
import '../../widgets/customer_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Industrial Tech Color Scheme
  final Color primaryColor = const Color(0xFF1A1F25);    // Deep charcoal
  final Color accentColor = const Color(0xFFE63946);     // Laser red
  final Color secondaryColor = const Color(0xFF303841);  // Industrial gray
  final Color lightColor = const Color(0xFFF5F5F5);      // Off-white
  final Color techBlue = const Color(0xFF00A8E8);        // Technical blue
  final Color darkTextColor = const Color(0xFF1A1F25);   // Dark text
  final Color lightTextColor = const Color(0xFFF5F5F5);  // Light text

  final List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/slide1.jpg',
      'title': 'Precision Laser Engraving',
      'subtitle': 'State-of-the-art technology for perfect results',
    },
    {
      'image': 'assets/images/slide2.jpg',
      'title': 'Custom Designs',
      'subtitle': 'Bring your ideas to life',
    },
    {
      'image': 'assets/images/slide3.jpg',
      'title': 'Industrial Solutions',
      'subtitle': 'Professional marking and engraving',
    },
  ];

  // Updated features with technical details
  final List<Map<String, dynamic>> features = [
    {
      'icon': Icons.precision_manufacturing,
      'title': 'Advanced Technology',
      'description': 'State-of-the-art fiber laser systems capable of marking metals, plastics, and composites with precision up to 0.02mm',
    },
    {
      'icon': Icons.architecture,
      'title': 'Multi-Material Expertise',
      'description': 'Specialized equipment for wood, metal, glass, leather, and plastic engraving with optimal settings for each material',
    },
    {
      'icon': Icons.assessment,
      'title': 'Quality Control',
      'description': 'Advanced optical verification systems ensuring perfect reproduction and consistent quality across bulk orders',
    },
    {
      'icon': Icons.diversity_3,
      'title': 'Industry Solutions',
      'description': 'Tailored services for aerospace, medical, automotive, and jewelry industries with certified processes',
    },
    {
      'icon': Icons.interests,
      'title': 'Custom Projects',
      'description': 'Full-service design team helping transform your ideas into reality with 3D visualization before production',
    },
    {
      'icon': Icons.verified,
      'title': 'Certified Process',
      'description': 'ISO 9001:2015 certified facility with documented quality management system for consistent results',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Laser Engraving Co.',
          style: TextStyle(
            color: lightTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: lightTextColor),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section with Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: isSmallScreen ? 400 : 600,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.easeInOutCubic,
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                viewportFraction: 1.0,
              ),
              items: carouselItems.map((item) {
                return Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item['image']!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        primaryColor.withOpacity(0.3),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor.withOpacity(0.8),
                          primaryColor.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['title']!,
                              style: TextStyle(
                                color: lightTextColor,
                                fontSize: isSmallScreen ? 32 : 48,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: accentColor, width: 3),
                                ),
                              ),
                              child: Text(
                                item['subtitle']!,
                                style: TextStyle(
                                  color: lightTextColor.withOpacity(0.9),
                                  fontSize: isSmallScreen ? 18 : 24,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            // Features Grid with updated layout
            Container(
              padding: EdgeInsets.all(isSmallScreen ? 24 : 40),
              color: primaryColor,
              child: Column(
                children: [
                  Text(
                    'Our Capabilities',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: lightTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen ? 1 : 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isSmallScreen ? 1.5 : 1.1,
                    ),
                    itemCount: features.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: techBlue.withOpacity(0.3)),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: techBlue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  features[index]['icon'],
                                  size: 40,
                                  color: techBlue,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                features[index]['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: lightTextColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                features[index]['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: lightTextColor.withOpacity(0.7),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Call to Action
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isSmallScreen ? 60 : 80,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    primaryColor,
                    secondaryColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Ready to Start Your Project?',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: lightTextColor,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Contact us today for a free consultation',
                    style: TextStyle(
                      fontSize: 20,
                      color: lightTextColor.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      foregroundColor: lightTextColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Get Free Quote',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}