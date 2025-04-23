//
// navbar_item.dart
// 
// Navbar Item Widget

// Required Imports
import '../assets/essential.dart';
// Screens
import '../screens/home_screen.dart';
import '../screens/create_course_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';

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
    title: 'View Set',
    icon: Icons.book,
    route: '/view_set',
    requiresAuth: false,
  ),
  NavItem(
    title: 'Create Card',
    icon: Icons.camera,
    route: '/camera',
    requiresAuth: false,
  ),
  NavItem(
    title: 'Settings',
    icon: Icons.settings,
    route: '/settings',
  ),
];

// Nav Item Class
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

  static List<Widget> getNavbarElements(BuildContext context, dynamic user) {
    return navItems.map((navItem) {
      // Remove unnecessary items if user logged out
      if (navItem.requiresAuth && user == null) {
        return const SizedBox.shrink();
      }
      // Each navbar item object
      return ListTile(
        leading: Icon(navItem.icon),
        title: Text(navItem.title),
        onTap: () {
          Navigator.pushNamed(context, navItem.route);
        },
      );
    }).toList();
  }
}
