// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// Each TabBarView contains a _Page and for each _Page there is a list
// of _CardData objects. Each _CardData object is displayed by a _CardItem.

class _Page {
  _Page({ this.label, this.index});

  final String label;
  int index = 0;

  String get id => label[0];

  @override
  String toString() => '$runtimeType("$label")';
}

class _CardData {
  const _CardData(
      { this.title, this.imageAsset, this.imageAssetPackage, this.indes });

  final String title;
  final String imageAsset;
  final String imageAssetPackage;
  final int indes;
}
//class _UserCard extends _CardData {
//  const _UserCard({ this.title, this.imageAsset, this.imageAssetPackage ,this.index});
//
//  final String title;
//  final String imageAsset;
//  final String imageAssetPackage;
//  final int index ;
//}
//
//class _PhoneCard extends _CardData {
//  const _PhoneCard({ this.title, this.imageAsset, this.imageAssetPackage ,this.index});
//
//  final String title;
//
//  final String imageAsset;
//  final String imageAssetPackage;
//  final int index ;
//}

final Map<_Page, List<_CardData>> _allPages = <_Page, List<_CardData>>{
  new _Page(label: '账号登录', index: 0): <_CardData>[
    const _CardData(
      title: 'Flatwear',
      imageAsset: 'images/sysp_copy.png',
      imageAssetPackage: 'images/sysp_copy.png',
      indes: 0,
    ),

  ],
  new _Page(label: '手机号登录', index: 1): <_CardData>[
    const _CardData(
      title: 'Cloud-White Dress',
      imageAsset: 'images/sysp_copy.png',
      imageAssetPackage: 'images/sysp_copy.png',
      indes: 1,
    ),

  ],

};

class _CardUserItem extends StatelessWidget {
  const _CardUserItem({ this.page, this.data });

  static const double height = 272.0;
  final _Page page;
  final _CardData data;

  @override
  Widget build(BuildContext context) {
    String title = data.title;
    int index1 = data.indes;

    return data.indes == 0 ? new Card(
      semanticContainer: false,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Text("账号登录")
          ],
        ),
      ),
    ) : new Card(
      semanticContainer: false,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Text("手机登录")
          ],
        ),
      ),
    );
  }
}

class TabsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            child: Container(
              alignment: Alignment.center,
              child: new TabBar(
                indicatorColor: Colors.white10,
                isScrollable: true,
                labelColor: Colors.black,
                tabs: _allPages.keys.map(
                      (_Page page) => new Tab(text: page.label),
                ).toList(),
              ),
            ), preferredSize: Size.fromHeight(30.0),),

          body: new TabBarView(
            children: _allPages.keys.map((_Page page) {
              return new SafeArea(
                top: false,
                bottom: false,
                child: new Builder(
                  builder: (BuildContext context) {
                    return new CustomScrollView(
                      key: new PageStorageKey<_Page>(page),
                      slivers: <Widget>[
                        new SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          sliver: new SliverFixedExtentList(
                            itemExtent: _CardUserItem.height,
                            delegate: new SliverChildBuilderDelegate(
                                  (BuildContext context, int indexs) {
                                print("$indexs+++++++++++++++++++++");
                                final _CardData data = _allPages[page][indexs];
                                return new Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: new _CardUserItem(
                                      page: page,
                                      data: data,

                                    )

                                );
                              },
                              childCount: _allPages[page].length,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
