import 'package:test_changenotifier/dao/image_model.dart';
import 'package:http/http.dart' show get;
import 'package:test_changenotifier/utils/hive_helper.dart';

abstract class CacheImageView {
  void loadedImage(ImageModel imageModel);
  void error(String error);
}

class CacheImagePresenter {
  final CacheImageView cacheImageView;
  final String imgUrl;
  final HiveHelper _helper = HiveHelper();

  CacheImagePresenter(this.imgUrl, this.cacheImageView);

  loadImage() {
    var img = _helper.getImageByName(imgUrl);
    if (img == null) {
      get(imgUrl).then(((res) {
        if (res.statusCode == 200) {
          img = ImageModel(src: res.bodyBytes, url: imgUrl);
          _helper.addImage(img);
          cacheImageView.loadedImage(img);
        } else {
          cacheImageView.error("Failed to fetch image [${res.statusCode}]");
        }
      }));
    } else {
      cacheImageView.loadedImage(img);
    }
  }
}
