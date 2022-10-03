import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/update_post_page/update_post_behavior.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';
import '../get_specific_person_post_page/get_specific_person_post_behavior.dart';
import '../main_page/home_page/tabs/community/community_tab_widgets/community_tab_behavior.dart';

class UpdatePostScreen extends StatefulWidget {
  const UpdatePostScreen({Key? key, required this.postId, required this.descriptionToBeUpdated}) : super(key: key);

  final int postId;
  final String descriptionToBeUpdated;

  static const updatePostScreenRoute = 'UpdatePostScreen';

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> with UpdatePostBehavior, ConnectivityHandler {

  void updatePostIndicator() {
    if(isUpdating) {
      setState(() {
        updateButtonContent = const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        );
      });
    }
    else {
      setState(() {
        updateButtonContent = const Text(
          'Update Post',
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
    }
  }

  void updatePost() async {
    late Response response;
    isUpdating = true;
    updatePostIndicator();
    if(await checkForInternetServiceAvailability(context)) {
      try {
        response = await dio.post('https://insta-daleel.emicon.tech/api/update-post', queryParameters: {'token': bearerToken,},
            options: Options(contentType: 'multipart/form-data'),
            data: FormData.fromMap(
              {
                'customer_id': userId,
                'post_id': widget.postId,
                'description': updatePostTextEditingController.text,
                'images[]': multipartFileList,
              },
            )
        );

        Map<String, dynamic> updatePostResponseMap = response.data is Map<String, dynamic> ?
        response.data : {};

        if(updatePostResponseMap.isNotEmpty) {
          String addPostResponseStatus = updatePostResponseMap['status'] is String ? updatePostResponseMap['status'] : '';

          if(addPostResponseStatus == 'success') {

            Map<String, dynamic> updatePostDataMap = updatePostResponseMap['data'] is Map<String, dynamic> ?
            updatePostResponseMap['data'] : {};

            if(updatePostDataMap.isNotEmpty) {

            }

            /*userName = updateProfileResponseMap['data'] is Map<String, dynamic> ?
            updateProfileResponseMap['data']['name'] is String ?
            updateProfileResponseMap['data']['name'] : '---' : '---';

            userProfilePicLink = updateProfileResponseMap['data'] is Map<String, dynamic> ?
            updateProfileResponseMap['data']['image'] is String ?
            updateProfileResponseMap['data']['image'] : null : null;*/

            isUpdating = false;
            updatePostTextEditingController.clear();
            CommunityTabBehavior.setStateOfLatestPostListView();
            // profilePic = null;
            updatePostIndicator();

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('post updated successfully',),));
            Navigator.pop(context);
            Navigator.pop(context);

            if(CommunityTabBehavior.isFromCommunity) {
              CommunityTabBehavior.setStateOfLatestPostListView();
            }
            else {
              GetSpecificPersonPostBehavior.setStateOfSpecificPersonPostListView();
              CommunityTabBehavior.setStateOfLatestPostListView();
            }

            CommunityTabBehavior.isFromCommunity = false;

          }
          else if(addPostResponseStatus == 'error') {
            isUpdating = false;
            updatePostIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('unable to update post, please try again later',),));
          }
          else {
            isUpdating = false;
            updatePostIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again1',),));
          }
        }
        else {
          isUpdating = false;
          updatePostIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('server not responding, please try again',),));
        }

      } on Exception {
        isUpdating = false;
        updatePostIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again2',),));
      }
    }
    else {
      isUpdating = false;
      updatePostIndicator();
    }
  }

  @override
  void initState() {
    isKeyboardOpen = false;
    updatePostTextEditingController.text = widget.descriptionToBeUpdated;
    updatePostIndicator();
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
                    CommunityTabBehavior.isFromCommunity = false;
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
                title: const Center(
                  child: Text(
                    'Update Post',
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
                                padding: const EdgeInsets.only(left: leftRightGlobalMargin),
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
                                    controller: updatePostTextEditingController,
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
                                    cursorColor: const Color(InstaDaleelColors.primaryColor),
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
                                updatePicsList = await imagePicker.pickMultiImage();

                                if(updatePicsList != null) {
                                  for (XFile element in updatePicsList!) {
                                    multipartFileList.add(MultipartFile(File(element.path).openRead(), await element.length(), filename: element.name));
                                  }
                                }
                                setState(() {});
                              },
                              child: const Padding(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color(InstaDaleelColors.primaryColor),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: updatePicsList != null ? updatePicsList!.length : 0,
                      itemBuilder: (context, index) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            '${index + 1} - ${updatePicsList![index].name}',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        isKeyboardOpen = false;
                        if(!isUpdating) {
                          updatePost();
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
                                color: const Color(InstaDaleelColors.primaryColor)
                            ),
                            child: Center(
                              child: updateButtonContent,
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
