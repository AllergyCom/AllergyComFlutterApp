import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minip/Pages/MyhomePageWelcome.dart';
import 'package:minip/Widgets/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

enum Gender { male, female }

class _WelcomeState extends State<Welcome> {
  Gender _selectGender = Gender.male;
  int age = 0;
  int height = 2;
  int weight = 3;
  var pref = "";
  var genderEdit = '';
  var male1 = 'M';
  String Female = 'F';

  final keys = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    if (_selectGender == Gender.male) {
      male1 = "M";
    } else {
      Female = "F";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Form(
            key: keys,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to AllergyCom Assist Screen ",
                  style: GoogleFonts.aldrich(
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Palatino',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 0.2,
                        letterSpacing: 0.2,
                      ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height / 35,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_selectGender == Gender.male) {
                          genderEdit = "M";
                        } else {
                          genderEdit = "F";
                        }
                        setState(() {
                          _selectGender = Gender.male;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          color: _selectGender == Gender.male
                              ? ActiveColor
                              : InActiveColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                  image: AssetImage(
                                    'assets/icons8-collaborator-male-80.png',
                                  )),
                              Text('${this.male1}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_selectGender == Gender.female) {
                          genderEdit = "M";
                        } else {
                          genderEdit = "F";
                        }
                        setState(() {
                          _selectGender = Gender.female;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          color: _selectGender == Gender.female
                              ? ActiveColor
                              : InActiveColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                  image: AssetImage(
                                    'assets/icons8-pupil-female-64.png',
                                  )),
                              Text('${this.Female}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 35,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      this.age = int.parse(text);
                      setState(() {
                        print('${this.age.toString()}');
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: "Enter your Age : ",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                      labelText: "Age",
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      // contentPadding:
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 45,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      this.height = int.parse(text);
                      setState(() {
                        print('$text');
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                      hintText: "Enter your Height : ",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),

                      labelText: "Height",
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,

                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      // contentPadding:
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 45,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      this.weight = int.parse(text);
                      setState(() {
                        print('$text');
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                      hintText: "Enter your weight : ",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                      labelText: "weight",
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      // contentPadding:
                    ),
                  ),
                ),

                SizedBox(
                  height: height / 45,
                  width: double.infinity,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>MyhomePageWelcome(),
                      ),
                    );
                  },
                  color: Colors.deepPurple,
                  child: Text("submit" , style: TextStyle(color: Colors.white) ,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minWidth: width / 1.28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
