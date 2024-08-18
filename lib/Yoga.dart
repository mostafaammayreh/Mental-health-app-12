import 'package:flutter/material.dart';

class Yoga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Practices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yoga Practices',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://via.placeholder.com/400x200.png?text=Yoga+Practices',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              _buildParagraph(context,
                  'Yoga is an ancient system of physical, mental and spiritual practices that have been passed down through the generations from teacher to student. Yogic practices include breathing techniques, postures, relaxation, chanting, and other meditation methods. There are many different styles of yoga, each with their own unique focus and approach to creating a unitive state.'),
              _buildParagraph(context,
                  'Its origins are traced back thousands of years to the Upanishads, a collection of yogic texts dating from roughly 800 BC to 400 AD. While the word “yoga” was first mentioned in the Rigveda, but the first time it was used with its modern meaning is in the Katha Upanishad. This ancient spiritual text was written sometime between the 5th and 3rd century BCE.'),
              _buildParagraph(context,
                  'The Yoga Sutras is one of the most famous text on the fundamentals of yoga and was written by Patanjali around 200 BCE. In this foundational text, he defines yoga in sutra 1.2 as: yogash chitta-vritti-nirodhah. This translates as “Yoga is the cessation of the whirling fluctuations of the mind.”'),
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
}
