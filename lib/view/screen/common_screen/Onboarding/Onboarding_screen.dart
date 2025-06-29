import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/splash_controller/Onboarding_controller.dart';
import '../together_screen/together_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController pageController = PageController();
  final OnboardingController controller = Get.put(OnboardingController());

  // Checklist items for the first onboarding page
  final List<String> checklistItems = [
    "Save money",
    "Make passive income",
    "Make new friends",
    "Overcome traffic congestion",
  ];

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Let’s travel together",
      "subtitle": "", // Subtitle is handled as checklist for first page
      "image": "assets/images/splash.png",
    },
    {
      "title": "Find a ride",
      "subtitle": "Request a ride and be picked up on \nthe same route by the driver",
      "image": "assets/images/onboard2.png",
    },
    {
      "title": "Post a ride",
      "subtitle": "Publish a ride and pick up passengers \nalong the way",
      "image": "assets/images/onboard3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: controller.updatePage,
              itemCount: onboardingData.length,
              itemBuilder: (_, index) {
                final data = onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(data["image"]!, height: 210, width: 210),
                    const SizedBox(height: 20),
                    Text(
                      data["title"]!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // If it's the first page, show checklist
                    if (index == 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: checklistItems.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                children: [
                                  const Icon(Icons.check, size: 18),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          data["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            final isLastPage =
                controller.currentPage.value == onboardingData.length - 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => TogetherScreen());
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () {
                        if (isLastPage) {
                          Get.to(() => TogetherScreen());
                        } else {
                          pageController.nextPage(
                            duration: 300.milliseconds,
                            curve: Curves.ease,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
