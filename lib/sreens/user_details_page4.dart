import 'package:flutter/material.dart';
import 'package:iti_flutter/models/user.dart';
import 'package:iti_flutter/sreens/map.dart';
import 'package:iti_flutter/utils/utils.dart';
import 'package:iti_flutter/widget/card_design.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatelessWidget {
  User user;
  UserDetails(this.user);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardDesign(
                content: "Name: ${user.name}",
              ),
              CardDesign(
                content: "Company Name: ${user.company.name}",
              ),
              InkWell(
                child: CardDesign(
                  content: "Email: ${user.email}",
                ),
                onTap: () {
                  launchURL("mailto:${user.email}");
                },
              ),
              InkWell(
                child: CardDesign(
                  content: "Phone: ${user.phone}",
                ),
                onTap: () {
                  launchURL("tel:${user.phone}");
                },
              ),
              InkWell(
                child: CardDesign(
                  content: "Website: ${user.website}",
                ),
                onTap: () {
                  launchURL("https://${user.website}");
                },
              ),
              MaterialButton(
                  onPressed: (){
                    pushPage(context , MapSample(userLocation: user.address.geo,));

              }, child: Text('Go to map'))
            ],
          ),
        ),
      ),
    );
  }
}
