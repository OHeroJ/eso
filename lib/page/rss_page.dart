import 'dart:convert';

import 'package:eso/model/rss_page_provider.dart';
import 'package:eso/ui/ui_chapter_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/search_item.dart';
import 'langding_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RSSPage extends StatefulWidget {
  final SearchItem searchItem;

  const RSSPage({
    required this.searchItem,
    super.key,
  });

  @override
  State<RSSPage> createState() => _RSSPageState();
}

class _RSSPageState extends State<RSSPage> {
  Widget? page;
  RSSPageProvider? __provider;

  @override
  Widget build(BuildContext context) {
    if (page == null) {
      page = buildPage();
    }
    return page!;
  }

  @override
  void dispose() {
    __provider?.dispose();
    super.dispose();
  }

  Widget buildPage() {
    return ChangeNotifierProvider<RSSPageProvider>.value(
      value: RSSPageProvider(searchItem: widget.searchItem!),
      child: Consumer<RSSPageProvider>(
        builder: (BuildContext context, RSSPageProvider provider, _) {
          __provider = provider;
          if (provider.content == null) {
            return LandingPage();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.searchItem.durChapter!),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () => provider.showChapter = !provider.showChapter,
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                _RSSContentPage(
                  searchItem: widget.searchItem,
                  content: provider.content,
                ),
                provider.showChapter
                    ? UIChapterSelect(
                        searchItem: widget.searchItem,
                        loadChapter: provider.loadChapter,
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RSSContentPage extends StatefulWidget {
  final SearchItem searchItem;
  final List<String> content;

  _RSSContentPage({
    required this.searchItem,
    required this.content,
    super.key,
  });

  @override
  __RSSContentPageState createState() => __RSSContentPageState();
}

class __RSSContentPageState extends State<_RSSContentPage> {
  WebViewController? _controller;
  Widget? _webView;
  int _durChapterIndex = -1;

  @override
  Widget build(BuildContext context) {
    String content = Uri.dataFromString(
      '<style>img{max-width:100%}</style>${widget.content.join('\n')}',
      mimeType: 'text/html',
      encoding: Encoding.getByName('UTF-8'),
    ).toString();
    if (_controller != null &&
        _durChapterIndex != widget.searchItem.durChapterIndex) {
      _durChapterIndex = widget.searchItem.durChapterIndex!;
      _controller!.loadRequest(Uri.parse(content));
    }
    if (_webView == null) {
      _webView = WebViewWidget(
        controller: _controller!,
      );
      _durChapterIndex = widget.searchItem.durChapterIndex!;
    }
    return _webView!;
  }
}
