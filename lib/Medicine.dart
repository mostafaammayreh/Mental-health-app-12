import 'package:flutter/material.dart';

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Medications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What are mental health medications?',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://via.placeholder.com/400x200.png?text=Mental+Health+Medications',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              _buildParagraph(context,
                  'Medications can play an important role in treating mental disorders and conditions. They are often used in combination with other treatments, such as psychotherapy and brain stimulation therapy. Medications can affect people in different ways, and it may take several tries to find the medication that works best with the fewest side effects. It’s important to work with a health care provider or a mental health professional to develop a treatment plan that meets your individual needs and medical situation.'),
              _buildParagraph(context,
                  'Information about medications is updated frequently. The U.S. Food and Drug Administration (FDA) has Medication Guides with the latest information, warnings, and approved medications. MedlinePlus also provides information on drugs, herbs, and supplements, including side effects and warnings.'),
              _buildParagraph(context,
                  'This page provides basic information on mental health medications. It is not a complete source for all medications available. It should not be used as a guide when making medical decisions.'),
              SizedBox(height: 16.0),
              Text(
                'What are antidepressants?',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 8.0),
              _buildParagraph(context,
                  'Antidepressants are medications used to treat depression. In some cases, health care providers may prescribe antidepressants to treat other health conditions, such as anxiety, pain, and insomnia.'),
              _buildSubheader(
                  context, 'Commonly prescribed types of antidepressants are:'),
              _buildBulletList(context, [
                'Selective serotonin reuptake inhibitors (SSRIs)',
                'Serotonin-norepinephrine reuptake inhibitors (SNRIs)',
                'Norepinephrine-dopamine reuptake inhibitors (NDRIs)',
              ]),
              _buildParagraph(context,
                  'These medications are commonly prescribed because they improve the symptoms of a broad group of depressive and anxiety disorders. They are also associated with fewer side effects than older antidepressants. Although older antidepressants, such as tricyclics and monoamine oxidase inhibitors (MAOIs), are associated with more side effects, they may be the best option for some people.'),
              _buildParagraph(context,
                  'Antidepressants take time—usually 4−8 weeks—to work, and problems with sleep, appetite, energy, and concentration often improve before mood lifts. Giving a medication a chance to work is important before deciding whether it is right for you.'),
              _buildParagraph(context,
                  'Common side effects of SSRIs and other antidepressants include upset stomach, headache, or sexual dysfunction. The side effects are generally mild and tend to go away with time. People who are sensitive to the side effects of these medications sometimes benefit from starting with a low dose, increasing the daily dose very slowly, and changing when or how they take the medication (for example, at bedtime or with food).'),
              _buildParagraph(context,
                  'Esketamine is an FDA-approved medication for treatment-resistant depression, which may be diagnosed when a person’s symptoms do not improve after trying at least two antidepressants. Esketamine is delivered as a nasal spray in a health care provider’s office, a clinic, or a hospital. It often acts rapidly, typically within a couple of hours, to relieve depression symptoms. People usually continue to take an oral antidepressant to maintain the improvement in their symptoms.'),
              _buildParagraph(context,
                  'Combining antidepressants with other medications or supplements that act on the serotonin system, such as triptans (often used to treat migraine headaches) and St. John’s wort (a dietary supplement), can cause a rare but life-threatening illness called serotonin syndrome. Symptoms of serotonin syndrome include agitation, muscle twitches, hallucinations (seeing or hearing things others do not see or hear), high temperature, and unusual blood pressure changes. For most people, the risk of such extreme reactions is low. It is important for health care providers to consider all possible interactions and use extra care in prescribing and monitoring medication combinations that have an above-average risk.'),
              _buildParagraph(context,
                  'Note: In some cases, children, teenagers, and young adults under 25 may experience an increase in suicidal thoughts or behavior when taking antidepressants, especially in the first few weeks after starting the medication or when the dose is changed. People of all ages taking antidepressants should be watched closely, especially during the first few weeks of treatment.'),
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
