//
// navbar_item.dart
// 
// Navbar Item Widget

// Required Imports
import '../assets/essential.dart';
// Screens
import '../screens/home_screen.dart';
import '../screens/create_set_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';

class NavItem {
  final String title;
  final IconData icon;
  final String route;
  final bool requiresAuth;

  NavItem({
    required this.title,
    required this.icon,
    required this.route,
    this.requiresAuth = true,
  });
}

// Define navigation items
final List<NavItem> navItems = [
  NavItem(
    title: 'Home',
    icon: Icons.home,
    route: '/home',
  ),
  NavItem(
    title: 'Create Set',
    icon: Icons.add,
    route: '/create_set',
  ),
  NavItem(
    title: 'Settings',
    icon: Icons.settings,
    route: '/settings',
  ),
  NavItem(
    title: 'Login',
    icon: Icons.person,
    route: '/login',
    requiresAuth: false,
  ),
  NavItem(
    title: 'View Set',
    icon: Icons.book,
    route: '/view_set',
    requiresAuth: false,
  ),
];