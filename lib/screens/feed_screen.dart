import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instragram_clone/utils/colors.dart';

import '../widgets/post_card.dart';
class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,height: 32,),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: PostCard(),
    );
  }
}
