import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/model/event/event.dart';

/*
* 全局样式控制事件
* @author wuxubaiyang
* @Time 2022/4/1 15:14
*/
class ThemeEvent extends EventModel {
  // 全局样式
  final FluentThemeData data;

  ThemeEvent({required this.data});
}
