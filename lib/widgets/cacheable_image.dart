import 'package:flutter/material.dart';
import 'package:test_changenotifier/dao/image_model.dart';
import 'package:test_changenotifier/mvp/cache_image_mvp.dart';

class CacheableImage extends StatefulWidget {
  final String url;
  final Size size;
  final BoxFit boxFit;

  CacheableImage(this.url,
      {this.size = const Size(80, 80), this.boxFit = BoxFit.contain});

  @override
  _CacheableImageState createState() => _CacheableImageState();
}

class _CacheableImageState extends State<CacheableImage>
    implements CacheImageView {
  ImageModel _imageModel;

  @override
  void initState() {
    CacheImagePresenter(widget.url, this).loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_imageModel == null) {
      return Container(
        width: widget.size.width,
        height: widget.size.height,
        color: Colors.black.withOpacity(0.3),
      );
    } else {
      return Image.memory(
        _imageModel.src,
        fit: widget.boxFit,
        width: widget.size.width,
        height: widget.size.height,
      );
    }
  }

  @override
  void error(String error) {
    // TODO: implement error
  }

  @override
  void loadedImage(ImageModel imageModel) {
    if (this.mounted) {
      setState(() {
        _imageModel = imageModel;
      });
    }
  }
}
