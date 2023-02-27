import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/common/manage.dart';
import 'package:stable_diffusion_for_windows/manage/cache.dart';
import 'package:stable_diffusion_for_windows/manage/event.dart';
import 'package:stable_diffusion_for_windows/model/event/theme.dart';

/*
* 样式管理
* @author wuxubaiyang
* @Time 2022/10/14 10:09
*/
class ThemeManage extends BaseManage {
  // 默认样式缓存字段
  final String _themeCacheKey = 'theme_cache';

  // 默认色调
  final _defBrightness = Brightness.light;

  static final ThemeManage _instance = ThemeManage._internal();

  factory ThemeManage() => _instance;

  ThemeManage._internal();

  // 获取主色
  AccentColor get accentColor => currentTheme.accentColor;

  // 判断当前是否为暗色调
  bool get isDarkMode => currentTheme.brightness == Brightness.dark;

  // 切换默认样式
  Future<void> switchTheme(Brightness brightness) async {
    if (await cacheManage.setInt(_themeCacheKey, brightness.index)) {
      _currentTheme = getThemeByBrightness(brightness);
      eventManage.send(ThemeEvent(data: _currentTheme!));
    }
  }

  // 明暗样式开关
  Future<void> toggleTheme() =>
      switchTheme(currentTheme.brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light);

  // 缓存当前样式
  FluentThemeData? _currentTheme;

  // 当前样式
  FluentThemeData get currentTheme =>
      _currentTheme ??= getThemeByBrightness(Brightness
          .values[cacheManage.getInt(_themeCacheKey) ?? _defBrightness.index]);

  // 根据色调获取对应的样式
  FluentThemeData getThemeByBrightness(Brightness brightness) {
    final darkMode = brightness == Brightness.dark;
    return FluentThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: darkMode ? Colors.black : Colors.white,
    );
  }
}

// 获取当前主色调
AccentColor get kAccentColor => themeManage.accentColor;

// 判断当前是否为暗色模式
bool get kDarkMode => themeManage.isDarkMode;

// 单例调用
final themeManage = ThemeManage();
