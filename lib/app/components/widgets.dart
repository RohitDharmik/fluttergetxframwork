import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/utils/helper.dart';
import 'package:get/get.dart';

inputBorder({Color? color, double? radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 6),
    borderSide: BorderSide(
      color: color ?? Colors.grey.shade300,
    ),
  );
}

TextStyle verifyOTPTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

// Future loadingDialog({
//   required BuildContext context,
//   required Future future,
//   String? message,
// }) async {
//   return await showDialog(
//     context: context,
//     builder: (context) => FutureProgressDialog(
//       future,
//       message: message != null ? Text('$message...') : null,
//     ),
//   );
// }

Future logoutPopUp({required BuildContext context}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Logout"),
          content: const Text("Do You want To Logout ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                print("Clearing Data");
                await box.erase();
                await Get.offAllNamed("/login");
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        );
      });
}

Container headingText(
    {required String text,
    EdgeInsets? margin,
    double? fontSize,
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    TextAlign? textAlign}) {
  return Container(
    margin: margin ??
        const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 16,
              color: color ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontFamily: fontFamily),
          textAlign: textAlign ?? TextAlign.start,
        ),
      ],
    ),
  );
}

Widget addServiceButton(
    {required BuildContext context,
    EdgeInsets? padding,
    GestureTapCallback? onTap}) {
  return SafeArea(
    child: Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20, right: 10),
      child: InkWell(
        onTap: onTap ??
            () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => const AddService()));
            },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Icon(
              CupertinoIcons.add,
              size: 36,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget loadingIndicator(
    {required BuildContext context,
    required String? apiResponse,
    num? gapDistance}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (gapDistance != null)
        SizedBox(
          height: MediaQuery.of(context).size.height * gapDistance,
        ),
      if (apiResponse == null) const CupertinoActivityIndicator(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(apiResponse ?? "Loading..."),
      ),
    ],
  );
}

List<BoxShadow>? skeletonCardShadow = [
  BoxShadow(
    color: Colors.grey.shade200,
    offset: const Offset(0, 3),
    spreadRadius: 2,
    blurRadius: 3,
  )
];

// Widget shimmerCard({
//   Color? backgroundColor,
//   Color? highlightColor,
//   double? height,
//   double? width,
//   double? borderRadius,
//   EdgeInsets? margin,
//   Duration? duration,
//   ShimmerDirection? direction,
//   Gradient? gradient,
// }) {
//   return Row(
//     children: [
//       Shimmer.fromColors(
//         baseColor: backgroundColor ?? Colors.grey.shade200,
//         highlightColor: highlightColor ?? Colors.white,
//         direction: direction ?? ShimmerDirection.ltr,
//         period: duration ?? const Duration(milliseconds: 1800),
//         child: Container(
//             margin: margin ?? const EdgeInsets.only(left: 16, top: 6),
//             height: height ?? 16,
//             width: width ?? 200,
//             decoration: BoxDecoration(
//               color: backgroundColor ?? Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(borderRadius ?? 4),
//             )),
//       )
//     ],
//   );
// }

// Widget skeletonProductCard({required BuildContext context, int? itemCount}) {
//   Size size = MediaQuery.of(context).size;
//   return ListView.builder(
//     itemCount: itemCount ?? 3,
//     shrinkWrap: true,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
//         child: Container(
//           width: 160,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: skeletonCardShadow,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
//                     child: shimmerCard(
//                       height: 125,
//                       width: 125,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         shimmerCard(
//                           height: 12,
//                           width: size.width * 0.3,
//                           margin: const EdgeInsets.only(left: 3, top: 2),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
//                         child: shimmerCard(
//                           height: 12,
//                           width: size.width * 0.2,
//                           margin: const EdgeInsets.only(left: 3, top: 2),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               shimmerCard(
//                 height: 16,
//                 width: size.width * 0.34,
//                 margin: const EdgeInsets.only(
//                     left: 8, top: 2, right: 4, bottom: 12),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget skeletonBannerCard({required BuildContext context}) {
//   Size size = MediaQuery.of(context).size;
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         height: 150,
//         width: MediaQuery.of(context).size.width * 0.9,
//         margin: const EdgeInsets.only(top: 18, bottom: 18),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           boxShadow: skeletonCardShadow,
//         ),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       shimmerCard(height: 14, width: size.width * 0.25)
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: shimmerCard(height: 14, width: size.width * 0.4),
//                   )
//                 ],
//               ),
//             ),
//             shimmerCard(
//               height: 100,
//               width: 100,
//               borderRadius: 50,
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget skeletonCategoriesCard({required BuildContext context, int? itemCount}) {
//   Size size = MediaQuery.of(context).size;
//   return ListView.builder(
//     itemCount: itemCount ?? 1,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//         child: Container(
//           height: 150,
//           width: size.width * 0.85,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: skeletonCardShadow,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               shimmerCard(),
//               shimmerCard(width: 120),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget productCard({
//   required String? title,
//   required num? price,
//   double? width,
//   EdgeInsets? padding,
//   required String? imageUrl,
//   required String? productId,
//   required BuildContext context,
//   bool? firstCard = false,
//   bool? enableHeartIcon = false,
//   bool? showHeart = false,
//   GestureTapCallback? onTap,
//   GestureTapCallback? addToWishList,
//   GestureTapCallback? addToCart,
// }) {
//   return Padding(
//     padding:
//         padding ?? EdgeInsets.fromLTRB(firstCard == true ? 18 : 0, 8, 18, 8),
//     child: InkWell(
//       onTap: onTap ??
//           () {
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (_) => ProductDetail(
//             //           productId: productId,
//             //           productName: title,
//             //           productImage: imageUrl,
//             //         )));
//           },
//       child: Stack(
//         children: [
//           Container(
//             width: width ?? 160,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   blurRadius: 0.5,
//                   spreadRadius: 0.5,
//                 )
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   children: [
//                     Container(
//                       height: 125,
//                       width: 125,
//                       margin: const EdgeInsets.only(
//                           left: 12, right: 12, top: 12, bottom: 12),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                       ),
//                       child: Hero(
//                         tag: productId!,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child:
//                               imageUrl != null ? Image.network(imageUrl) : null,
//                         ),
//                       ),
//                     ),
//                     if (title != null)
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 title,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     if (price != null)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
//                             child: Text(
//                               "Rs $price",
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.red,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       Row(
//                 //         children: [
//                 //           const Icon(Icons.star, color: Colors.orangeAccent, size: 16),
//                 //           Text(
//                 //             rating,
//                 //             style: const TextStyle(
//                 //               fontSize: 12,
//                 //               color: Colors.black,
//                 //               fontWeight: FontWeight.w400,
//                 //             ),
//                 //             textAlign: TextAlign.center,
//                 //           ),
//                 //         ],
//                 //       ),
//                 //       Text(
//                 //         "$review Reviews",
//                 //         style: const TextStyle(
//                 //           fontSize: 10,
//                 //           color: Colors.black,
//                 //           fontWeight: FontWeight.w400,
//                 //         ),
//                 //         textAlign: TextAlign.center,
//                 //       ),
//                 //       InkWell(
//                 //         onTap: () {
//                 //           CustomPopup.show(
//                 //             context: context,
//                 //             title: title,
//                 //             body: Column(
//                 //               children: [
//                 //                 InkWell(
//                 //                   onTap: addToWishList ??
//                 //                       () {
//                 //                         Navigator.pop(context);
//                 //                       },
//                 //                   child: Row(
//                 //                     children: [
//                 //                       headingText(
//                 //                           text: "Add to Wishlist",
//                 //                           fontWeight: FontWeight.w500,
//                 //                           fontSize: 14,
//                 //                           color: Colors.black),
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //                 const Padding(
//                 //                   padding: EdgeInsets.symmetric(horizontal: 18),
//                 //                   child: Divider(height: 0),
//                 //                 ),
//                 //                 InkWell(
//                 //                   onTap: () {
//                 //                     Navigator.pop(context);
//                 //                   },
//                 //                   child: Row(
//                 //                     children: [
//                 //                       headingText(
//                 //                           text: "Share Product",
//                 //                           fontWeight: FontWeight.w500,
//                 //                           fontSize: 14,
//                 //                           color: Colors.black),
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //                 const Padding(
//                 //                   padding: EdgeInsets.symmetric(horizontal: 18),
//                 //                   child: Divider(height: 0),
//                 //                 ),
//                 //                 Padding(
//                 //                   padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
//                 //                   child: CupertinoButton(
//                 //                     color:Theme.of(context).primarySwatch,
//                 //                     onPressed: addToCart ??
//                 //                         () {
//                 //                           Navigator.pop(context);
//                 //                         },
//                 //                     child: Row(
//                 //                       mainAxisAlignment: MainAxisAlignment.center,
//                 //                       children: const [
//                 //                         Text("Add to Cart"),
//                 //                       ],
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //           );
//                 //         },
//                 //         child: const Icon(
//                 //           Icons.more_vert_outlined,
//                 //           color: Colors.grey,
//                 //           size: 22,
//                 //         ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//           if (enableHeartIcon == true)
//             Positioned(
//               right: 0,
//               child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     showHeart == true
//                         ? CupertinoIcons.heart_fill
//                         : CupertinoIcons.heart,
//                     color: Colors.red,
//                   )),
//             )
//         ],
//       ),
//     ),
//   );
// }

CupertinoButton viewAllCategories(
    {required BuildContext context,
    EdgeInsets? padding,
    VoidCallback? onTap,
    Color? color}) {
  return CupertinoButton(
    padding: padding,
    onPressed: onTap ?? () {},
    child: Row(
      children: [
        Text(
          "View All",
          style: TextStyle(
            color: color ?? Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 4),
        Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 18,
        ),
      ],
    ),
  );
}

Widget categoriesCard({
  required String title,
  required String subTitle,
  required String imageUrl,
  bool? firstCard = false,
  required BuildContext context,
  required GestureTapCallback onTap,
}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.fromLTRB(18, 8, firstCard == true ? 0 : 18, 8),
    child: GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 170,
                width: 222,
                child: Image.asset(imageUrl),
              ),
            ),
            Positioned(
              left: -size.width * 0.35,
              child: Container(
                height: 150,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 18,
              child: SizedBox(
                width: size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Widget skeletonCategoriesButton({
//   required BuildContext context,
//   EdgeInsets? padding,
// }) {
//   return Padding(
//     padding: padding ?? const EdgeInsets.only(left: 18, right: 18),
//     child: Column(
//       children: [
//         shimmerCard(height: 48, width: 48),
//       ],
//     ),
//   );
// }

IgnorePointer notificationBadge({int? cartItems}) {
  return IgnorePointer(
    child: Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25),
      ),
      child: cartItems != null
          ? Center(
              child: Text(
                "$cartItems",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: cartItems.toInt() > 9 ? 10 : 12,
                    fontWeight: FontWeight.w500),
              ),
            )
          : null,
    ),
  );
}

Widget orderInfo(
    {required String title, required String subTitle, Color? subTitleColor}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        Text(
          subTitle,
          style: TextStyle(
              color: subTitleColor ?? Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      ],
    ),
  );
}

Widget customButton({required String title, bool? showDivider = true}) {
  return Column(
    children: [
      if (showDivider == true) const Divider(height: 0),
      ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 16,
          color: Colors.black,
        ),
      ),
      if (showDivider == true) const Divider(height: 0),
    ],
  );
}

Widget cartButton(
    {required Icon icon,
    required String title,
    Color? borderColor,
    Color? textColor,
    required GestureTapCallback onTap}) {
  return Flexible(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              title,
              style: TextStyle(
                  color: textColor ?? Colors.grey.shade800,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ),
  );
}
