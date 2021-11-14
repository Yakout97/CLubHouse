import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/models/rooms.dart';
import 'package:flutter_application_1/roomScreen.dart';
import 'package:flutter_application_1/widgets/userProfileImage.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => RoomScreen(room: room))),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${room.club}'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                    fontSize: 12,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '${room.name}',
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          userProfileImage(
                              imageURL: room.speakers[0].imageURL, size: 48),
                          Positioned(
                              left: 28,
                              top: 24,
                              child: userProfileImage(
                                imageURL: room.speakers[1].imageURL,
                                size: 48,
                              ))
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                                  '${e.firstName} ${e.lastName} 💬',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text:
                                      '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                ),
                                WidgetSpan(
                                    child: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 16,
                                  color: Colors.grey,
                                )),
                                TextSpan(
                                  text: ' / ${room.speakers.length} ',
                                ),
                                WidgetSpan(
                                    child: Icon(
                                  CupertinoIcons.chat_bubble_fill,
                                  size: 16,
                                  color: Colors.grey,
                                ))
                              ]),
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
