import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/widgets.dart';

import '../../models/Firebase/fire_auth.dart';

class FourthPage extends StatefulWidget {
  FourthPage() : super();

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? LoadingWidget()
        : Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150x150'),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProfileStatsWidget(
                                  number: '000',
                                  text: 'Posts',
                                ),
                                ProfileStatsWidget(
                                  number: '000',
                                  text: 'Followers',
                                ),
                                ProfileStatsWidget(
                                  number: '000',
                                  text: 'Following',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      FireAuth.getUserInfo(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Edit profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                          visualDensity:
                              VisualDensity(horizontal: -4.0, vertical: -1.0),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Share profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                          visualDensity:
                              VisualDensity(horizontal: -4.0, vertical: -1.0),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await FireAuth.signOut();
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        size: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                        visualDensity:
                            VisualDensity(horizontal: -4.0, vertical: -1.0),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class ProfileStatsWidget extends StatelessWidget {
  final String number;
  final String text;

  ProfileStatsWidget({@required this.number, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
