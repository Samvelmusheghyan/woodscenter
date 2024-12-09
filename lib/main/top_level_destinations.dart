import 'package:flutter/material.dart';

enum TopLevelDestinations {
  home(label: "home", icon: Icons.home),
  book(label: "book", icon: Icons.book),
  residents(label: "residents", icon: Icons.people),
  contacts(label: "contacts", icon: Icons.contacts);

  final String label;
  final IconData icon;

  const TopLevelDestinations({required this.label, required this.icon});
}
