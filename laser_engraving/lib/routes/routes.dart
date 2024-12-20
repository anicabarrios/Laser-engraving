import 'package:flutter/material.dart';
import 'package:laser_engraving/screens/about_screen/about_screen.dart';
import 'package:laser_engraving/screens/contact_screen/contact_screen.dart';
import 'package:laser_engraving/screens/gallery_screen/gallery_screen.dart';

import 'package:laser_engraving/screens/home_screen/home_screen.dart';
import 'package:laser_engraving/screens/services_screen/services_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) =>  HomeScreen(),
  '/services': (context) =>  ServicesScreen(),
  '/gallery': (context) =>  GalleryScreen(),
  '/contact': (context) => const ContactScreen(),
  '/about': (context) =>  AboutScreen(),
};