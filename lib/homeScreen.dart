import 'package:exam/provider/home.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Data ob = Data();

  List<Widget> myAnsswer = [];
  int sum = 0;

  void checkAnswer(bool yourAns) {
    if (yourAns == ob.getAnswer()) {
      sum++;
      myAnsswer.add(Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.thumb_up,
          color: Colors.greenAccent,
        ),
      ));
    } else {
      myAnsswer.add(Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.thumb_down,
          color: Colors.red,
        ),
      ));
    }
    if (ob.isFinished() == true) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "لقد تم الانتهاء من الامتحان",
        desc: " لقد حققت ${sum} من 7 اسئله",
        buttons: [
          DialogButton(
            child: Text(
              "إعادة الامتحان",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
      myAnsswer = [];
      sum = 0;
      ob.Reset();
    } else {
      ob.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E5tibar'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: myAnsswer,
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Image.asset(ob.getImage()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ob.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.indigo,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              checkAnswer(true);
                            });
                          },
                          child: const Text(
                            'صح',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      color: Colors.deepOrange,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              checkAnswer(false);
                            });
                          },
                          child: const Text(
                            'خطأ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
