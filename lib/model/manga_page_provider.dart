import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eso/api/api.dart';
import 'package:eso/api/api_manager.dart';
import 'package:eso/database/search_item_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart' as intl;
import 'package:screen/screen.dart';
import '../database/search_item.dart';
import 'package:flutter/material.dart';

class MangaPageProvider with ChangeNotifier {
  final _format = intl.DateFormat('HH:mm:ss');
  Timer _timer;
  final SearchItem searchItem;
  List<String> _content;
  List<String> get content => _content;
  ScrollController _controller;
  ScrollController get controller => _controller;
  bool _isLoading;
  bool get isLoading => _isLoading;
  Map<String, String> _headers;
  Map<String, String> get headers => _headers;
  String _bottomTime;
  String get bottomTime => _bottomTime;
  bool _showChapter;
  bool get showChapter => _showChapter;

  set showChapter(bool value) {
    if (_showChapter != value) {
      _showChapter = value;
      notifyListeners();
    }
  }

  bool _showMenu;
  bool get showMenu => _showMenu;
  set showMenu(bool value) {
    if (_showMenu != value) {
      _showMenu = value;
      notifyListeners();
    }
  }

  bool _showSetting;
  bool get showSetting => _showSetting;
  set showSetting(bool value) {
    if (_showSetting != value) {
      _showSetting = value;
      notifyListeners();
    }
  }

  double _sysBrightness;
  double _brightness;
  double get brightness => _brightness;
  set brightness(double value) {
    if ((value - _brightness).abs() > 0.05) {
      _brightness = value;
      Screen.setBrightness(brightness);
    }
  }

  bool _keepOn;
  bool get keepOn => _keepOn;
  set keepOn(bool value) {
    if (value != _keepOn) {
      _keepOn = value;
      Screen.keepOn(_keepOn);
      notifyListeners();
    }
  }

  bool _landscape;
  bool get landscape => _landscape;
  set landscape(bool value) {
    if (value != _landscape) {
      _landscape = value;
      if (_landscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    }
  }

  MangaPageProvider({this.searchItem}) {
    _brightness = 0.5;
    _keepOn = false;
    _landscape = false;
    _bottomTime = _format.format(DateTime.now());
    _isLoading = false;
    _showChapter = false;
    _showMenu = false;
    _showSetting = false;
    _headers = Map<String, String>();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        loadChapter(searchItem.durChapterIndex + 1);
      }
    });
    if (searchItem.chapters?.length == 0 &&
        SearchItemManager.isFavorite(searchItem.url)) {
      searchItem.chapters = SearchItemManager.getChapter(searchItem.id);
    }
    _initContent();
  }

  void refreshProgress() {
    searchItem.durContentIndex = _controller.position.pixels.floor();
    notifyListeners();
  }

  void _setHeaders() {
    final first = _content[0].split('@headers');
    if (first.length > 1) {
      _content[0] = first[0];
      _headers = (jsonDecode(first[1]) as Map).map((k, v) => MapEntry('$k', '$v'));
    }
  }

  void _initContent() async {
    _brightness = await Screen.brightness;
    if (_brightness > 1) {
      _brightness = 0.5;
    }
    _sysBrightness = _brightness;
    _keepOn = await Screen.isKeptOn;
    _content = await APIManager.getContent(
        searchItem.originTag, searchItem.chapters[searchItem.durChapterIndex].url);
    _setHeaders();
    notifyListeners();
  }

  void share() async {
    await FlutterShare.share(
      title: '亦搜 eso',
      text:
          '${searchItem.name.trim()}\n${searchItem.author.trim()}\n\n${searchItem.description.trim()}\n\n${searchItem.url}',
      //linkUrl: '${searchItem.url}',
      chooserTitle: '选择分享的应用',
    );
  }

  Future<void> loadChapter(int chapterIndex) async {
    _showChapter = false;
    if (isLoading ||
        chapterIndex == searchItem.durChapterIndex ||
        chapterIndex < 0 ||
        chapterIndex >= searchItem.chapters.length) return;
    _isLoading = true;
    searchItem.durChapterIndex = chapterIndex;
    notifyListeners();
    _content = await APIManager.getContent(
        searchItem.originTag, searchItem.chapters[chapterIndex].url);
    _setHeaders();
    searchItem.durChapter = searchItem.chapters[chapterIndex].name;
    searchItem.durContentIndex = 1;
    await SearchItemManager.saveSearchItem();
    _isLoading = false;
    if (searchItem.ruleContentType != API.RSS) {
      _controller.jumpTo(1);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    if (Platform.isAndroid) {
      Screen.setBrightness(-1.0);
    } else {
      Screen.setBrightness(_sysBrightness);
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _timer?.cancel();
    content.clear();
    _controller.dispose();
    SearchItemManager.saveSearchItem();
    super.dispose();
  }
}
