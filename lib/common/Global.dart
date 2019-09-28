import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/models/profile.dart';
import 'package:github_client_flutter/models/cacheConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'net_cache.dart';
import 'network_util.dart';


//提供五种可选择的主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  //网络缓存对象
  static NetCache netCache = NetCache();

  //可选择主题列表
  static List<MaterialColor> get themes => _themes;

  //是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在app启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    // 如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络
    Git.init();

  }
  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));

}

//多语言（英语歌中文）
//Locale资源类
class GmLocalizations {
  GmLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;
  //为了使用方便，我们定义一个静态方法
  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }
  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Github客户端" : "Github Client";
  }
  //Locale相关值，登录
  String get login {
    return isZh ? "登录" : "Login";
  }
  //Locale相关值，退出登录
  String get loginOut {
    return isZh ? "退出登录" : "Login Out";
  }
  //退出登录弹窗提示
  String get logoutTip {
      return isZh ? "是否退出当前账号？" : "Do you want to quit your current account?";
  }
  //取消
  String get cancel {
    return isZh ? "取消" : "cancel";
  }
  //确定
  String get sure {
    return isZh ? "确定" : "sure";
  }
  //主题
  String get theme {
    return isZh ? "主题" : "theme";
  }
  //语言
  String get language {
    return isZh ? "语言" : "Language";
  }
  //描述
  String get noDescription {
    return isZh ? "暂无描述" : "No description";
  }
  //跟随系统
  String get auto {
    return isZh ? "跟随系统" : "Auto";
  }

  //用户名
  String get userName {
    return isZh ? "用户名" : "userName";
  }

  //密码
  String get password {
    return isZh ? "密码" : "Password";
  }

  //密码不能为空
  String get userNameRequired {
    return isZh ? "密码不能为空！" : "password can not be blank!";
  }

  //用户名或邮箱
  String get userNameOrEmail {
    return isZh ? "用户名或邮箱" : "username or email address";
  }

  //密码不能为空
  String get passwordRequired {
    return isZh ? "密码不能为空!" : "password can not be blank!";
  }

  //账号或密码错误
  String get userNameOrPasswordWrong {
    return isZh ? "账号或密码错误" : "Incorrect username or password";
  }
  //Locale相关值，登录后可查看相关内容
  String get noLogin {
    return isZh ? "登录后可查看相关内容" : "Sign in to view related content";
  }
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    return SynchronousFuture<GmLocalizations>(
        GmLocalizations(locale.languageCode == "zh")
    );
  }

  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}