import 'dart:convert'; //For JSON
import 'package:flutter/material.dart'; // Flutter material design widgets
import 'package:percent_indicator/circular_percent_indicator.dart'; //For displaying circular progress indicators.
import 'package:http/http.dart' as http; //For making HTTP requests

class QuizPage extends StatefulWidget {
  QuizPage(this.question, this.x, this.disorder, this.colors, {super.key});
  List<String> question;
  final String disorder;
  final int
      x; // intended for use in future features that are not yet implemented.
  final List<Color> colors;

  @override
  State<QuizPage> createState() => _QuizPageState();
} // It initializes the state by creating _QuizPageState // create instance

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:
            Question(widget.question, widget.x, widget.disorder, widget.colors),
      ),
    );
  }
}

class Question extends StatefulWidget {
  const Question(this.question, this.qno, this.disorder, this.colors,
      {super.key});
  final List<String> question;
  final int qno;
  final String disorder;
  final List<Color> colors;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int i = 0;
  bool over = false;
  int ans = 0;
  // Manages the quiz logic including the current question index (i), a boolean to check if the quiz is over (over),
  //and the number of correct answers (ans).
//---------------------------------------------
  // Future sendEmail(
  //     String name1, String name2, String message, String email) async {
  //   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  //   const serviceId = 'service_vc1tc92';
  //   const templateId = 'template_mak408l';
  //   const userId = 'C7ns8WoNqX9Ns9GvG';
  //   try {
  //     final response = await http.post(url,
  //         headers: {
  //           'origin': 'http:localhost',
  //           'Content-Type': 'application/json'
  //         },
  //         body: json.encode({
  //           'service_id': serviceId,
  //           'template_id': templateId,
  //           'user_id': userId,
  //           'template_params': {
  //             'from_name': name1,
  //             'to_name': name2,
  //             'message': message,
  //             'to_email': email,
  //           }
  //         }));
  //     return response.statusCode;
  //   } catch (e) {
  //     print("feedback email response");
  //   }
  // }
  //--------------------------
//   Defines the UI layout of the quiz.
// Uses a Column to layout the components vertically.
// The main UI components include:
// A Stack to position elements on top of each other.
// A Container with a gradient background showing the question or results.
// A Positioned widget to display the question or result text inside a styled Container.
// Buttons for answering "Yes" or "No" to the questions.
// A CircularPercentIndicator to visually display the quiz result.
//-----------------------------

// When the "Yes" or "No" button is pressed, the question index i is incremented,
// and the answer count ans is updated if "Yes" is chosen.
// When the last question is answered, the over flag is set to true, triggering the result display logic.

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: height / 2.5,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.colors),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
                child: Text(
                  over == false ? 'Questionaire' : 'Results',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Positioned(
              top: height / 5.5,
              child: Container(
                height: height * 0.5,
                width: width / 1.2,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        over == false
                            ? 'Question no - ${i + 1}'
                            : '------ Conclusion ------',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height / 30),
                      Text(
                        over == false
                            ? widget.question[i]
                            : ans == widget.qno
                                ? "you are having chances of suffering through ${widget.disorder}"
                                : ans >= widget.qno / 2
                                    ? "You have moderate chances of suffering through ${widget.disorder}"
                                    : "You have very low chances of suffering through ${widget.disorder}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      over == true
                          ? Container(
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                animationDuration: 600,
                                percent: ans == widget.qno
                                    ? 0.9
                                    : ans >= widget.qno / 2
                                        ? 0.6
                                        : 0.3,
                                center: Text(
                                  ans == widget.qno
                                      ? "High Risk"
                                      : ans >= widget.qno / 2
                                          ? "Moderate Risk"
                                          : "Low Risk",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: ans == widget.qno
                                    ? Colors.red
                                    : ans >= widget.qno / 2
                                        ? Colors.orange
                                        : Colors.green,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.35 * height),
        over == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 0.36 * width,
                    height: 0.08 * height,
                    child: ElevatedButton(
                      onPressed: () {
                        ans++;
                        setState(() {
                          i++;
                          if (i > widget.qno - 1) {
                            over = true;
                            String risk = ans == widget.qno
                                ? "High"
                                : ans >= widget.qno / 2
                                    ? "Moderate"
                                    : "Low";
                            // print(patientInfo.specialistContact);
                            // sendEmail(
                            //     patientInfo.name!,
                            //     patientInfo.specialistName!,
                            //     'Your patient has taken an ${widget.disorder} test. He/she has $risk risk of suffering through the disorder. Kindly share your advice on ${patientInfo.email} or contact him personally',
                            //     patientInfo.specialistContact!);
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget.colors[0].withOpacity(0.7)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.36 * width,
                    height: 0.08 * height,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          i++;
                          if (i > widget.qno - 1) {
                            over = true;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget.colors[1].withOpacity(0.8)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            : ans == widget.qno
                ? const Text(
                    'Please focus on yourself and give your self some time to meditate and relax;',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                : ans >= widget.qno / 2
                    ? const Text(
                        'Keep meditating regularly and eat healthy.\nYou are just few days away from perfect mental health',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        'Your health seems good enough.\nKeep it up!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
      ],
    );
  }
}
