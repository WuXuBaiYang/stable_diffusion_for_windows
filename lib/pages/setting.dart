import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/common/logic.dart';
import 'package:stable_diffusion_for_windows/manage/router.dart';

/*
* 设置面
* @author wuxubaiyang
* @Time 2023/2/27 16:09
*/
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

/*
* 设置面-状态
* @author wuxubaiyang
* @Time 2023/2/27 16:09
*/
class _SettingPageState extends LogicState<SettingPage, _SettingLogic> {
  @override
  _SettingLogic initLogic() => _SettingLogic();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(
        leading: IconButton(
          icon: const Icon(FluentIcons.back),
          onPressed: () => routerManage.pop(),
        ),
      ),
      content: Container(),
    );
  }
}

/*
* 设置面-逻辑
* @author wuxubaiyang
* @Time 2023/2/27 16:09
*/
class _SettingLogic extends BaseLogic {}
