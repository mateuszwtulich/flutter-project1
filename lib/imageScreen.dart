import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key key,
    @required this.assetIndex,
    @required this.assets,
  }) : super(key: key);

  final int assetIndex;
  final List<AssetEntity> assets;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Swiper(
          itemCount: assets.length,
          loop: false,
          pagination: new SwiperPagination(),
          index: assetIndex,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: FutureBuilder<File>(
                future: assets[index].file,
                builder: (_, snapshot) {
                  final file = snapshot.data;
                  if (file == null) return Container();
                  return Image.file(file);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}