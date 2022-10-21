import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/profile_page/profile_state_controller.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';
import '../main_page/home_page/tabs/community/community_tab_widgets/community_tab_behavior.dart';
import '../post_detail_page/post_detail_behavior.dart';
import 'add_comment_behavior.dart';

class AddCommentScreen extends ConsumerStatefulWidget {
  const AddCommentScreen({Key? key, required this.postId}) : super(key: key);

  static const addCommentScreenRoute = 'AddCommentScreen';
  final int postId;

  @override
  ConsumerState<AddCommentScreen> createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends ConsumerState<AddCommentScreen>
    with AddCommentBehavior, ConnectivityHandler {
  void addCommentIndicator() {
    if (isPostingComment) {
      setState(() {
        commentButtonContent = const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        );
      });
    } else {
      setState(() {
        commentButtonContent = const Text(
          'Comment',
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
    }
  }

  void addComment() async {
    userId = ref.read(profileStateProvider).profile.id;
    late Response response;
    isPostingComment = true;
    addCommentIndicator();
    if (await checkForInternetServiceAvailability(context)) {
      try {
        response =
            await dio.post('https://insta-daleel.emicon.tech/api/post-comment',
                queryParameters: {
                  'token': bearerToken,
                },
                options: Options(contentType: 'multipart/form-data'),
                data: FormData.fromMap(
                  {
                    'post_id': widget.postId,
                    'customer_id': userId,
                    'comment': commentTextEditingController.text,
                    'images[]': multipartFileList,
                  },
                ));

        Map<String, dynamic> postCommentResponseMap =
            response.data is Map<String, dynamic> ? response.data : {};

        if (postCommentResponseMap.isNotEmpty) {
          String postCommentResponseStatus =
              postCommentResponseMap['status'] is String
                  ? postCommentResponseMap['status']
                  : '';

          if (postCommentResponseStatus == 'success') {
            Map<String, dynamic> postCommentDataMap =
                postCommentResponseMap['data'] is Map<String, dynamic>
                    ? postCommentResponseMap['data']
                    : {};

            if (postCommentDataMap.isNotEmpty) {}

            isPostingComment = false;
            commentTextEditingController.clear();
            CommunityTabBehavior.setStateOfLatestPostListView();
            // profilePic = null;
            addCommentIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'comment added successfully',
              ),
            ));
            PostDetailBehavior.setStateOfPostDetailListView();
            Navigator.pop(context);
          } else if (postCommentResponseStatus == 'error') {
            isPostingComment = false;
            addCommentIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'unable to post comment, please try again later',
              ),
            ));
          } else {
            isPostingComment = false;
            addCommentIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'something went wrong, please try again1',
              ),
            ));
          }
        } else {
          isPostingComment = false;
          addCommentIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'server not responding, please try again',
            ),
          ));
        }
      } on Exception {
        isPostingComment = false;
        addCommentIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'something went wrong, please try again2',
          ),
        ));
      }
    } else {
      isPostingComment = false;
      addCommentIndicator();
    }
  }

  @override
  void initState() {
    isKeyboardOpen = false;
    addCommentIndicator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          isKeyboardOpen = false;
        },
        child: Column(
          children: [
            // app bar
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    isKeyboardOpen = false;
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
                title: const Center(
                  child: Text(
                    'Post Comment',
                    style: TextStyle(
                        color: Color(InstaDaleelColors.primaryColor),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: SizedBox(
                  height: 45,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
                    ),
                  ),
                ),
              ),
            ),

            //body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: leftRightGlobalMargin),
                                child: Scrollbar(
                                  thickness: 1,
                                  controller: scrollController,
                                  child: TextField(
                                    onTap: () {
                                      isKeyboardOpen = true;
                                    },
                                    scrollController: scrollController,
                                    textInputAction: TextInputAction.newline,
                                    maxLines: 7,
                                    controller: commentTextEditingController,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        hintText: 'comment here...',
                                        hintStyle: TextStyle(
                                          color: Color(0xFFB1B1B1),
                                          fontSize: 13,
                                        ),
                                        border: InputBorder.none),
                                    cursorColor: const Color(
                                        InstaDaleelColors.primaryColor),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: VerticalDivider(
                                color: Color(InstaDaleelColors.primaryColor),
                                thickness: 0.5,
                                indent: 8,
                                endIndent: 8,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                commentPicsList =
                                    await imagePicker.pickMultiImage();
                                if (commentPicsList != null) {
                                  for (XFile element in commentPicsList!) {
                                    multipartFileList.add(MultipartFile(
                                        File(element.path).openRead(),
                                        await element.length(),
                                        filename: element.name));
                                  }
                                }
                              },
                              child: const Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color:
                                        Color(InstaDaleelColors.primaryColor),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        isKeyboardOpen = false;
                        if (!isPostingComment) {
                          addComment();
                        }
                      },
                      child: SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(
                                    InstaDaleelColors.primaryColor)),
                            child: Center(
                              child: commentButtonContent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.transparent,
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
