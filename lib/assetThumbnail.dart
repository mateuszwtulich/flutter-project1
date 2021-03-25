import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'imageScreen.dart';

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.assetIndex,
    @required this.assets,
  }) : super(key: key);

  final int assetIndex;
  final List<AssetEntity> assets;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: assets[assetIndex].thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return CircularProgressIndicator();
        return InkWell(
          onTap: () {
            if (assets[assetIndex].type == AssetType.image) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ImageScreen(assetIndex: assetIndex, assets: assets),
                ),
              );
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
            ],
          ),
        );
      },
    );
  }
}