import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/pages/home.dart';
import 'package:stable_diffusion_for_windows/pages/setting.dart';

/*
* 路由路径
* @author wuxubaiyang
* @Time 2022-07-22 11:35:59
*/
class RoutePath {
  // 项目详情页
  static const String home = '/home';

  // 设置页
  static const String setting = '/setting';

  // 获取路由表
  static Map<String, WidgetBuilder> get routeMap => {
        home: (_) => const HomePage(),
        setting: (_) => const SettingPage(),
      };
}
