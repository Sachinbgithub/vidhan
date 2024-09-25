const questions = [
  Question(
    'What does Article 35 of the Indian Constitution provide?',
    [
      'It empowers Parliament to make laws to give effect to certain fundamental rights',
      'It deals with the official language of the Union',
      'It provides for the establishment of a Supreme Court',
      'It lays down the procedure for the amendment of the Constitution'
    ],
    0,
  ),
  Question(
    'Which fundamental rights are covered under Article 35?',
    [
      'Right to equality',
      'Right to freedom',
      'Right against exploitation',
      'Cultural and educational rights of minorities'
    ],
    1,
  ),
  Question(
    'What is the significance of Article 35 in the context of fundamental rights?',
    [
      'It restricts fundamental rights',
      'It empowers Parliament to make laws to give effect to fundamental rights',
      'It suspends fundamental rights during emergencies',
      'It provides for the enforcement of fundamental rights'
    ],
    1,
  ),
  Question(
    'Which article complements Article 35 by providing for the protection of fundamental rights?',
    [
      'Article 32',
      'Article 14',
      'Article 21',
      'Article 19'
    ],
    0,
  ),
  Question(
    'Can the laws made under Article 35 be challenged on the ground of inconsistency with fundamental rights?',
    [
      'Yes, they can be challenged',
      'No, they cannot be challenged',
      'They can be challenged only in certain cases',
      'It depends on the nature of the law'
    ],
    1,
  ),
  Question(
    'What is the purpose of Article 35 in the context of fundamental rights?',
    [
      'To restrict fundamental rights',
      'To empower Parliament to make laws to give effect to fundamental rights',
      'To suspend fundamental rights during emergencies',
      'To provide for the enforcement of fundamental rights'
    ],
    1,
  ),
  Question(
    'Which fundamental right is most affected by the laws made under Article 35?',
    [
      'Right to equality',
      'Right to freedom',
      'Right against exploitation',
      'Cultural and educational rights of minorities'
    ],
    1,
  ),
  Question(
    'How does Article 35 relate to the separation of powers between the legislature and the judiciary?',
    [
      'It gives the judiciary the power to make laws',
      'It gives the legislature the power to make laws',
      'It empowers both the legislature and the judiciary to make laws',
      'It does not affect the separation of powers'
    ],
    1,
  ),
  Question(
    'Which article provides for the enforcement of fundamental rights?',
    [
      'Article 32',
      'Article 14',
      'Article 21',
      'Article 19'
    ],
    0,
  ),
  Question(
    'What is the significance of Article 35 in the overall scheme of the Constitution?',
    [
      'It is a key provision that empowers Parliament to make laws to give effect to fundamental rights',
      'It is a minor provision that has little practical significance',
      'It is a controversial provision that has been widely criticized',
      'It is a redundant provision that serves no purpose'
    ],
    0,
  ),
];

class Question {
  final String text;
  final List<String> options;
  final int correctAnswer;

  const Question(this.text, this.options, this.correctAnswer);
}