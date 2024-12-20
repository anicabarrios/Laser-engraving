import 'package:flutter/material.dart';
import '../../../widgets/customer_drawer.dart';

class Service {
  final String name;
  final String description;
  final String price;
  final IconData icon;

  Service({
    required this.name, 
    required this.description, 
    required this.price, 
    required this.icon
  });
}

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  final List<Service> services = [
    Service(
      name: 'Custom Product Engraving',
      description: 'Personalize your products with custom designs, logos, or text.',
      price: 'Starting at \$50',
      icon: Icons.design_services,
    ),
    Service(
      name: 'Industrial Marking',
      description: 'Precise marking solutions for industrial components and tools.',
      price: 'Starting at \$100',
      icon: Icons.precision_manufacturing,
    ),
    Service(
      name: 'Gift Personalization',
      description: 'Make your gifts unique with custom engravings.',
      price: 'Starting at \$30',
      icon: Icons.card_giftcard,
    ),
    Service(
      name: 'Bulk Orders',
      description: 'Special rates for large quantity orders.',
      price: 'Contact for quote',
      icon: Icons.inventory,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(services[index].icon, size: 32, color: Colors.blue),
                      const SizedBox(width: 16),
                      Text(
                        services[index].name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    services[index].description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    services[index].price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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