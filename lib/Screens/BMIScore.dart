import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:fchecknew/Screens/BodyCondition.dart';
import 'package:fchecknew/Screens/drawer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'MyHome.dart';
import 'package:http/http.dart' as http;

class BMIScore extends StatefulWidget {
  String na;
  String he;
  double bmi;
  double a;
  String hei;
  double w;
  String g;
  //List sc;
  BMIScore(n,h,b,ag,myheight,we,ge,){
    na=n;
    he=h;
    bmi=b;
    a=ag;
    hei=myheight;
    w=we;
    g=ge;
    //sc=l;

  }
  @override
  _BMIScoreState createState() => _BMIScoreState();
}

class _BMIScoreState extends State<BMIScore> {

  getDate(){
     final DateTime now = DateTime. now();
     final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter. format(now);
    return formatted;
  }

  getResult(){
    String rehealth=widget.he;
    if(rehealth=="UNDER WEIGHT"){
      return ["can lead to problems such as Osteoporosis (Brittle Bones), Skin, Hair and Teeth issues. You are at risk to develop Brain, Liver and Heart problems if you fail to provide the right and adequate amount of Proteins, Vitamins, Carbohydrates and Minerals to your body.",
        "Family History, High Rate of Metabolism, High Level of Physical activity, Chronic Diseases, Diabetes, Thyroid and digestive conditions, mental depression and Anxiety or maybe consumption of alcohol or smoking cigarette.",
        "For overcoming the situation please follow a nutritional food system and healthy lifestyle. For remedial process and consultation please speak to your Feonnaa Consultants or Feonnaa Doctors. Strictly avoid alcohol and smoking.",
        [44,41,40,42,45,43,41,47]
      ];
    }
    else if(rehealth=="NEAR UNDERWEIGHT"){
      return ["can lead to various problems and put you at risk to develop Liver and Heart problems. If you fail to provide the right and adequate amount of Proteins, Vitamins, Carbohydrates and Minerals to your body the organs will dysfunction and create major health issues.",
      "The issue could be caused due to High Rate of Metabolism, High Level of Physical activity, Chronic Diseases, Diabetes, Thyroid and digestive problems or maybe consumption of alcohol or smoking cigarette.",
      " For overcoming the situation please follow a nutritional food system and healthy lifestyle. For remedial process and consultation please speak to your Feonnaa Consultants or Feonnaa Doctors. Please avoid alcohol and smoking.",
        [78,80,79,85,83,82,80,84]
      ];
    }
    else if(rehealth=="HEALTHY"){
      return ["Weight suggests a Healthy body condition but need to maintain a healthy daily lifestyle and food habits. Provide your body with right amount of nutrients on daily basis.",
      "None analysed.",
      "Maintain a healthy lifestyle and nutritional food practice. Follow a good exercise routine or regular yoga.",
        [88,90,89,95,93,92,90,94]
      ];
    }
    else if(rehealth=="NEAR OVERWEIGHT"){
      return ["a healthy body condition but can put you at risk to develop Heart, Kidney and Lung problems. Maintain a continuous check on your food habits and your lifestyle.",
      "The issue could be caused due to Slower Rate of Metabolism, Less Physical activity, maybe Chronic Diseases, Diabetes, Thyroid and digestive problems.",
      "For overcoming the situation please follow a nutritional food system and healthy lifestyle. For remedial process and consultation please speak to your Feonnaa Consultants or Feonnaa Doctors.",
        [78,80,79,85,83,82,80,84]
      ];
    }
    else if(rehealth=="OVER WEIGHT"){
      return ["can lead to serious problems related to Liver, Kidney, and Heart or even intestines. It is best suggested that you immediately perform further pathological tests in order to avoid increase of any acute illness related to internal organs.",
      "The issue could be caused due to slow Rate of Metabolism, No Physical activity, Chronic Diseases, Diabetes, Thyroid and digestive problems.",
      "For overcoming the situation please follow a nutritional food system and healthy lifestyle. For remedial process and consultation please speak to your Feonnaa Consultants or Feonnaa Doctors.",
        [52,50,55,54,51,55,53,56]
      ];
    }
    else if(rehealth=="OBESE"){
      return ["is a challenging and a difficult health condition that can lead to serious problems related to Liver, Kidney, and Heart and other internal organs. It is best suggested that you immediately perform further pathological tests in order to avoid increase of any acute illness related to internal organs.",
      "The issue could be caused due to slow Rate of Metabolism, No Physical activity, Chronic Diseases, Diabetes, Thyroid and digestive problems.",
      "For overcoming the situation please follow a nutritional food system and healthy lifestyle. For remedial process and consultation please speak to your Feonnaa Consultants or Feonnaa Doctors.",
        [44,41,40,42,45,43,41,47]
      ];
    }
  }

// File file;
//   String path;
//   Future<void> _createPDF() async {
//     String name=widget.na;
//     String health=widget.he;
//     double bmiScore=widget.bmi;
//     //Create a PDF document.
//     PdfDocument document = PdfDocument();
//     PdfPage page = document.pages.add();
//     PdfGraphics graphics = page.graphics;
//     //Add page and draw text to the page.
//     PdfStringFormat drawFormat = new PdfStringFormat();
//     drawFormat.wordWrap = PdfWordWrapType.word;
//     drawFormat.alignment = PdfTextAlignment.justify;
//     drawFormat.lineAlignment = PdfVerticalAlignment.top;
//
// //Set the font.
//     PdfFont font = new PdfStandardFont(PdfFontFamily.helvetica, 10);
//
// //Create a solid brush.
//    // PdfBrush brush = new PdfSolidBrush(new PdfColor(Colors.teal));
//    // RectangleF bounds = new RectangleF(new PointF(10, 10), new Size(page.graphics.clientSize.width - 30, page.graphics.clientSize.height - 20));
//
// // Draw the string one after another.
//     graphics.drawString('$name', PdfStandardFont(PdfFontFamily.helvetica, 18),
//         brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//         bounds: Rect.fromLTWH(0, 0, 500, 30),);
//     // graphics.drawString('hello', PdfStandardFont(PdfFontFamily.helvetica, 18),
//     //     brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//     //     bounds: Rect.fromLTWH(0, 0, 500, 30),
//     //     );
//
//
//     //Save the document
//     var bytes = document.save();
//     // Dispose the document
//     document.dispose();
//     //Get external storage directory
//     Directory directory = (await getExternalStorageDirectory());
// //Get directory path
//      path =directory.path;
// //Create an empty file to write PDF data
//     file=File('$path/$name.pdf');
// //Write PDF data
//     await file.writeAsBytes(bytes,flush:true);
// //Open the PDF document in mobile
//     OpenFile.open('$path/$name.pdf');
//     PdfGrid getGrid() {
//       //Create a PDF grid
//       final PdfGrid grid = PdfGrid();
//       //Secify the columns count to the grid.
//       grid.columns.add(count: 5);
//     }
//   }
//
//
//   Future<void> _sharePDF() async {
//     String name=widget.na;
//     try {
//       final ByteData bytes = await rootBundle.load('assets/$path/$name.pdf');
//       await Share.file(
//           '$name', '$name.pdf', bytes.buffer.asUint8List(), 'text/pdf');
//     } catch (e) {
//       print('error: $e');
//     }
//   }

  File file;
  String path;
  String pimage;
  String proposal;
  Future<void> _createPDF() async {
    //String pimage=getImage();
    List scorelist1=getResult();
    int st=scorelist1[3][0];
    int he=scorelist1[3][1];
    int br=scorelist1[3][2];
    int li=scorelist1[3][3];
    int lar=scorelist1[3][4];
    int ins=scorelist1[3][5];
    int lu=scorelist1[3][6];
    int ki=scorelist1[3][7];

    String name=widget.na;
    String health=widget.he;
    double bmiScore=widget.bmi;
    double age=widget.a;
    String height=widget.hei;
    double weight=widget.w;
    String gender=widget.g;

    //Create a PDF document.
    PdfDocument document = PdfDocument();
    PdfPage page = document.pages.add();
    PdfGraphics graphics = page.graphics;
    //Add page and draw text to the page.
    PdfStringFormat drawFormat = new PdfStringFormat();
    drawFormat.wordWrap = PdfWordWrapType.word;
    drawFormat.alignment = PdfTextAlignment.right;
    drawFormat.lineAlignment = PdfVerticalAlignment.top;
    drawFormat.lineLimit=false;
    drawFormat.lineSpacing=2.0;

//Set the font.
    //PdfFont font = new PdfStandardFont(PdfFontFamily.helvetica, 50);

//Create a solid brush.
    // PdfBrush brush = new PdfSolidBrush(new PdfColor(Colors.teal));
    // RectangleF bounds = new RectangleF(new PointF(10, 10), new Size(page.graphics.clientSize.width - 30, page.graphics.clientSize.height - 20));
    //PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);
    graphics.drawImage(PdfBitmap(await _readImageData_logo('feonnaa_logo.png')),
             Rect.fromLTWH(page.getClientSize().width/1.18, 0, page.getClientSize().width/9, page.getClientSize().height/14));

    graphics.drawString("FEONNAA", PdfStandardFont(PdfFontFamily.timesRoman, 15,style: PdfFontStyle.bold),
            //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.darkGreen,
             bounds: Rect.fromLTWH(0, 45, page.getClientSize().width, page.getClientSize().height),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.leftToRight,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 10
        ),
    );
    String text = 'BODY ANALYSIS REPORT';
    graphics.drawString("$text", PdfStandardFont(PdfFontFamily.timesRoman, 28,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 70, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.center,
          paragraphIndent: 10
      ),
    );
   graphics.drawRectangle(
       brush: PdfBrushes.cyan,
       bounds: Rect.fromLTWH(0, 100, page.getClientSize().width, 5)
   );
    final PdfGrid grid = PdfGrid();
// Specify the grid column count.
    grid.columns.add(count: 2);
// Add rows to the grid.
    PdfGridRow row0 = grid.rows.add();
    row0.cells[0].value = ' NAME- ${name.toUpperCase()}';
    row0.cells[1].value = ' AGE- $age';
    row0.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
// Add next row.
    PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = ' HEIGHT- $height cm';
    row1.cells[1].value = ' WEIGHT- $weight kg';
    row1.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);

    PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = ' GENDER- $gender';
    row2.cells[1].value = ' BMI- ${bmiScore.toStringAsFixed(1)}';
    row2.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);

// Set grid format.
    //grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
// Draw table in the PDF page.
    grid.draw(
        page: page,
        bounds: Rect.fromLTWH(
            0, 120, page.getClientSize().width, page.getClientSize().height));

    graphics.drawImage(PdfBitmap(await _readImageData0('$pimage')),
        Rect.fromLTWH(page.getClientSize().width/4.26, 215, page.getClientSize().width/2, page.getClientSize().height/6));
    graphics.drawString("$health(${bmiScore.toStringAsFixed(1)})", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.red,
      bounds: Rect.fromLTWH(0, 350, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.center,
          paragraphIndent: 10
      ),
    );
    graphics.drawRectangle(
        brush: PdfBrushes.yellow,
        bounds: Rect.fromLTWH(0, 475, 40, 15)
    );
    graphics.drawRectangle(
        brush: PdfBrushes.yellow,
        bounds: Rect.fromLTWH(180, 475, 200, 15)
    );
    String text1="BMI is a measurement of a person's leanness or corpulence based on their height and weight, and is intended to quantify tissue mass. It is widely used as a general indicator of whether a person has a healthy body weight for their height. Your BMI is ${bmiScore.toStringAsFixed(1)} It Shows You are $health.";
    graphics.drawString("$text1", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 380, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          paragraphIndent: 10
      ),
    );

    graphics.drawString("Organ Working Functionality-", PdfStandardFont(PdfFontFamily.helvetica, 22,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(0,0,0)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 500, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          //alignment: PdfTextAlignment.center,
          paragraphIndent: 10
      ),
    );

    final PdfGrid grid1=PdfGrid();
    grid1.columns.add(count:3);
    final PdfGridRow headerRow1 = grid1.headers.add(1)[0];
    headerRow1.cells[0].value = '       ORGANS';
    headerRow1.cells[1].value = '          NAME';
    headerRow1.cells[2].value = '     CONDITION';
// Set header font.
    headerRow1.style.font =
        PdfStandardFont(PdfFontFamily.helvetica, 20, style: PdfFontStyle.bold);
    //headerRow1.height=10;

    PdfGridRow row3 = grid1.rows.add();
    row3.cells[0].value = ' ';
    row3.cells[1].value = '           Stomach';
    row3.cells[2].value = '             $st%';
    row3.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row3.height=50;
    graphics.drawImage(PdfBitmap(await _readImageData('1.png')),
        Rect.fromLTWH(60, 562, page.getClientSize().width/10, page.getClientSize().height/18));

    PdfGridRow row4 = grid1.rows.add();
    row4.cells[0].value = '';
    row4.cells[1].value = '             Heart';
    row4.cells[2].value = '             $he%';
    row4.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row4.height=50;
    graphics.drawImage(PdfBitmap(await _readImageData('2.png')),
        Rect.fromLTWH(60, 612, page.getClientSize().width/10, page.getClientSize().height/18));

    PdfGridRow row5 = grid1.rows.add();
    row5.cells[0].value = '';
    row5.cells[1].value = '             Brain';
    row5.cells[2].value = '             $br%';
    row5.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row5.height=50;
    graphics.drawImage(PdfBitmap(await _readImageData('3.png')),
        Rect.fromLTWH(60, 662, page.getClientSize().width/10, page.getClientSize().height/18));

    PdfGridRow row6 = grid1.rows.add();
    row6.cells[0].value = '';
    row6.cells[1].value = '              Liver';
    row6.cells[2].value = '             $li%';
    row6.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row6.height=50;
    graphics.drawImage(PdfBitmap(await _readImageData('4.png')),
        Rect.fromLTWH(60, 712, page.getClientSize().width/10, page.getClientSize().height/18));


    grid1.draw(
        page: page,
        bounds: Rect.fromLTWH(
            0, 532, page.getClientSize().width, page.getClientSize().height));

    PdfPage page1 = document.pages.add();
    PdfGraphics graphics1 = page1.graphics;

    graphics1.drawImage(PdfBitmap(await _readImageData_logo('feonnaa_logo.png')),
        Rect.fromLTWH(page1.getClientSize().width/1.18, 0, page1.getClientSize().width/9, page1.getClientSize().height/14));

    graphics1.drawString("FEONNAA", PdfStandardFont(PdfFontFamily.timesRoman, 15,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.darkGreen,
      bounds: Rect.fromLTWH(0, 45, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.right,
          paragraphIndent: 10
      ),
    );

    final PdfGrid grid2=PdfGrid();
    grid2.columns.add(count:3);
    PdfGridRow row7 = grid2.rows.add();
    row7.cells[0].value = ' ';
    row7.cells[1].value = '    Large Intenstine';
    row7.cells[2].value = '             $lar%';
    row7.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row7.height=50;
    graphics1.drawImage(PdfBitmap(await _readImageData('5.png')),
        Rect.fromLTWH(60, 75, page1.getClientSize().width/12, page1.getClientSize().height/18));

    PdfGridRow row8 = grid2.rows.add();
    row8.cells[0].value = ' ';
    row8.cells[1].value = '         Intenstine';
    row8.cells[2].value = '             $ins%';
    row8.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row8.height=50;
    graphics1.drawImage(PdfBitmap(await _readImageData('6.png')),
        Rect.fromLTWH(55, 125, page1.getClientSize().width/10, page1.getClientSize().height/17));

    PdfGridRow row9 = grid2.rows.add();
    row9.cells[0].value = ' ';
    row9.cells[1].value = '           Lungs';
    row9.cells[2].value = '             $lu%';
    row9.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row9.height=50;
    graphics1.drawImage(PdfBitmap(await _readImageData('7.png')),
        Rect.fromLTWH(55, 175, page1.getClientSize().width/10, page1.getClientSize().height/17));

    PdfGridRow row10 = grid2.rows.add();
    row10.cells[0].value = '';
    row10.cells[1].value = '           Kidney';
    row10.cells[2].value = '             $ki%';
    row10.style.font=PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    row10.height=50;
    graphics1.drawImage(PdfBitmap(await _readImageData('8.png')),
        Rect.fromLTWH(60, 225, page1.getClientSize().width/12, page1.getClientSize().height/18));

    grid2.draw(
        page: page1,
        bounds: Rect.fromLTWH(
            0, 70, page1.getClientSize().width, page1.getClientSize().height));

    graphics1.drawString("Note-", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 310, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.left,
          paragraphIndent: 10
      ),
    );
    graphics1.drawString("$proposal", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(120, 310, 395, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          paragraphIndent: 10
      ),
    );

    graphics1.drawString("Challenges-", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 530, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.left,
          paragraphIndent: 10
      ),
    );
    graphics1.drawString("$challengs", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(120, 530, 395, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          //paragraphIndent: 10
      ),
    );



PdfPage page2=document.pages.add();
PdfGraphics graphics2= page2.graphics;
    graphics2.drawImage(PdfBitmap(await _readImageData_logo('feonnaa_logo.png')),
        Rect.fromLTWH(page2.getClientSize().width/1.18, 0, page2.getClientSize().width/9, page2.getClientSize().height/14));

    graphics2.drawString("FEONNAA", PdfStandardFont(PdfFontFamily.timesRoman, 15,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.darkGreen,
      bounds: Rect.fromLTWH(0, 45, page2.getClientSize().width, page2.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.right,
          paragraphIndent: 10
      ),
    );

    graphics2.drawString("Solutions-", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 70, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.left,
          paragraphIndent: 10
      ),
    );
    graphics2.drawString("$solution", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(120, 70, 395, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          //paragraphIndent: 10
      ),
    );

    graphics2.drawString("Food-", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 230, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.left,
          //paragraphIndent: 10
      ),
    );
    graphics2.drawString("$food", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(120, 230, 395, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          //paragraphIndent: 10
      ),
    );



    graphics2.drawString("Exercise-", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0,380, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.left,
          //paragraphIndent: 10
      ),
    );
    graphics2.drawString("$exercise", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(120, 380, 395, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          //paragraphIndent: 10
      ),
    );

    graphics2.drawString("Suppliments-", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0,460, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.left,
          //paragraphIndent: 10
      ),
    );
    graphics2.drawString("$n_sup", PdfStandardFont(PdfFontFamily.timesRoman, 20,),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(120, 460, 395, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          //paragraphIndent: 10
      ),
    );




    graphics2.drawRectangle(
        brush: PdfBrushes.darkRed,
        bounds: Rect.fromLTWH(0, 615, page.getClientSize().width, 135)

    );
    String text3="Feonnaapathy recommend you a healthy life style and to maintain a balance of your physical and mental health.Have proper Feonnaapathy diet and lifestyle program and for more detail you can contact to your advisors.";

    graphics2.drawString("$text3", PdfStandardFont(PdfFontFamily.timesRoman, 20,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(10,623, page1.getClientSize().width-20, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          //paragraphIndent: 10
      ),
    );


   PdfPage page3=document.pages.add();
   PdfGraphics graphics3=page3.graphics;
    graphics3.drawImage(PdfBitmap(await _readImageData_logo('feonnaa_logo.png')),
        Rect.fromLTWH(page1.getClientSize().width/1.18, 0, page1.getClientSize().width/9, page1.getClientSize().height/14));

    graphics3.drawString("FEONNAA", PdfStandardFont(PdfFontFamily.timesRoman, 15,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.darkGreen,
      bounds: Rect.fromLTWH(0, 45, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.right,
          paragraphIndent: 10
      ),
    );

    graphics3.drawString("Everyday Feonnaa Pathy Food Pattern", PdfStandardFont(PdfFontFamily.timesRoman, 23,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(10,70, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.center,
          paragraphIndent: 10
      ),
    );



    final PdfGrid grid4=PdfGrid();
    grid4.columns.add(count:2);
    PdfGridRow row11 = grid4.rows.add();
    row11.cells[0].value = ' Body Weight Wise.';
    row11.cells[1].value = ' 60 kg.';
    row11.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20, );
    //row11.height=50;

    PdfGridRow row12 = grid4.rows.add();
    row12.cells[0].value = ' Citrus Fruits Any.';
    row12.cells[1].value = ' 2pcs Mosambi Juice or\n Amla or Lamon.';
    row12.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20,);

    PdfGridRow row13 = grid4.rows.add();
    row13.cells[0].value = ' Breakfast\n Seasonal Fruits(2-3 types).';
    row13.cells[1].value = ' 600 grams Fruits after\n pealing off.';
    row13.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20, );

    PdfGridRow row14 = grid4.rows.add();
    row14.cells[0].value = ' Everyday Any Green Leaf\n Juice.';
    row14.cells[1].value = ' 30 grams Green Leaf Juice\n (Coriender,Mint,Gourd\n Spinach)Leaves.';
    row14.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20, );

    PdfGridRow row15 = grid4.rows.add();
    row15.cells[0].value = ' Lunch\n (Seasonal Vegetable).';
    row15.cells[1].value = ' 1. Green Vegetable Salad\n 2. Cooked Vegetarian Food\n     As per Requirement 600\n     grams or Composite Roti\n     Sabji.';
    row15.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20, );


    PdfGridRow row16 = grid4.rows.add();
    row16.cells[0].value = ' Evening\n (Snacks,Sprouting,Bean\n Nut & Coconut.)';
    row16.cells[1].value = ' 600 gm. Sprouts,Vegetable\n Salad,With Pup Rice,com\n etc.';
    row16.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20, );

    PdfGridRow row17 = grid4.rows.add();
    row17.cells[0].value = ' Dinner\n Seasonable Vegetables\n (Raw or Light Boiled).';
    row17.cells[1].value = ' 600 gm. Vegetables As Per\n Requirement or Composite\n Roti Sabji.';
    row17.style.font=PdfStandardFont(PdfFontFamily.helvetica, 20, );



    grid4.draw(
        page: page3,
        bounds: Rect.fromLTWH(
            0, 110, page3.getClientSize().width, page3.getClientSize().height));

    graphics3.drawString("* Everyday 30 min. FeonnaaPathy Phisical Training.", PdfStandardFont(PdfFontFamily.timesRoman, 18,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 600, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          paragraphIndent: 10
      ),
    );
    graphics3.drawString("* Food Quantity Should Increase or Decrease As Proportionate\n  To His/Her Body Weight.", PdfStandardFont(PdfFontFamily.timesRoman, 18,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 630, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          paragraphIndent: 10
      ),
    );

    graphics3.drawRectangle(
        brush: PdfBrushes.cyan,
        bounds: Rect.fromLTWH(0, 710, page3.getClientSize().width, 3)
    );

    graphics3.drawString("This Report is on the basis of WHO recommended BMI Parameter. It provides your present health status and challenges and guide you to maintain and prevent yourself from metabolic syndromes.", PdfStandardFont(PdfFontFamily.timesRoman, 12,style: PdfFontStyle.bold),
      //brush: PdfSolidBrush(PdfColor(100,100,100)),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(0, 720, page1.getClientSize().width, page1.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.leftToRight,
          alignment: PdfTextAlignment.justify,
          paragraphIndent: 10
      ),
    );





    //Save the document
    var bytes = document.save();
    // Dispose the document
    document.dispose();
    //Get external storage directory
    Directory directory = (await getExternalStorageDirectory());
//Get directory path
    path =directory.path;
//Create an empty file to write PDF data
    file=File('$path/$name.pdf');
//Write PDF data
    await file.writeAsBytes(bytes,flush:true);
//Open the PDF document in mobile
    OpenFile.open('$path/$name.pdf');
  }

  var _userData2=[];
  dynamic fetchData() async {
    final url="https://feonnaaherbals.com/fcheck_backend/fcheck_report.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      //print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }
  String challengs;
  String food;
  String exercise;
  String solution;
  String n_sup;

  setData(){
    String helth1=widget.he;
    var i=0;
    for(i;i<_userData2.length;i++){
      if(helth1=="${_userData2[i]["bmi"]}"){
        setState(() {
          challengs="${_userData2[i]["challenges"]}";
          food="${_userData2[i]["food"]}";
          exercise="${_userData2[i]["exercise"]}";
          solution="${_userData2[i]["solutions"]}";
          n_sup="${_userData2[i]["nutrition_suppliment"]}";
        });

      }
    }
  }

  Future<List<int>> _readImageData_logo(String name) async {
    final ByteData data = await rootBundle.load('image_report/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
  Future<List<int>> _readImageData0(String name) async {
    final ByteData data = await rootBundle.load('$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
  Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('image_report/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
   getImage(){
    String health=widget.he;
    if(health=="UNDER WEIGHT") {
      setState(() {
        pimage="images/unw_im.png";
      });
    }
    else if(health=="NEAR UNDERWEIGHT") {
    setState(() {
      pimage="images/nunw_im.png";
    });
    }
    else if(health=="HEALTHY") {
      setState(() {
        pimage="images/hel_im.png";
      });
    }
    else if(health=="NEAR OVERWEIGHT") {
      setState(() {
        pimage="images/novw_im.png";
      });
    }
    else if(health=="OVER WEIGHT"){
      setState(() {
        pimage="images/ovw_im.png";
      });
    }
    else {
      setState(() {
        pimage="images/obes_im.png";
      });
    }
  }
  getProposal(){
    String health=widget.he;
    if(health=="HEALTHY"){
      setState(() {
        proposal="Congratulations!!!  On the basis of your Body Organ Scan and WHO recommended BMI indicator.  Your Vital organs viability and functionality are smooth. You have to maintain your organs  viability and functionality smooth  to avoid major Metabolic syndromes.";
      });

    }
    else{
      setState(() {
        proposal="On the basis of your Body Organ Scan and WHO recommended BMI indicator.  Your Vital organs viability and functionality effected and it may cause Metabolic syndromes.  You can improve your vital Organs viability and functionality by change in your lifestyle, Health Exercises andhealthy food habits. you canalso control and avoid major Metabolic syndromes.";
      });
    }
  }



  Future<void> _sharePDF() async {
    String name=widget.na;
    try {
      final ByteData bytes = await rootBundle.load('assets/$path/$name.pdf');
      await Share.file(
          '$name', '$name.pdf', bytes.buffer.asUint8List(), 'text/pdf');
    } catch (e) {
      print('error: $e');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getImage();
   getProposal();
    fetchData().then((value) {
      //debugPrint('type-->$value');
      setState(() {
        _userData2=value;
      });
      setData();
      //print(_userData2);

      // do functions requiring value parameter
    });

  }

  @override
  Widget build(BuildContext context) {
    //_createPDF();
    print('$_userData2');
    print('$challengs');
    List b=getResult();
    String rf=b[0];
    String c=b[1];
    String t=b[2];
    //var pdfImage=b[3];
    String name=widget.na;
    String health=widget.he;
    double bmiScore=widget.bmi;
    String date=getDate();
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 13, 45, .7),

      appBar: AppBar(
        //leading: Container(
        //),
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(21, 13, 45, .4),
        //shadowColor: Colors.black54,
        elevation: 20,
        title: Text("YOUR BMI SCORE"),
        centerTitle: true,
      ),

      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //height: MediaQuery.of(context).size.height*.3,
                //width: MediaQuery.of(context).size.width*1,
                //color: Colors.yellow,
                child: Stack(children: [
                  Center(child: Image(image: AssetImage("images/colors.png"),fit: BoxFit.cover,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Center(child: Text("NAME:"+ " ""$name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                      SizedBox(height: 15,),
                      Text("BMI SCORE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize:25,letterSpacing: .05),),
                      Text("${bmiScore.toStringAsFixed(1)}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:45),),
                      Container(
                        height: MediaQuery.of(context).size.height*0.03,
                        width: MediaQuery.of(context).size.width*0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.yellowAccent
                        ),
                        child: Center(
                          child: Text("Report Generated:"+" "+"$date"),
                        ),
                      ),
                    ],
                  )
                ]
                ),
              ),
              Center(child: Text("RESULT:",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              SizedBox(height: 5,),
              Text("As per BMI Calculations, Your Health\nis Categorized As -",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              Container(
                //height: MediaQuery.of(context).size.height*0.04,
                //width: MediaQuery.of(context).size.width*0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.yellowAccent
                ),
                child: Center(
                  child: Text("$health",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w900)),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                //height: MediaQuery.of(context).size.height*0.90,
                width: MediaQuery.of(context).size.width*0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                   color: Color.fromRGBO(21, 13, 45, .2)
                  //color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Center(child: Text("Risk Factors:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                          ),
                          SizedBox(height: 1,),
                          Container(
                            width: MediaQuery.of(context).size.width*.9,
                            // decoration: BoxDecoration(
                            //   border:Border.all(color: Colors.black)
                            // ),
                            child: Card(color: Color.fromRGBO(21, 13, 45, 1),child: Center(child: Text("\nBeing"+" "+"${health.toLowerCase()}"+" "+"$rf\n",style: TextStyle(color: Colors.white),))),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Center(child: Text("Causes:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                          ),
                          SizedBox(height: 1,),
                          Container(
                            width: MediaQuery.of(context).size.width*.9,
                            // decoration: BoxDecoration(
                            //   border:Border.all(color: Colors.black)
                            // ),
                            child: Card(color: Color.fromRGBO(21, 13, 45, 1),child: Center(child: Text("\n$c\n",style: TextStyle(color: Colors.white),))),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Center(child: Text("Treatment:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                          ),
                          SizedBox(height: 1,),
                          Container(
                            width: MediaQuery.of(context).size.width*.9,
                            // decoration: BoxDecoration(
                            //   border:Border.all(color: Colors.black)
                            // ),
                            child: Card(color: Color.fromRGBO(21, 13, 45, 1),child: Center(child: Text("\n$t\n",style: TextStyle(color: Colors.white),))),
                          ),

                        ],
                      ),
                    )

    //                 Container(
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Container(
    //                         child:Center(child: Text("Risk Factors:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
    // ,
    //                        // Text("Risk Factors:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
    //                         //Center(child: Text("Being"+" "+"${health.toLowerCase()}"+" "+"can lead\nto problems such as Osteoporosis\n(Brittle Bones), Skin, Hair\nand Teeth issues.\nYou are at risk to develop Brain,\nLiver and Heart problems\nif you fail to provide the\nright and adequate amount of\nProteins, Vitamins, Carbohydrates and\nMinerals to your body.",style: TextStyle(color: Colors.white),)),
    //                       ),
    //                     ],
    //                   )
    //                 ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text("Causes:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                    //     Center(child: Text("Family History, High Rate\nof Metabolism, High Level of \nPhysical activity, Chronic Diseases,\nDiabetes, Thyroid and digestive\nconditions, mental depression and\nAnxiety or maybe consumption of\nalcohol or smoking cigarette.",style: TextStyle(color: Colors.white),))
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text("Treatment:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                    //     Center(child: Text("For overcoming the situation\nplease follow a nutritional food\nsystem and healthy lifestyle.\nFor remedial process and consultation\nplease speak to your Feonnaa\nConsultants or Feonnaa Doctors. \nStrictly avoid alcohol and smoking.",style: TextStyle(color: Colors.white),))
                    //   ],
                    // )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      _createPDF();

    },
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome()));
                      //Navigator.of(context).popUntil((route) => route.settings.name == '/page2');
                      //Navigator.popUntil(context, ModalRoute.withName('/page2'));

                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.pink,
                        ),
                        child: Center(
                          child: Text("REPORT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome()));
                      //Navigator.of(context).popUntil((route) => route.settings.name == '/page2');
                      //Navigator.popUntil(context, ModalRoute.withName('/page2'));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.pink,
                          ),
                          child: Center(
                            child: Text("RECALCULATE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   height: 250,
              //   width: 250,
              //   color: Colors.white,
              // )

            ],

          )
        ],
      ),
    );
  }
}
