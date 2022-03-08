import 'package:flutter/material.dart';
import 'package:instragram_clone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16).copyWith(right: 0),
            child: Row(
              children:  [
                 CircleAvatar(
                  radius: 16,
                  backgroundImage: null,
                ),
                Expanded(
                    child: Padding(padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('username',style: TextStyle(fontWeight: FontWeight.bold),)

                      ],
                    ),
                    ),

                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))

              ],
            ),
          )
        ],
      ),
    );
  }
}
