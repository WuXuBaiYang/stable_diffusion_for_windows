import 'package:flutter/material.dart';
import 'package:stable_diffusion_for_windows/manage/event.dart';
import 'package:stable_diffusion_for_windows/manage/theme.dart';
import 'package:stable_diffusion_for_windows/model/event/theme.dart';

/*
* 样式变化监听组件
* @author wuxubaiyang
* @Time 2023/2/14 16:29
*/
class ThemeStreamView extends StatelessWidget {
  final AsyncWidgetBuilder<ThemeEvent> builder;

  const ThemeStreamView({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeEvent>(
      initialData: ThemeEvent(data: themeManage.currentTheme),
      stream: eventManage.on<ThemeEvent>(),
      builder: builder,
    );
  }
}
