import 'package:amber_website/services/pdf_opener.dart';
import 'package:flutter/animation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<void> createPdf(
    String roomNo,
    name,
    address,
    admissionNo,
    semester,
    course,
    branch,
    leaveDate,
    returndate,
    vacation,
    phoneNo,
    otherRemarks) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawString(
      'Indian Institute of Technology (Indian School of Mines), Dhanbad',
      PdfStandardFont(PdfFontFamily.timesRoman, 16, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTRB(30, 0, 0, 0));
  page.graphics.drawString(
      'Form of Outstation Leave (for vacation and semester break)',
      PdfStandardFont(PdfFontFamily.timesRoman, 16, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTRB(50, 30, 0, 0));

  page.graphics.drawString(
      'Room No: $roomNo',
      PdfStandardFont(
        PdfFontFamily.helvetica,
        14,
      ),
      bounds: const Rect.fromLTRB(10, 80, 0, 0));
  page.graphics.drawString(
      'Name: $name', PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 100, 0, 0));
  page.graphics.drawString('Admission No: $admissionNo',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 120, 0, 0));
  page.graphics.drawString(
      'Semester: $semester', PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 140, 0, 0));
  page.graphics.drawString('Name of Programme: $course',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 160, 0, 0));
  page.graphics.drawString(
      'Branch: $branch', PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 180, 0, 0));
  page.graphics.drawString('Date and time of Leaving: $leaveDate',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 200, 0, 0));
  page.graphics.drawString('Expected Date and Time for return: $returndate',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 220, 0, 0));
  page.graphics.drawString('Vacation(Summer/Winter)/Semester Break: $vacation',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 240, 0, 0));
  page.graphics.drawString(
      'Address: $address', PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 260, 0, 0));
  page.graphics.drawString(
      'Phone No:  $phoneNo', PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 280, 0, 0));
  page.graphics.drawString(
      'Any other remarks: ${otherRemarks == '' ? '_____________' : otherRemarks}',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 340, 0, 0));
  page.graphics.drawString('Signature of dealing assistant: ',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 360, 0, 0));
  page.graphics.drawString('Recommendation of CW/Waren: ',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 380, 0, 0));
  page.graphics.drawString(
      'DSW/ADHM: ', PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTRB(10, 400, 0, 0));

  List<int> bytes = await document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Leaving Form.pdf');
}
