part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeModeSwitched extends ThemeEvent {
  final ThemeMode themeMode;
  const ThemeModeSwitched({required this.themeMode});
  @override
  List<Object?> get props => [themeMode];
}
