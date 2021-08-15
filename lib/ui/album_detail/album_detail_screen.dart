import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/data/models/album.dart';
import 'package:multi_purpose_app/data/models/photo.dart';
import 'package:multi_purpose_app/providers/album_notifier.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:provider/provider.dart';

class AlbumDetailScreen extends StatefulWidget {
  final Album album;

  const AlbumDetailScreen({Key? key, required this.album}) : super(key: key);

  @override
  _AlbumDetailScreenState createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  bool isLoading = true;
  List<Photo> photoList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.album.title,
          style: Styles.instance.text18ExtraBoldWhite,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(Images.instance.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                var photo = photoList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.black25,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CachedNetworkImage(
                        imageUrl: photo.url,
                        height: 250.h,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            color: AppColors.black65,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(6.r)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 250.h,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.black65,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(6.r)),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Text(
                          photo.title,
                          style: Styles.instance.text14White,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: photoList.length,
            ),
    );
  }

  Future<void> getAlbums() async {
    try {
      setState(() {
        isLoading = true;
      });
      var list =
          await context.read<AlbumNotifier>().getAlbumsPhotos(widget.album.id);
      setState(() {
        photoList = list;
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            style: Styles.instance.text14White,
          ),
          backgroundColor: AppColors.black65,
        ),
      );
    }
  }
}
