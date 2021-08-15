import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/providers/album_notifier.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/ui/common/page_header.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:provider/provider.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: Strings.instance.albums,
          description: Strings.instance.loremIpsum,
        ),
        Consumer<AlbumNotifier>(
          builder: (context, value, child) {
            return isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.albums.length,
                      itemBuilder: (context, index) {
                        var album = value.albums[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(6.r),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.albumDetail,
                              arguments: album,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 16.w),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: AppColors.black25,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    album.title,
                                    style: Styles.instance.text24White,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                SvgPicture.asset(Images.instance.forward),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }

  Future<void> getAlbums() async {
    setState(() {
      isLoading = true;
    });
    var message = await context.read<AlbumNotifier>().getAlbums();
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
