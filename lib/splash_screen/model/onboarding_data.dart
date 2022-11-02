class OnBoarding {
  final String title;
  final String image;



  OnBoarding({
    required this.title,
    required this.image,
  });
}


List<OnBoarding> onboardingContents = [
  OnBoarding(title: 'Welcome to\n Mahendra App',
  image: 'assets/images/splash1.jpg',),

  OnBoarding(title: 'Create your\n google account',
  image: 'assets/images/splash2.jpg',),
];