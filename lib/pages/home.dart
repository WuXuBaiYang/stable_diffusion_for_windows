import 'package:fluent_ui/fluent_ui.dart';
import 'package:stable_diffusion_for_windows/common/logic.dart';

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
      content: Container(),
    );
  }
}

/*
* 首页-逻辑
* @author wuxubaiyang
* @Time 2023/2/27 10:20
*/
class _HomeLogic extends BaseLogic {}
