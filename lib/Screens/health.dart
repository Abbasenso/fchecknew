
import 'package:flutter/material.dart';


class Health extends StatefulWidget {

  final String title;

  const Health({
    @required this.title,
  });

  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("10 Health Tips"),
      backgroundColor: Colors.blue,
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildImageInteractionCard(),
        buildImageInteractionCard2(),
        buildImageInteractionCard3(),
        buildImageInteractionCard4(),
        buildImageInteractionCard5(),
        buildImageInteractionCard6(),
        buildImageInteractionCard7(),
        buildImageInteractionCard8(),
        buildImageInteractionCard9(),
        buildImageInteractionCard10(),

      ],
    ),
  );



  Widget buildImageInteractionCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.pexels.com/photos/890507/pexels-photo-890507.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Eat a healthy diet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
                'Eat a combination of different foods, including fruit, vegetables, legumes, nuts and whole grains. Adults should eat at least five portions (400g) of fruit'
                    ' and vegetables per day. You can improve your intake of fruits and vegetables by always including veggies in your meal;',
            style: TextStyle(fontSize: 17),
          ),
        ),
        SizedBox(height: 10,)
      ],
    ),

  );

  Widget buildImageInteractionCard2() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/19-vlcsnap-2019-06-07-10h12m40s630.tmb-1366v.jpg?sfvrsn=1b5752fa_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Prepare your food correctly',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'If you are preparing food, make sure you follow the Five Keys to Safer Food: (1) keep clean; (2) separate raw and cooked; '
                '(3) cook thoroughly; (4) keep food at safe temperatures; and (5) use safe water and raw materials.',
            style: TextStyle(fontSize: 17),
          ),

        ),
          SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard3() => Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: Column(
    children: [
      Stack(
        children: [
          Ink.image(
            image: NetworkImage(
              'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/3-who-056149-img.tmb-1366v.jpg?sfvrsn=c0dc2291_2',
            ),
            height: 150,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              'Reduce intake of harmful fats',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(10).copyWith(bottom: 0),
        child: Text(
          'Fats consumed should be less than 30% of your total energy intake. This will help prevent unhealthy weight gain and NCDs. '
              'There are different types of fats, but unsaturated fats are preferable over saturated fats and trans-fats. ',
          style: TextStyle(fontSize: 17),
        ),

      ),
      SizedBox(height: 10,)
    ],
  ),
);

Widget buildImageInteractionCard4() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/4-who-056030-img.tmb-1366v.jpg?sfvrsn=227d74e_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Avoid harmful use of alcohol',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'There is no safe level for drinking alcohol. Consuming alcohol can lead to health problems such as mental and behavioural disorders, including alcohol dependence, major NCDs such as liver cirrhosis, '
                'some cancers and heart diseases, as well as injuries resulting from violence and road clashes and collisions. ',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard5() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/5-f9-05052016-ph-03850-lr.tmb-1366v.jpg?sfvrsn=835b05bf_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Don’t smoke',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'Smoking tobacco causes NCDs such as lung disease, heart disease and stroke. Tobacco kills not only the direct smokers but even '
                'non-smokers through second-hand exposure. Currently, '
                'there are around 15.9 million Filipino adults who smoke tobacco but 7 in 10 smokers are interested or plan to quit. ',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard6() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/6-f2-300032016-ph-06573-lr.tmb-1366v.jpg?sfvrsn=f4bc39b4_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Be active',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'Physical activity is defined as any bodily movement produced by skeletal muscles that requires energy expenditure. This includes exercise and activities '
                'undertaken while working, playing, carrying out household chores, travelling, and engaging in recreational pursuits.  ',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard7() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/9-img-1210-lr.tmb-1366v.jpg?sfvrsn=10567f2d_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Get vaccinated',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'Vaccination is one of the most effective ways to prevent diseases. Vaccines work with your body’s natural defences to build protection against diseases like cervical cancer, cholera, diphtheria, '
                'hepatitis B, influenza, measles, mumps, pneumonia, polio, rabies, rubella, tetanus, typhoid, and yellow fever.',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard8() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/10-img-7965-lr.tmb-1366v.jpg?sfvrsn=77ee5ca_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Practice safe sex',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'Looking after your sexual health is important for your overall health and well-being. Practice safe sex to prevent '
                'HIV and other sexually transmitted infections like gonorrhoea and syphilis. There are available prevention measures such'
                'as pre-exposure prophylaxis (PrEP) that will protect you from HIV and condoms that will protect you from HIV and other STIs. ',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard9() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/14-mg-9033-lr.tmb-1366v.jpg?sfvrsn=eca64271_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Drink only safe water',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'Drinking unsafe water can lead to water-borne diseases such as cholera, diarrhoea, hepatitis A, typhoid and polio. '
                'Globally, at least 2 billion people use a drinking water source contaminated with faeces.'
                ' Check with your water concessionaire and water refilling station to ensure that the water you’re drinking is safe.  ',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

Widget buildImageInteractionCard10() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/16-mg-8143-lr.tmb-1366v.jpg?sfvrsn=1d58571b_2',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Talk to someone you trust if you are feeling down',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Text(
            'Depression is a common illness worldwide with over 260 million people affected. Depression can manifest in different ways,'
                ' but it might make you feel hopeless or worthless, or you might think about negative and disturbing thoughts a lot or have '
                'an overwhelming sense of pain. If you’re going through this, remember that you are not alone. '
                'Talk to someone you trust such as a family member, friend, colleague or mental health professional about how you feel. ',
            style: TextStyle(fontSize: 17),
          ),

        ),
        SizedBox(height: 10,)
      ],
    ),
  );

}