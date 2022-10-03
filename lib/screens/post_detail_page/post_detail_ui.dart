import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/post_detail_page/post_detail_behavior.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';
import '../get_specific_person_post_page/get_specific_person_post_behavior.dart';
import '../main_page/home_page/tabs/community/community_tab_widgets/community_tab_behavior.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage(
      {Key? key, required this.customerId, required this.postId})
      : super(key: key);

  static const String postDetailPageRoute = 'PostDetailPage';
  final int customerId, postId;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage>
    with PostDetailBehavior, ConnectivityHandler {
  Future<Map<String, dynamic>> getPostDetailResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        getPostDetailResponse = await dio.get(
          '$baseUrl/api/post-details',
          queryParameters: {
            'token': bearerToken,
            'customer_id': widget.customerId,
            'post_id': widget.postId,
          },
        );

        getPostDetailResponseMap =
            getPostDetailResponse.data is Map<String, dynamic>
                ? getPostDetailResponse.data
                : {};

        if (getPostDetailResponseMap.isNotEmpty) {
          String status = getPostDetailResponseMap['status'] is String
              ? getPostDetailResponseMap['status']
              : '';
          if (status == 'success') {
            Map<String, dynamic> postDetailDataMap =
                getPostDetailResponseMap['data'] is Map<String, dynamic>
                    ? getPostDetailResponseMap['data']
                    : [];
            return postDetailDataMap;
          } else {
            return {};
          }
        } else {
          return {};
        }
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> deletePostImageResponseData(
      {required int imageId}) async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'deleting post image...',
            ),
            duration: Duration(minutes: 1)));
        Response deletePostImageResponse = await dio.post(
          '$baseUrl/api/delete-post-image',
          queryParameters: {
            'token': bearerToken,
            'image_id': imageId,
            'customer_id': widget.customerId,
            'post_id': widget.postId,
          },
        );

        Map<String, dynamic> deletePostImageResponseMap =
            deletePostImageResponse.data is Map<String, dynamic>
                ? deletePostImageResponse.data
                : {};

        if (deletePostImageResponseMap.isNotEmpty) {
          String status = deletePostImageResponseMap['status'] is String
              ? deletePostImageResponseMap['status']
              : '';
          if (status == 'success') {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'deleted successfully.',
              ),
            ));
            PostDetailBehavior.setStateOfPostDetailListView();
            Map<String, dynamic> deletePostImageDataMap =
                deletePostImageResponseMap['data'] is Map<String, dynamic>
                    ? deletePostImageResponseMap['data']
                    : {};
            return deletePostImageDataMap;
          } else {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'failed to delete, please try again!',
              ),
            ));
            return {};
          }
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'failed to delete, please try again!',
            ),
          ));
          return {};
        }
      } catch (e) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'failed to delete, please try again!',
          ),
        ));
        return {};
      }
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'failed to delete, please try again!',
        ),
      ));
      return {};
    }
  }

  Future<Map<String, dynamic>> deletePostResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'deleting post...',
            ),
            duration: Duration(minutes: 1)));
        Response deletePostResponse = await dio.post(
          '$baseUrl/api/delete-post',
          queryParameters: {
            'token': bearerToken,
            'customer_id': widget.customerId,
            'post_id': widget.postId,
          },
        );

        Map<String, dynamic> deletePostResponseMap =
            deletePostResponse.data is Map<String, dynamic>
                ? deletePostResponse.data
                : {};

        if (deletePostResponseMap.isNotEmpty) {
          String status = deletePostResponseMap['status'] is String
              ? deletePostResponseMap['status']
              : '';
          if (status == 'success') {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'deleted successfully.',
              ),
            ));

            Navigator.pop(context);
            if (CommunityTabBehavior.isFromCommunity) {
              CommunityTabBehavior.setStateOfLatestPostListView();
            } else {
              GetSpecificPersonPostBehavior
                  .setStateOfSpecificPersonPostListView();
              CommunityTabBehavior.setStateOfLatestPostListView();
            }
            CommunityTabBehavior.isFromCommunity = false;
            return deletePostResponseMap;
          } else {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'failed to delete, please try again!',
              ),
            ));
            return {};
          }
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'failed to delete, please try again!',
            ),
          ));
          return {};
        }
      } catch (e) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'failed to delete, please try again!',
          ),
        ));
        return {};
      }
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'failed to delete, please try again!',
        ),
      ));
      return {};
    }
  }

  @override
  void initState() {
    PostDetailBehavior.setStateOfPostDetailListView = () {
      PostDetailBehavior.getPostDetailResponseDataMapFuture =
          getPostDetailResponseData();
      setState(() {});
    };

    PostDetailBehavior.getPostDetailResponseDataMapFuture =
        getPostDetailResponseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      key: bottomSheetKey,
      body: Column(
        children: [
          // App bar
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(InstaDaleelColors.primaryColor),
                ),
              ),
              title: const Center(
                child: Text(
                  'Post Detail',
                  style: TextStyle(
                      color: Color(InstaDaleelColors.primaryColor),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              trailing: SizedBox(
                width: 70,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/main_page/app_bar/main_screen_appbar_notification_icon.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          //body
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: PostDetailBehavior.getPostDetailResponseDataMapFuture,
              initialData: const {},
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data!.isNotEmpty) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: leftRightGlobalMargin,
                            right: leftRightGlobalMargin,
                            top: 15,
                            bottom: 15),
                        padding: const EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // name and profile pic
                            Container(
                              height: 80,
                              padding: const EdgeInsets.only(
                                  right: leftRightGlobalMargin),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  (widget.customerId == userId)
                                      ? PopupMenuButton<PopupMenuItem>(
                                          icon: Icon(
                                            Icons.adaptive.more,
                                            color: const Color(
                                                InstaDaleelColors.primaryColor),
                                          ),
                                          itemBuilder: (context) {
                                            return [
                                              PopupMenuItem(
                                                child:
                                                    const Text('Update Post'),
                                                onTap: () {
                                                  List<dynamic> argsList = [];
                                                  argsList.add(widget.postId);
                                                  argsList.add(snapshot.data![
                                                              'description']
                                                          is String
                                                      ? snapshot
                                                          .data!['description']
                                                      : '---');

                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Navigator.pushNamed(context,
                                                        'UpdatePostScreen',
                                                        arguments: argsList);
                                                  });
                                                },
                                              ),
                                              PopupMenuItem(
                                                child:
                                                    const Text('Delete Post'),
                                                onTap: () {
                                                  bottomSheetController =
                                                      bottomSheetKey
                                                          .currentState!
                                                          .showBottomSheet(
                                                    (context) => Container(
                                                      height: 50,
                                                      color: Colors.black54,
                                                      child: Row(
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20),
                                                            child: Text(
                                                              'Delete this Post?',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          const Expanded(
                                                              child:
                                                                  SizedBox()),
                                                          TextButton(
                                                            onPressed: () {
                                                              bottomSheetController
                                                                  .close();
                                                            },
                                                            child: const Text(
                                                              'No',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              bottomSheetController
                                                                  .close();
                                                              deletePostResponseData();
                                                            },
                                                            child: const Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ];
                                          },
                                        )
                                      : const SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Text(
                                            snapshot.data!['customer_data']
                                                    is Map<String, dynamic>
                                                ? snapshot.data![
                                                            'customer_data']
                                                        ['name'] is String
                                                    ? snapshot.data![
                                                        'customer_data']['name']
                                                    : '---'
                                                : '---',
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                              color: Color(InstaDaleelColors
                                                  .primaryColor),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          snapshot.data!['customer_data']
                                                  is Map<String, dynamic>
                                              ? snapshot.data!['customer_data']
                                                      ['image'] is String
                                                  ? '$baseUrl/images/customer/${snapshot.data!['customer_data']['image']}'
                                                  : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                              : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // description
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                  left: leftRightGlobalMargin,
                                  right: leftRightGlobalMargin),
                              child: Text(
                                snapshot.data!['description'] is String
                                    ? snapshot.data!['description']
                                    : '---',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            ),

                            // post images list View
                            Container(
                              margin: const EdgeInsets.only(
                                  right: leftRightGlobalMargin,
                                  left: leftRightGlobalMargin,
                                  top: 20),
                              // height: 200, // it was given
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!['image'] is String
                                    ? jsonDecode(snapshot.data!['image']).length
                                    : 0,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      if (widget.customerId == userId) {
                                        bottomSheetController = bottomSheetKey
                                            .currentState!
                                            .showBottomSheet(
                                          (context) => Container(
                                            height: 50,
                                            color: Colors.black54,
                                            child: Row(
                                              children: [
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    'Delete this image?',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                const Expanded(
                                                    child: SizedBox()),
                                                TextButton(
                                                  onPressed: () {
                                                    bottomSheetController
                                                        .close();
                                                  },
                                                  child: const Text(
                                                    'No',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    bottomSheetController
                                                        .close();
                                                    int imageId = snapshot
                                                                .data!['image']
                                                            is String
                                                        ? jsonDecode(snapshot
                                                                        .data![
                                                                    'image'])
                                                                .isNotEmpty
                                                            ? jsonDecode(snapshot
                                                                        .data![
                                                                    'image'])[
                                                                index]['id']
                                                            : -1
                                                        : -1;

                                                    if (imageId != -1) {
                                                      deletePostImageResponseData(
                                                          imageId: imageId);
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                          'invalid image id',
                                                        ),
                                                      ));
                                                    }
                                                  },
                                                  child: const Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      imageUrl: snapshot.data!['image']
                                              is String
                                          ? jsonDecode(snapshot.data!['image'])
                                                  .isNotEmpty
                                              ? '$baseUrl/images/post/${jsonDecode(snapshot.data!['image'])[index]['image']}'
                                              : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                          : 'https://bitsofco.de/content/images/2018/12/broken-1.png',
                                      placeholder:
                                          (BuildContext context, String url) =>
                                              const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Center(
                                              child: Icon(
                                        Icons.error_outline_outlined,
                                        color: Colors.white,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // like
                            PostLikeUnlikeButton(
                              customerId: widget.customerId,
                              postId: widget.postId,
                              totalLikes: snapshot.data!['total_like'] is int
                                  ? snapshot.data!['total_like']
                                  : '0',
                            ),

                            // comment here text field
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'AddCommentScreen',
                                    arguments: widget.postId);
                              },
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: leftRightGlobalMargin),
                                          child: AbsorbPointer(
                                            child: TextField(
                                              textInputAction:
                                                  TextInputAction.next,
                                              // controller: textEditingController,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                  hintText: 'Comment here',
                                                  hintTextDirection:
                                                      TextDirection.rtl,
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFFB1B1B1),
                                                    fontSize: 13,
                                                  ),
                                                  border: InputBorder.none),
                                              cursorColor: Color(
                                                  InstaDaleelColors
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: VerticalDivider(
                                          color: Color(
                                              InstaDaleelColors.primaryColor),
                                          thickness: 0.5,
                                          indent: 8,
                                          endIndent: 8,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 20, left: 10),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color(
                                                InstaDaleelColors.primaryColor),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            //comments listview
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!['comments'].length,
                              itemBuilder: (context, index) => Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  children: [
                                    // name and profile pic
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.only(
                                          right: leftRightGlobalMargin),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CommentLikeUnlikeButton(
                                            customerId: widget.customerId,
                                            commentId: snapshot
                                                        .data!['comments']
                                                    is List<dynamic>
                                                ? snapshot.data!['comments']
                                                            [index]
                                                        is Map<String, dynamic>
                                                    ? snapshot.data!['comments']
                                                            [index]['id'] is int
                                                        ? snapshot.data![
                                                                'comments']
                                                            [index]['id']
                                                        : 0
                                                    : 0
                                                : 0,
                                            totalLikes: snapshot
                                                        .data!['comments']
                                                    is List<dynamic>
                                                ? snapshot.data!['comments']
                                                            [index]
                                                        is Map<String, dynamic>
                                                    ? snapshot.data!['comments']
                                                                    [index]
                                                                ['comment_like']
                                                            is List<dynamic>
                                                        ? snapshot
                                                            .data!['comments']
                                                                [index]
                                                                ['comment_like']
                                                            .length
                                                        : 0
                                                    : 0
                                                : 0,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  child: Text(
                                                    snapshot.data!['comments']
                                                            is List<dynamic>
                                                        ? snapshot.data!['comments']
                                                                    [index]
                                                                is Map<String,
                                                                    dynamic>
                                                            ? snapshot.data!['comments']
                                                                        [index]['customer']
                                                                    is Map<
                                                                        String,
                                                                        dynamic>
                                                                ? snapshot.data!['comments'][index]['customer']
                                                                            ['name']
                                                                        is String
                                                                    ? snapshot.data!['comments'][index]['customer']['name']
                                                                    : '---'
                                                                : '---'
                                                            : '---'
                                                        : '---',
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                      color: Color(
                                                          InstaDaleelColors
                                                              .primaryColor),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                                style: BorderStyle.solid,
                                              ),
                                              // to be set after the response set
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                  snapshot.data!['comments']
                                                          is List<dynamic>
                                                      ? snapshot.data!['comments']
                                                                  [index]
                                                              is Map<String,
                                                                  dynamic>
                                                          ? snapshot.data!['comments']
                                                                      [index]['customer']
                                                                  is Map<String,
                                                                      dynamic>
                                                              ? snapshot.data!['comments'][index]['customer']
                                                                          ['image']
                                                                      is String
                                                                  ? '$baseUrl/images/customer/${snapshot.data!['comments'][index]['customer']['image']}'
                                                                  : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                                              : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                                          : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // description
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(
                                          left: leftRightGlobalMargin,
                                          right: leftRightGlobalMargin),
                                      child: Text(
                                        snapshot.data!['comments']
                                                is List<dynamic>
                                            ? snapshot.data!['comments'][index]
                                                    is Map<String, dynamic>
                                                ? snapshot.data!['comments']
                                                            [index]['comment']
                                                        is String
                                                    ? snapshot.data!['comments']
                                                        [index]['comment']
                                                    : '---'
                                                : '---'
                                            : '---',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    ),

                                    // post images list View
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: leftRightGlobalMargin,
                                          left: leftRightGlobalMargin,
                                          top: 20),
                                      // height: 200, // it was given
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!['comments']
                                                is List<dynamic>
                                            ? snapshot.data!['comments'][index]
                                                    is Map<String, dynamic>
                                                ? snapshot.data!['comments']
                                                            [index]['image']
                                                        is String
                                                    ? jsonDecode(snapshot
                                                            .data!['comments']
                                                                [index]['image']
                                                            .toString())
                                                        .length
                                                    : 0
                                                : 0
                                            : 0,
                                        itemBuilder: (context, innerIndex) =>
                                            Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.contain,
                                            imageUrl: snapshot.data!['comments']
                                                    is List<dynamic>
                                                ? snapshot.data!['comments']
                                                            [index]
                                                        is Map<String, dynamic>
                                                    ? snapshot.data!['comments']
                                                                [index]['image']
                                                            is String
                                                        ? jsonDecode(snapshot.data![
                                                                        'comments']
                                                                    [index]['image'])
                                                                .isNotEmpty
                                                            ? '$baseUrl/images/post/${jsonDecode(snapshot.data!['comments'][index]['image'])[innerIndex]['image']}'
                                                            : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                                        : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                                    : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                                : 'https://bitsofco.de/content/images/2018/12/broken-1.png',
                                            placeholder: (BuildContext context,
                                                    String url) =>
                                                const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Center(
                                                        child: Icon(
                                              Icons.error_outline_outlined,
                                              color: Colors.white,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /*// small card 1
                            Container(
                                margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 5),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    SizedBox(
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Text(
                                              'Sayma Arsha',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: Color(InstaDaleelColors.primaryColor),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                                style: BorderStyle.solid,
                                              ),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/main_page/home_page/community_tab/dp2.png',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 60,
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet  nullam sagittis malesuada.',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),

                            // small card 2
                            Container(
                                margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 5),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    SizedBox(
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Text(
                                              'Karim Shaikh',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: Color(InstaDaleelColors.primaryColor),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                                style: BorderStyle.solid,
                                              ),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/main_page/home_page/community_tab/dp5.png',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 60,
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet  nullam sagittis malesuada.',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),*/
                          ],
                        )),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'no detail available',
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// post like/unlike section
class PostLikeUnlikeButton extends StatefulWidget {
  PostLikeUnlikeButton(
      {Key? key,
      required this.customerId,
      required this.postId,
      required this.totalLikes})
      : super(key: key);

  final int customerId, postId;
  int totalLikes = 0;

  @override
  State<PostLikeUnlikeButton> createState() => _PostLikeUnlikeButtonState();
}

class _PostLikeUnlikeButtonState extends State<PostLikeUnlikeButton>
    with ConnectivityHandler {
  Future<Map<String, dynamic>> getPostLikeUnlikeResponseData() async {
    Response<dynamic> getPostLikeUnlikeResponse;
    if (await checkForInternetServiceAvailability(context)) {
      try {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'processing...',
          ),
        ));
        getPostLikeUnlikeResponse = await dio.post(
          '$baseUrl/api/post-like',
          queryParameters: {
            'token': bearerToken,
            'customer_id': widget.customerId,
            'post_id': widget.postId,
          },
        );

        Map<String, dynamic> getPostLikeUnlikeResponseMap =
            getPostLikeUnlikeResponse.data is Map<String, dynamic>
                ? getPostLikeUnlikeResponse.data
                : {};

        if (getPostLikeUnlikeResponseMap.isNotEmpty) {
          String status = getPostLikeUnlikeResponseMap['status'] is String
              ? getPostLikeUnlikeResponseMap['status']
              : '';
          if (status == 'success') {
            widget.totalLikes = getPostLikeUnlikeResponseMap['total_like'];
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                '${getPostLikeUnlikeResponseMap['data']}',
              ),
            ));
            setState(() {});
            return getPostLikeUnlikeResponseMap;
          } else {
            return {};
          }
        } else {
          return {};
        }
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            padding: const EdgeInsets.only(left: leftRightGlobalMargin * 2),
            child: InkWell(
              onTap: () {
                getPostLikeUnlikeResponseData();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Like',
                    style: TextStyle(
                      color: Color(0xFFB1B1B1),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Divider
          const Divider(
            color: Color(0xFFB1B1B1),
            thickness: 1,
            height: 0,
          ),

          Container(
            margin: const EdgeInsets.only(left: leftRightGlobalMargin * 2),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${widget.totalLikes} likes ',
                  style: const TextStyle(
                    color: Color(0xFFB1B1B1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// comment like/unlike Section
class CommentLikeUnlikeButton extends StatefulWidget {
  CommentLikeUnlikeButton(
      {Key? key,
      required this.customerId,
      required this.commentId,
      required this.totalLikes})
      : super(key: key);

  final int customerId, commentId;
  int totalLikes = 0;

  @override
  State<CommentLikeUnlikeButton> createState() =>
      _CommentLikeUnlikeButtonState();
}

class _CommentLikeUnlikeButtonState extends State<CommentLikeUnlikeButton>
    with ConnectivityHandler {
  Future<Map<String, dynamic>> getCommentLikeUnlikeResponseData() async {
    Response<dynamic> getCommentLikeUnlikeResponse;
    if (await checkForInternetServiceAvailability(context)) {
      try {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'processing...',
          ),
        ));
        getCommentLikeUnlikeResponse = await dio.post(
          '$baseUrl/api/comment-like',
          queryParameters: {
            'token': bearerToken,
            'customer_id': widget.customerId,
            'post_like_comment_id': widget.commentId,
          },
        );

        Map<String, dynamic> getCommentLikeUnlikeResponseMap =
            getCommentLikeUnlikeResponse.data is Map<String, dynamic>
                ? getCommentLikeUnlikeResponse.data
                : {};

        if (getCommentLikeUnlikeResponseMap.isNotEmpty) {
          String status = getCommentLikeUnlikeResponseMap['status'] is String
              ? getCommentLikeUnlikeResponseMap['status']
              : '';
          if (status == 'success') {
            widget.totalLikes = getCommentLikeUnlikeResponseMap['total_like'];
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                '${getCommentLikeUnlikeResponseMap['data']}',
              ),
            ));
            setState(() {});
            return getCommentLikeUnlikeResponseMap;
          } else {
            return {};
          }
        } else {
          return {};
        }
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getCommentLikeUnlikeResponseData();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: leftRightGlobalMargin * 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${widget.totalLikes} likes ',
              style: const TextStyle(
                color: Color(0xFFB1B1B1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
