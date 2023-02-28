import 'package:flutter/material.dart';
import 'package:flutter_list/models/user_model.dart';
import 'package:flutter_list/extensions/lorem_ipsum.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback callback;
  const UserTile({super.key, required this.user, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      hoverColor: Colors.deepPurple.shade100,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            style: BorderStyle.solid,
            width: 2,
            color: Colors.deepPurple.shade200,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(2), // Border width
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(28), // Image radius
                      child: Image.network(user.avatar, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          user.first_name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          user.last_name,
                          style: TextStyle(
                              fontSize: 13, color: Colors.deepPurple[200]),
                        ),
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 2,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple[200]),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              context.randomLoremIpsum,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.deepPurple[500],
                ),
                const SizedBox(width: 3),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.deepPurple[300]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
