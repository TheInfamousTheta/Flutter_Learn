import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences prefs;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    Initiate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
              ),
              child: Image.asset('lib/icons/img.png', fit: BoxFit.cover),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'NewsApp',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),

                border: Border.all(color: Colors.black, width: 3),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 20,
                  weight: 99,
                ),
              ),
            ),
          ),
        ],
      ),
      body:
          _loading
              ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.black,
                  size: 100,
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                        child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(color: Colors.black, width: 1.3),
                          ),
                          child: CircleAvatar(
                            radius: 90,
                            backgroundImage:
                                prefs.getString('profile_image') != ''
                                    ? NetworkImage(
                                      prefs.getString('profile_image')!,
                                    )
                                    : AssetImage('lib/placeholders/Amogh.jpg'),
                          ),
                        ),
                      ),
                    ), //Profile Image
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(
                          prefs.getString('user_name') ==''? "@user_name":prefs.getString('user_name')!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text(
                          prefs.getString('full_name') ==''? "Full Name":prefs.getString('full_name')!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          prefs.getString('mail') ==''? 'example@mail.com':prefs.getString('mail')!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          prefs.getString('number') ==''? 'Mobile Number':prefs.getString('number')!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          prefs.getString('DOB') ==''? 'DD/MM/YYYY':prefs.getString('DOB')!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  void Initiate() async {
    _loading = true;
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _loading = false;
    });
  }
}
