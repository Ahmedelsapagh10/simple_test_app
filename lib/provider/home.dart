import 'package:exam/provider/mode.dart';

class Data {
  int index = 0;
  // ignore: prefer_final_fields
  List<questionMode> _q = [
    questionMode(
        question: 'عدد الكواكب في المجموعه الشمسيه هو ثمانية كواكب',
        image: 'images/image-1.jpg',
        answer: true),
    questionMode(
        question: 'القطط هي حيوانات لاحمه',
        image: 'images/image-2.jpg',
        answer: true),
    questionMode(
        question: 'الصين تقع في الفاره الافريقيه',
        image: 'images/image-3.jpg',
        answer: false),
    questionMode(
        question: 'الأرض مسطحه وليست كرويه',
        image: 'images/image-4.jpg',
        answer: false),
    questionMode(
        question: 'بإستطاعة الانسان ان يعيش بدون أكل اللحوم',
        image: 'images/image-5.jpg',
        answer: true),
    questionMode(
        question: 'الشمس تدور حول الارض والارض تدور حول القمر',
        image: 'images/image-6.jpg',
        answer: false),
    questionMode(
        question: 'الحيوانات لاتشعر بالالم',
        image: 'images/image-7.jpg',
        answer: false),
  ];

  nextQuestion() {
    if (index < _q.length - 1) {
      index++;
    }
  }

  getQuestion() {
    return _q[index].question;
  }

  getImage() {
    return _q[index].image;
  }

  getAnswer() {
    return _q[index].answer;
  }

  bool isFinished() {
    if (index >= _q.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void Reset() {
    index = 0;
  }
}
