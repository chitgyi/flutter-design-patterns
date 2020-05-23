import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_changenotifier/dao/post_modal.dart';
import 'package:test_changenotifier/providers/app_service_provider.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    Provider.of<AppServiceProvider>(context, listen: false).getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: RefreshIndicator(
        child: _buildUI(appProvider.data as List<PostModel>),
        onRefresh: () async {
          await Provider.of<AppServiceProvider>(context, listen: false)
              .getPosts();
        },
      ),
    );
  }

  Widget _buildUI(List<PostModel> posts) {
    if (posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (posts.isEmpty) {
      return Center(
        child: Text("No Posts Here"),
      );
    } else {
      return ListView.separated(
        itemBuilder: (cxt, index) => _userListItem(posts[index]),
        itemCount: posts.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1.5,
        ),
      );
    }
  }

  Widget _userListItem(PostModel post) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.body),
    );
  }
}
