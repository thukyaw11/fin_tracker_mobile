import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/constants/image_strings.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:expense_tracker_mobile/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/group/c_group.dart';
import '../../controllers/tracker/c_wallet.dart';
import '../../controllers/transaction/c_transaction.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/services/api_services.dart';
import '../../utils/services/network/api_service.dart';
import 'login/v_login.dart';
import 'register/v_register.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    injectDependencies();
    super.initState();
  }

  void injectDependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => CommonApiService(baseUrl: ApiConstants.url));
    Get.lazyPut(() => GroupController());
    Get.lazyPut(() => TrackerController());
    Get.lazyPut(() => TransactionController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // PageView for onboarding pages
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: [
                        OnBoardingPage(
                          image: TImages.onBoardingImage1,
                          title: TTexts.onBoardingTitle1,
                          subTitle: TTexts.onBoardingSubTitle1,
                          pageController: _pageController,
                        ),
                        OnBoardingPage(
                          image: TImages.onBoardingImage2,
                          title: TTexts.onBoardingTitle2,
                          subTitle: TTexts.onBoardingSubTitle2,
                          pageController: _pageController,
                        ),
                        OnBoardingPage(
                          image: TImages.onBoardingImage3,
                          title: TTexts.onBoardingTitle3,
                          subTitle: TTexts.onBoardingSubTitle3,
                          pageController: _pageController,
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.deepPurple,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                  50.heightBox()
                ],
              ),
            ),
            signupButton(),
            16.heightBox(),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(16),
        foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget signupButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the Register screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Sign Up',
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.pageController,
  });

  final String image, title, subTitle;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 200,
        ),
        const SizedBox(height: 40),

        // Title text
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Subtitle text
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: OnBoardingScreen(),
    ),
  );
}
