import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/box_detail_page/box_detail_behavior.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';

class BoxDetail extends StatefulWidget {
  const BoxDetail({Key? key, required this.boxId}) : super(key: key);
  static const String boxDetailRoute = 'BoxDetail';

  final int boxId;

  @override
  State<BoxDetail> createState() => _BoxDetailState();
}

class _BoxDetailState extends State<BoxDetail> with BoxDetailBehavior, ConnectivityHandler {

  Future<Map<String, dynamic>> getBoxDetailResponseData() async {
    if(await checkForInternetServiceAvailability(context)) {
      try {
        boxDetailResponse = await dio.get('https://insta-daleel.emicon.tech/api/box-details', queryParameters: {
          'token': bearerToken,
          'box_id': widget.boxId,
        },);

        Map<String, dynamic> boxDetailResponseMap = boxDetailResponse.data is Map<String, dynamic> ? boxDetailResponse.data : {};

        if(boxDetailResponseMap.isNotEmpty) {
          String status = boxDetailResponseMap['status'] is String ? boxDetailResponseMap['status'] : '';
          if(status == 'success') {
            return boxDetailResponseMap['data'] is Map<String, dynamic> ? boxDetailResponseMap['data'] : {};
          }
          else {
            return {};
          }
        }
        else {
          return {};
        }
      }
      catch(e) {
        return {};
      }
    }
    else {
      return {};
    }
  }

  @override
  void initState() {
    BoxDetailBehavior.boxDetailResponseDataMapFuture = getBoxDetailResponseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder<Map<String, dynamic>>(
          future: BoxDetailBehavior.boxDetailResponseDataMapFuture,
          initialData: const <String, dynamic>{},
          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Column(
                children: [
                  // app bar
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
                      title: Center(
                        child: Text(
                          snapshot.data!['title'] is String ?
                          snapshot.data!['title'] : '---',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                  // body
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            // event detail image
                            CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: snapshot.data!['image'] is String ?
                              snapshot.data!['image'] : 'https://bitsofco.de/content/images/2018/12/broken-1.png',
                              placeholder: (BuildContext context, String url) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              ),
                              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline_outlined, color: Colors.black,)),
                            ),

                            // 'Annual Musical Event' text
                            Container(
                                height: 80,
                                margin: const EdgeInsets.only(left: leftRightGlobalMargin),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(context).style,
                                        children: const <TextSpan>[
                                          TextSpan(text: 'Author: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: ' ---'),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Published: ---',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10, bottom: 7),
                                          child: InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.share_outlined,
                                              color: Color(InstaDaleelColors.primaryColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                            ),

                            // event detail text
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin),
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data!['description'] is String ?
                                snapshot.data!['description'] : 'no description',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'no detail available',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Go Back'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
