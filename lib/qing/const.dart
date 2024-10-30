import 'package:flutter/cupertino.dart';

class PinDao {
  final String name;
  final String url;
  final String base64;
  const PinDao(this.name, this.url, this.base64);
}

const joinPindao = "点击或扫描二维码加入QQ频道";
const esoPindao = PinDao(
  "亦搜",
  "https://qun.qq.com/qqweb/qunpro/share?_wv=3&_wwv=128&inviteCode=pQ0gq&from=246610&biz=ka",
  "data:image/png;base64,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",
);
const yueduPindao = PinDao(
  "阅读",
  "https://qun.qq.com/qqweb/qunpro/share?_wv=3&_wwv=128&inviteCode=25d870&from=246610&biz=ka",
  "data:image/png;base64,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",
);

final data = AppData(
  url: TextEditingController(text: "https://www.baidu.com/"),
  method: TextEditingController(text: "get"),
  ua: TextEditingController(
      text:
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.50"),
  encode: TextEditingController(text: "utf-8"),
  cookies: TextEditingController(),
  headers: TextEditingController(),
  body: TextEditingController(),
  html: TextEditingController(),
  string: TextEditingController(text: "https://www.baidu.com/"),
  rule: TextEditingController(text: "body"),
  result: TextEditingController(text: ""),
  cache: TextEditingController(text: "body"),
);

class AppData {
  TextEditingController url;
  TextEditingController method;
  TextEditingController headers;
  TextEditingController ua;
  TextEditingController cookies;
  TextEditingController body;
  TextEditingController encode;
  TextEditingController html;
  TextEditingController string;
  TextEditingController rule;
  TextEditingController cache;
  TextEditingController result;
  AppData({
    required this.url,
    required this.method,
    required this.ua,
    required this.cookies,
    required this.body,
    required this.encode,
    required this.headers,
    required this.html,
    required this.string,
    required this.rule,
    required this.cache,
    required this.result,
  });
}
