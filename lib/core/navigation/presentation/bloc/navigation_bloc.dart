import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

/// BLoC managing bottom navigation state.
///
/// Handles tab selection and maintains the current selected index.
/// Follows Single Responsibility Principle by only managing navigation state.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  /// Handle tab change event.
  void _onChangeTab(
    ChangeTabEvent event,
    Emitter<NavigationState> emit,
  ) {
    // Only emit new state if index actually changed
    if (event.tabIndex != state.selectedIndex) {
      emit(state.copyWith(selectedIndex: event.tabIndex));
    }
  }
}
