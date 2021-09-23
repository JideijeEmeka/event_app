import 'package:event_app/screens/admin_login.dart';
import 'package:event_app/screens/check_in_users.dart';
import 'package:event_app/screens/events_page.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/screens/user_reg.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //     image: NetworkImage(
                    //         'https://avatars.githubusercontent.com/u/75017328?s=48&v=4'),
                    //     fit: BoxFit.fill)
                  ),
                ),
                Text(
                  'Event App',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Text(
                  'jideije.emeka@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Admin Login', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: Text('User Signup', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserReg()));
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.check_box),
            title: Text('Check In users', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckedIn()));
            },
          ),
        ],
      ),
    );
  }
}
