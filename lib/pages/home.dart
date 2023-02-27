import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/common/logic.dart';
import 'package:stable_diffusion_for_windows/common/route_path.dart';
import 'package:stable_diffusion_for_windows/manage/router.dart';

/*
* 首页
* @author wuxubaiyang
* @Time 2023/2/27 10:20
*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

/*
* 首页-状态
* @author wuxubaiyang
* @Time 2023/2/27 10:20
*/
class _HomePageState extends LogicState<HomePage, _HomeLogic> {
  @override
  _HomeLogic initLogic() => _HomeLogic();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(
        commandBar: _buildCommandBar(),
      ),
      content: Container(),
    );
  }

  // 构建动作条
  Widget _buildCommandBar() {
    return Row(
      children: [
        const Spacer(),
        CommandBarCard(
          child: CommandBar(
            overflowBehavior: CommandBarOverflowBehavior.noWrap,
            primaryItems: [
              CommandBarButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.model_app_template32),
                label: const Text('插件管理'),
              ),
              const CommandBarSeparator(),
              CommandBarButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.modeling_view),
                label: const Text('模型管理'),
              ),
              const CommandBarSeparator(),
              CommandBarButton(
                onPressed: () => routerManage.pushNamed(RoutePath.setting),
                icon: const Icon(FluentIcons.settings),
                label: const Text('设置'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
* 首页-逻辑
* @author wuxubaiyang
* @Time 2023/2/27 10:20
*/
class _HomeLogic extends BaseLogic {}
