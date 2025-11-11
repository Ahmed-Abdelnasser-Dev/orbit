import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../dependency_injection/di_container.dart';
import '../../presentation/bloc/navigation_bloc.dart';
import '../../presentation/widgets/bottom_nav_bar.dart';
import '../../../../features/home/presentation/screens/dashboard_screen.dart';
import '../../../../features/work/presentation/screens/work_screen.dart';
import '../../../../features/health/presentation/screens/health_screen.dart';
import '../../../../features/mental/presentation/screens/mental_screen.dart';
import '../../../../features/hobbies/presentation/screens/hobbies_screen.dart';

/// Shell widget that wraps all main app screens with bottom navigation.
///
/// This widget provides:
/// - Bottom navigation bar
/// - State management for navigation
/// - Screen switching without rebuilding the entire tree
class NavigationShell extends StatelessWidget {
  const NavigationShell({super.key});

  /// List of screens corresponding to each navigation tab.
  static const List<Widget> _screens = [
    DashboardScreen(),
    WorkScreen(),
    HealthScreen(),
    MentalScreen(),
    HobbiesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<NavigationBloc>(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.selectedIndex,
              children: _screens,
            ),
            bottomNavigationBar: BottomNavBar(
              onTabChanged: (index) {
                context.read<NavigationBloc>().add(ChangeTabEvent(index));
              },
            ),
          );
        },
      ),
    );
  }
}
