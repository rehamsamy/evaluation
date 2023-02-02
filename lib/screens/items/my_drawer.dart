import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:evaluation/screens/auth/view/auth_view.dart';
import 'package:evaluation/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: MediaQuery.of(context).size.width*0.8,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Container(
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(18)
              ),
              child: ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.home_filled),
                onTap: (){
                  pushAndRemoveUntil(const HomeView());
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
              ),
              child: ListTile(
                title: Text('Logout'),
                trailing: Icon(Icons.login_outlined),
                onTap: (){
                  pushAndRemoveUntil(const AuthView());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
