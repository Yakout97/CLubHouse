import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/models/rooms.dart';
import 'package:flutter_application_1/widgets/RoomUserProfile.dart';
import 'package:flutter_application_1/widgets/userProfileImage.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 110,
        leading: TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () => Navigator.of(context).pop,
            icon: const Icon(CupertinoIcons.chevron_down),
            label: const Text('Hallway')),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.doc),
            color: Colors.black,
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: userProfileImage(
                imageURL: currentUser.imageURL,
                size: 34,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.ellipsis)),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 80,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed by speakers',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 24,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others in the room',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 24,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 50))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '✌🏼 Leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  backgroundColor: Colors.grey[300],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
