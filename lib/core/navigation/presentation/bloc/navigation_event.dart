part of 'navigation_bloc.dart';

/// Base class for all navigation events.
sealed class NavigationEvent {
  const NavigationEvent();
}

/// Event to change the selected tab.
class ChangeTabEvent extends NavigationEvent {
  final int tabIndex;

  const ChangeTabEvent(this.tabIndex);
}
