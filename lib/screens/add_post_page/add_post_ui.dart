import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/add_post_page/add_post_behavior.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';
import '../main_page/home_page/tabs/community/community_tab_widgets/community_tab_behavior.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  static const addPostScreenRoute = 'AddPostScreen';

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with AddPostBehavior, ConnectivityHandler {
  void addPostIndicator() {
    if (isPosting) {
      setState(() {
        postButtonContent = const SizedBox(
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
        postButtonContent = const Text(
          'Post',
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
    }
  }

  void addPost() async {
    late Response response;
    isPosting = true;
    addPostIndicator();
    if (await checkForInternetServiceAvailability(context)) {
      try {
        response = await dio.post('$baseUrl/api/add-post',
            queryParameters: {
              'token': bearerToken,
            },
            options: Options(contentType: 'multipart/form-data'),
            data: FormData.fromMap(
              {
                'customer_id': userId,
                'description': postTextEditingController.text,
                'images[]': multipartFileList,
              },
            ));

        Map<String, dynamic> addPostResponseMap =
            response.data is Map<String, dynamic> ? response.data : {};

        if (addPostResponseMap.isNotEmpty) {
          String addPostResponseStatus = addPostResponseMap['status'] is String
              ? addPostResponseMap['status']
              : '';

          if (addPostResponseStatus == 'success') {
            Map<String, dynamic> addPostDataMap =
                addPostResponseMap['data'] is Map<String, dynamic>
                    ? addPostResponseMap['data']
                    : {};

            if (addPostDataMap.isNotEmpty) {}

            /*userName = updateProfileResponseMap['data'] is Map<String, dynamic> ?
            updateProfileResponseMap['data']['name'] is String ?
            updateProfileResponseMap['data']['name'] : '---' : '---';

            userProfilePicLink = updateProfileResponseMap['data'] is Map<String, dynamic> ?
            updateProfileResponseMap['data']['image'] is String ?
            updateProfileResponseMap['data']['image'] : null : null;*/

            isPosting = false;
            postTextEditingController.clear();
            CommunityTabBehavior.setStateOfLatestPostListView();
            // profilePic = null;
            addPostIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'post added successfully',
              ),
            ));
            Navigator.pop(context);
          } else if (addPostResponseStatus == 'error') {
            isPosting = false;
            addPostIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'unable to post, please try again later',
              ),
            ));
          } else {
            isPosting = false;
            addPostIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'something went wrong, please try again1',
              ),
            ));
          }
        } else {
          isPosting = false;
          addPostIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'server not responding, please try again',
            ),
          ));
        }
      } on Exception {
        isPosting = false;
        addPostIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'something went wrong, please try again2',
          ),
        ));
      }
    } else {
      isPosting = false;
      addPostIndicator();
    }
  }

  @override
  void initState() {
    isKeyboardOpen = false;
    addPostIndicator();
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
                    'Add Post',
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

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                                    controller: postTextEditingController,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    decoration: const InputDecoration(
                                        hintText: 'what\'s in your mind?',
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
                                postPicsList =
                                    await imagePicker.pickMultiImage();

                                if (postPicsList != null) {
                                  for (XFile element in postPicsList!) {
                                    multipartFileList.add(MultipartFile(
                                        File(element.path).openRead(),
                                        await element.length(),
                                        filename: element.name));
                                  }
                                }
                                setState(() {});
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

                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          postPicsList != null ? postPicsList!.length : 0,
                      itemBuilder: (context, index) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            '${index + 1} - ${postPicsList![index].name}',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        isKeyboardOpen = false;
                        if (!isPosting) {
                          addPost();
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
                              child: postButtonContent,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Expanded(child: Container(color: Colors.transparent,))
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
