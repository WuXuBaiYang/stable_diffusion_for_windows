import 'package:stable_diffusion_for_windows/common/manage.dart';
import 'package:stable_diffusion_for_windows/manage/cache.dart';
import 'package:stable_diffusion_for_windows/model/config.dart';

/*
* 配置文件管理
* @author wuxubaiyang
* @Time 2022/3/17 14:14
*/
class ConfigManage extends BaseManage {
  // 配置文件缓存字段
  final String _configCacheKey = 'config_cache';

  static final ConfigManage _instance = ConfigManage._internal();

  factory ConfigManage() => _instance;

  ConfigManage._internal();

  // 配置文件缓存
  ConfigModel? _config;

  @override
  Future<void> init() async =>
      _config ??= ConfigModel.from(cacheManage.getJson(_configCacheKey));

  // 获取配置
  ConfigModel? get config => _config;

  // 写入配置
  Future<bool> updateConfig(ConfigModel model) =>
      cacheManage.setJsonMap(_configCacheKey, (_config = model).to());
}

// 单例调用
final configManage = ConfigManage();
