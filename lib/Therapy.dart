import 'package:flutter/material.dart';

class Therapy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Session of Psychotherapy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What happens in the first session of psychotherapy?',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://via.placeholder.com/400x200.png?text=Psychotherapy',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              _buildParagraph(context,
                  'It’s natural not to know what to expect in your first psychotherapy session.'),
              _buildParagraph(context,
                  'Rojas explains that during your first few sessions of individual therapy, a therapist may ask a series of personal questions.'),
              _buildQuote(context,
                  '“This is to understand you best, and that’s what therapy is – a personal journey that requires time, strength, and patience,” she explains.'),
              _buildParagraph(context,
                  'This is commonly known as a psychological assessment.'),
              _buildParagraph(context,
                  'You may also have questions for your therapist during these first few sessions.'),
              _buildParagraph(context,
                  'In general, it’s important to pay attention to how each session feels at first, says Rojas. “Notice if you’re feeling welcomed, accepted, validated, and understood. A therapist should work toward making you feel seen and heard.”'),
              _buildParagraph(context,
                  'Building a rapport with your therapist may or may not happen in the first or second session. Once rapport is built, however, you may feel reassured in your decision to start therapy, Rojas says.'),
              _buildParagraph(context,
                  'The therapeutic relationship is part of therapy and can make a world of difference in measuring your own progress toward meeting your mental health goals.'),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action for the button can be defined here
                  },
                  icon: Icon(Icons.info_outline),
                  label: Text('Learn More'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    textStyle: TextStyle(fontSize: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _buildQuote(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontStyle: FontStyle.italic),
      ),
    );
  }
}
