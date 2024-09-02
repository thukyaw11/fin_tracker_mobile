import 'package:expense_tracker_mobile/utils/constants/image_strings.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login/login.dart';
import 'register/register.dart'; // Import the login screen

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

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
              child: PageView(
                controller: _pageController,
                children: [
                  OnBoardingPage(
                    image: TImages.OnBoardingImage1,
                    title: TTexts.onBoardingTitle1,
                    subTitle: TTexts.onBoardingSubTitle1,
                    pageController: _pageController,
                  ),
                  OnBoardingPage(
                    image: TImages.OnBoardingImage2,
                    title: TTexts.onBoardingTitle2,
                    subTitle: TTexts.onBoardingSubTitle2,
                    pageController: _pageController,
                  ),
                  OnBoardingPage(
                    image: TImages.OnBoardingImage3,
                    title: TTexts.onBoardingTitle3,
                    subTitle: TTexts.onBoardingSubTitle3,
                    pageController: _pageController,
                  ),
                ],
              ),
            ),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the Register screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                foregroundColor: Colors.deepPurple,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.deepPurple),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     // Navigate to the Login screen
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const LoginScreen()),
            //     );
            //   },
            //   style: TextButton.styleFrom(
            //     padding: const EdgeInsets.all(16),
            //     foregroundColor: Colors.deepPurple,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            //   child: const Text(
            //     'Login',
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ),
          ],
        ),
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
          style: TextStyle(
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

        // Dot navigation
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.deepPurple,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
        // const SizedBox(height: 10),
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
