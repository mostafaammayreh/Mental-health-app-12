import 'package:flutter/material.dart';

class MentalIllness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Risk Factors for Mental Health Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Risk factors for mental health conditions',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://via.placeholder.com/400x200.png?text=Mental+Health',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              _buildParagraph(context,
                  'Everyone is at some risk of developing a mental health disorder, regardless of age, sex, income, or ethnicity. In the U.S. and much of the developed world, depression is one of the leading causesTrusted Source of disability.'),
              _buildParagraph(context,
                  'Social and financial circumstances, adverse childhood experiences, biological factors, and underlying medical conditions can allTrusted Source shape a person’s mental well-being.'),
              _buildParagraph(context,
                  'Many people with a mental health disorder have more than oneTrusted Source condition at the same time.'),
              _buildParagraph(context,
                  'It is important to note that mental well-being depends on a balance of factors, and several elements may contribute to the development of a mental health disorder.'),
              _buildParagraph(context,
                  'The following factors can contribute to mental health conditions.'),
              _buildSubheader(context, 'Socioeconomic pressure'),
              _buildParagraph(context,
                  'Having limited financial means or belonging to a marginalized ethnic group can increase the risk of mental health disorders as a result of biases in healthcare.'),
              _buildParagraph(context,
                  'A 2015 Iranian studyTrusted Source describes several socioeconomic causes of mental health conditions, including poverty and living on the outskirts of a large city.'),
              _buildParagraph(context,
                  'The researchers also described flexible (modifiable) and inflexible (nonmodifiable) factors that can affect the availability and quality of mental health care treatment for certain groups.'),
              _buildSubheader(context,
                  'Modifiable factors for mental health disorders include:'),
              _buildBulletList(context, [
                'socioeconomic conditions, such as whether work is available in a local area',
                'occupation',
                'a person’s level of social involvement',
                'education',
                'housing quality',
              ]),
              _buildSubheader(context, 'Nonmodifiable factors include:'),
              _buildBulletList(context, [
                'gender',
                'age',
                'ethnicity',
                'nationality',
              ]),
              _buildParagraph(context,
                  'The researchers found that being female increased the risk of low mental health status by nearly four times. People with a “weak economic status” scored highest for mental health conditions in this study.'),
              _buildSubheader(context, 'Childhood adversity'),
              _buildParagraph(context,
                  'Several studiesTrusted Source report that childhood traumas such as child abuse, parental loss, parental separation, and parental illness significantly affect a growing child’s mental and physical health.'),
              _buildParagraph(context,
                  'There are associations between childhood abuse and other adverse events and mental health disorders. These experiences also make people vulnerable to post-traumatic stress disorder (PTSD).'),
              _buildSubheader(context, 'Biological factors'),
              _buildParagraph(context,
                  'The NIMH suggests that a person’s family history can increase the likelihoodTrusted Source of mental health conditions, as specific genes and gene variants put a person at higher risk. However, having a gene associated with a mental health disorder does not guarantee that a condition will develop.'),
              _buildParagraph(context,
                  'Likewise, people without related genes or a family history of mental health conditions may have a mental health disorder.'),
              _buildParagraph(context,
                  'Chronic stress and mental health disorders such as depression and anxiety may develop due to underlying physical health problems, such as cancer, diabetes, and chronic pain.'),
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

  Widget _buildSubheader(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBulletList(BuildContext context, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) =>
                Text('• $item', style: Theme.of(context).textTheme.bodyText2))
            .toList(),
      ),
    );
  }
}
