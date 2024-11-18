import 'package:flutter/material.dart';

class PageNotification extends StatefulWidget {
  const PageNotification({super.key});

  @override
  State<PageNotification> createState() => _PageNotificationState();
}

class _PageNotificationState extends State<PageNotification> {
  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(40.30),
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('Notificación 1'),
              subtitle: Text('This is a notification'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('Notification 2'),
              subtitle: Text('This is a notification'),
            ),
          ),
        ],
      ),
    );
  }
}
