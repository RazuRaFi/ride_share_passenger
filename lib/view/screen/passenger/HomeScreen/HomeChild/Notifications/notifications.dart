import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/NotificationController/notification_controller.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final NotificationController controller = Get.put(NotificationController());
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.getNotification(isFirstLoad: true);

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200 &&
          controller.hasMore.value &&
          !controller.isPaginating.value) {
        controller.getNotification();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(
          text: AppString.notifications,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.notifyList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            controller: scrollController,
            itemCount: controller.notifyList.length +
                (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.notifyList.length) {
                final notify = controller.notifyList[index];
                return Card(
                  color: Colors.grey.shade200,
                  margin: const EdgeInsets.only(top: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.notifications_on_outlined),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      text: notify.message.title,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 5),
                                    CommonText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      text: notify.message.text,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        CommonText(
                          text: OtherHelper.formatDateAgo(
                              notify.createdAt.toString()),
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // Show loader when loading more pages
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
