//  This is the custom implementation of [ImageCache] where we override the logic.
// Use this is you are using https://cataas.com/cat API for load image
import 'package:flutter/material.dart';

class MyImageCache extends ImageCache {
  @override
  void clear() {
    super.clear();
  }
}

class MyWidgetsBinding extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() => MyImageCache();
}
