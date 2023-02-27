import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/common/route_path.dart';
import 'package:stable_diffusion_for_windows/manage/cache.dart';
import 'package:stable_diffusion_for_windows/manage/event.dart';
import 'package:stable_diffusion_for_windows/manage/router.dart';
import 'package:stable_diffusion_for_windows/manage/theme.dart';
import 'package:stable_diffusion_for_windows/pages/home.dart';
import 'package:stable_diffusion_for_windows/widgets/theme_stream_view.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化窗口设置
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.normal,
    size: Size(800, 600),
    skipTaskbar: false,
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  // 初始化业务
  cacheManage.init();
  eventManage.init();
  routerManage.init();
  themeManage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeStreamView(
      builder: (_, snap) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: routerManage.navigateKey,
          routes: RoutePath.routeMap,
          theme: snap.data?.data,
          home: const HomePage(),
        );
      },
    );
  }
}
