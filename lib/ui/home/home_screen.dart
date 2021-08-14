import 'package:flutter/material.dart';
import 'package:multi_purpose_app/data/models/post.dart';
import 'package:multi_purpose_app/ui/common/page_header.dart';
import 'package:multi_purpose_app/ui/home/post_item.dart';
import 'package:multi_purpose_app/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: Strings.instance.posts,
          description: Strings.instance.loremIpsum,
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) => PostItem(
              post: Post(
                title: 'Enhanced Clean',
                subTitle:
                    'This host committed to Airbnb\'s 5-step enhanced cleaning process. Show More',
                id: 'id',
              ),
            ),
          ),
        )
      ],
    );
  }
}
