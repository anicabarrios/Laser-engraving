import 'package:flutter/material.dart';
import '../../widgets/customer_drawer.dart';

class TeamMember {
  final String name;
  final String role;
  final String imageUrl;
  final String bio;

  TeamMember({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.bio,
  });
}

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'John Smith',
      role: 'Founder & Master Engraver',
      imageUrl: 'assets/images/team1.jpg',
      bio: '15 years of experience in laser engraving technologies.',
    ),
    TeamMember(
      name: 'Jane Doe',
      role: 'Design Director',
      imageUrl: 'assets/images/team2.jpg',
      bio: 'Award-winning designer specializing in custom engravings.',
    ),
    // Add more team members as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Story',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Founded in 2010, Laser Engraving Co. has been at the forefront of precision '
              'laser engraving technology. We combine traditional craftsmanship with '
              'cutting-edge technology to deliver exceptional results for our clients.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Text(
              'Our Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(teamMembers[index].imageUrl),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                teamMembers[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                teamMembers[index].role,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                teamMembers[index].bio,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
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
    );
  }
}