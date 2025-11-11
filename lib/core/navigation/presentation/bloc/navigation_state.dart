part of 'navigation_bloc.dart';

/// State for bottom navigation.
class NavigationState {
  final int selectedIndex;

  const NavigationState({
    this.selectedIndex = 0,
  });

  NavigationState copyWith({
    int? selectedIndex,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
