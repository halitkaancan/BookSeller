// import 'package:flutter/material.dart';
// import 'package:mobileapp/feature/best_seller/view/best_seller.dart';
// import 'package:mobileapp/feature/book_details/view/book_details.dart';
// import 'package:mobileapp/feature/home/view/homeview.dart';
// import 'package:mobileapp/feature/register/view/register_view.dart';
// import 'package:mobileapp/feature/splash/view/splash.dart';
// import '../../feature/login/view/login.dart';

// class Router {
//   Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case bestSeller:
//         return MaterialPageRoute(
//             builder: (_) => BestSellerPage(
//                   token: widget.token,
//                   title: resourceCategory[index].name ?? "",
//                   list: resourceProductHome[index],
//                 ));
//       case bookDetails:
//         return MaterialPageRoute(
//             builder: (_) => const BookDetailsView(
//                   token: "",
//                   content: [],
//                 ));
//       case homeview:
//         return MaterialPageRoute(
//             builder: (_) => const HomeView(
//                   token: 'token',
//                 ));

//       case loginView:
//         return MaterialPageRoute(builder: (_) => const LoginView());

//       case register:
//         return MaterialPageRoute(builder: (_) => const RegisterView());
//       case splash:
//         return MaterialPageRoute(builder: (_) => const SplashView());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const SplashView(),
//         );
//     }
//   }
// //   const String bestSeller = '/bestSeller';
// // const String bookDetails = '/bestSeller';
// // const String homeview = '/HomeView';
// // const String loginView = '/bestSeller';
// // const String register = '/bestSeller';
// // const String splash = '/bestSeller';

// }

// const String bestSeller = '/bestSeller';
// const String bookDetails = '/bestSeller';
// const String homeview = '/HomeView';
// const String loginView = '/bestSeller';
// const String register = '/bestSeller';
// const String splash = '/bestSeller';

// //neden böyle olması gerekiyr yukarıdaki gibi yapamıyor muyuz