import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_changenotifier/dao/photo_model.dart';
import 'package:test_changenotifier/providers/app_service_provider.dart';
import 'package:test_changenotifier/widgets/cacheable_image.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  void initState() {
    Provider.of<AppServiceProvider>(context, listen: false).getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: RefreshIndicator(
        child: _buildUI(appProvider.data as List<PhotoModel>),
        onRefresh: () async {
          await Provider.of<AppServiceProvider>(context, listen: false)
              .getPhotos();
        },
      ),
    );
  }

  Widget _buildUI(List<PhotoModel> photos) {
    if (photos == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (photos.isEmpty) {
      return Center(
        child: Text("No Photos Here"),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (cxt, index) => _userListItem(photos[index]),
        itemCount: photos.length,
      );
    }
  }

  Widget _userListItem(PhotoModel photo) {
    return InkWell(
        onTap: () => showPhoto(photo.url),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 3,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                child: CacheableImage(
                  photo.url,
                  boxFit: BoxFit.fill,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(photo.title),
              )),
            ],
          ),
        ));
  }

  void showPhoto(String url) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                CacheableImage(
                  url,
                  size: Size(double.infinity, 400),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      child: Icon(
                        Icons.cancel,
                        size: 30,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      onTap: () => Navigator.pop(_),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
