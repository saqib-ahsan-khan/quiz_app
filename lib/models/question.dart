class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

const List<Question> kQuestions = [
  Question(
    text: 'Who is known as the "Founder of Pakistan"?',
    options: ['Allama Iqbal', 'Liaquat Ali Khan', 'Muhammad Ali Jinnah', 'Sir Syed Ahmad Khan'],
    correctIndex: 2,
  ),
  Question(
    text: 'When was Pakistan created?',
    options: ['14th August 1947', '23rd March 1940', '15th August 1947', '14th August 1948'],
    correctIndex: 0,
  ),
  Question(
    text: 'What is the national language of Pakistan?',
    options: ['Punjabi', 'Urdu', 'Sindhi', 'Pashto'],
    correctIndex: 1,
  ),
  Question(
    text: 'Who presented the Pakistan Resolution in 1940?',
    options: ['Allama Iqbal', 'Chaudhry Rehmat Ali', 'Liaquat Ali Khan', 'A.K. Fazlul Huq'],
    correctIndex: 3,
  ),
  Question(
    text: 'Which is the highest civil award of Pakistan?',
    options: ['Nishan-e-Imtiaz', 'Sitara-e-Jurat', 'Tamgha-e-Shujaat', 'Hilal-e-Pakistan'],
    correctIndex: 0,
  ),
];


