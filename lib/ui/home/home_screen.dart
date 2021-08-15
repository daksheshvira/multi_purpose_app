import 'package:flutter/material.dart';
import 'package:multi_purpose_app/providers/home_provider.dart';
import 'package:multi_purpose_app/ui/common/page_header.dart';
import 'package:multi_purpose_app/ui/home/post_item.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getPosts();
    });
  }

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
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              return isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.posts.length,
                      itemBuilder: (context, index) => PostItem(
                        post: value.posts[index],
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  Future<void> getPosts() async {
    setState(() {
      isLoading = true;
    });
    var message = await context.read<HomeProvider>().getPosts();
    setState(() {
      isLoading = false;
    });
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Styles.instance.text14White,
          ),
          backgroundColor: AppColors.black65,
        ),
      );
    }
  }
}
