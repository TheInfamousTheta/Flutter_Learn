import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences prefs;
  var _loading = false;
  final _user_nameController = TextEditingController();
  final _full_nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _numberController = TextEditingController();
  final _DOBController = TextEditingController();
  final _profile_imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Initiate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                prefs.getString('profile_image') != null
                                    ? NetworkImage(
                                      prefs.getString('profile_image')!,
                                    )
                                    : AssetImage('lib/placeholders/Amogh.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(64, 0, 170, 0),
                      child: TextField(
                        controller: _user_nameController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: '@user_name *',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(64, 0, 100, 0),
                      child: TextField(
                        controller: _full_nameController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Full Name *',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: TextField(
                        controller: _mailController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'example@mail.com *',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: TextField(
                        controller: _numberController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Mobile No. *',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: TextField(
                        controller: _DOBController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Date Of Birth(DD/MM/YYYY) *',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(64, 0, 100, 0),
                      child: TextField(
                        controller: _profile_imageController,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Profile Image URL',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,70,0,0),
                      child: Text('* marked fields are required.',style: TextStyle(fontSize: 15,color: Colors.red),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          prefs.setString(
                            'user_name',
                            _user_nameController.text.toString(),
                          );
                          prefs.setString(
                            'full_name',
                            _full_nameController.text.toString(),
                          );
                          prefs.setString(
                            'mail',
                            _mailController.text.toString(),
                          );
                          prefs.setString(
                            'number',
                            _numberController.text.toString(),
                          );
                          prefs.setString(
                            'profile_image',
                            _profile_imageController.text.toString(),
                          );
                          prefs.setString(
                            'DOB',
                            _DOBController.text.toString(),
                          );
                          if (prefs.getString('user_name') == '' ||
                              prefs.getString('full_name') == '' ||
                              prefs.getString('mail') == '' ||
                              prefs.getString('number') == '' ||
                              prefs.getString('DOB') == '') {
                            _showAlert();
                          }
                          else{
                            prefs.setBool('loggedIn', true);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.black,
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        child: Text('Save'),
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

  void _showAlert() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Missing values'),
            content: Text('Please fill required textboxes'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },child: Text('Okay'),
              ),
            ],
          ),
    );
  }
}
