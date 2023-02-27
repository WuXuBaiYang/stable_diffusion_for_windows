import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:stable_diffusion_for_windows/utils/date.dart';

/*
* 工具方法
* @author wuxubaiyang
* @Time 2022/9/8 15:09
*/
class Tool {
  // 生成id
  static String genID({int? seed}) {
    final time = DateTime.now().millisecondsSinceEpoch;
    return md5('${time}_${Random(seed ?? time).nextDouble()}');
  }

  // 生成时间戳签名
  static String genDateSign() => DateTime.now().format(DatePattern.dateSign);

  // 计算md5
  static String md5(String value) =>
      crypto.md5.convert(utf8.encode(value)).toString();

  // 获取屏幕宽度
  static double getScreenWith(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // 获取屏幕高度
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // 获取应用名
  static Future<String> get appName async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  // 获取版本号
  static Future<String> get buildNumber async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  // 获取版本名
  static Future<String> get version async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // 加载弹窗dialog缓存
  static Future? _loadingDialog;

  // 展示加载弹窗
  static Future<T?> showLoading<T>(
    BuildContext context, {
    required Future<T?> loadFuture,
  }) async {
    final navigator = Navigator.of(context);
    try {
      if (_loadingDialog != null) navigator.maybePop();
      _loadingDialog = showDialog<void>(
        context: context,
        builder: (_) => const Center(
          child: Card(
            child: CircularProgressIndicator(),
          ),
        ),
      )..whenComplete(() => _loadingDialog = null);
      await Future.delayed(const Duration(milliseconds: 150));
      final result = await loadFuture;
      if (_loadingDialog != null) await navigator.maybePop();
      return result;
    } catch (e) {
      if (_loadingDialog != null) await navigator.maybePop();
      rethrow;
    }
  }
}
