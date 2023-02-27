import 'package:stable_diffusion_for_windows/common/model.dart';

/*
* 配置信息model
* @author wuxubaiyang
* @Time 2023/2/27 10:34
*/
class ConfigModel extends BaseModel {
  // 是否启用xFormers
  final bool xFormers;

  // 是否启用反向代理
  final bool ngrok;

  // 是否跳过依赖检查
  final bool skipInstall;

  // 是否跳过torch-cuda测试
  final bool skipTorchCudaTest;

  // 是否跳过python版本检查
  final bool skipPythonVersionCheck;

  ConfigModel.from(obj)
      : xFormers = true,
        ngrok = false,
        skipInstall = false,
        skipTorchCudaTest = false,
        skipPythonVersionCheck = true;

  @override
  Map<String, dynamic> to() => {
        'xFormers': xFormers,
        'ngrok': ngrok,
        'skipInstall': skipInstall,
        'skipTorchCudaTest': skipTorchCudaTest,
        'skipPythonVersionCheck': skipPythonVersionCheck,
      };

  // 获取启动参数
  String get startupParameters => [
        if (xFormers) '--xformers',
        if (ngrok) '--ngrok',
        if (skipInstall) '--skip-install',
        if (skipTorchCudaTest) '--skip-torch-cuda-test',
        if (skipPythonVersionCheck) '--skip-python-version-check',
      ].join(' ');
}
