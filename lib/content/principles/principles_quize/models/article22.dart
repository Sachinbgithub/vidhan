const questions = [
  Question(
    'What does Article 22 of the Indian Constitution deal with?',
    [
      'Protection against arrest and detention',
      'Right to life and personal liberty',
      'Abolition of untouchability',
      'Equality before law',
    ],
    0,
  ),
  Question(
    'Which clause of Article 22 provides for preventive detention?',
    [
      'Clause (1)',
      'Clause (2)',
      'Clause (3)',
      'Clause (4)',
    ],
    1,
  ),
  Question(
    'What is the maximum period for which a person can be detained under preventive detention laws?',
    [
      '3 months',
      '6 months',
      '1 year',
      'No maximum period specified',
    ],
    3,
  ),
  Question(
    'Which article complements Article 22 by providing for protection against self-incrimination?',
    [
      'Article 20',
      'Article 21',
      'Article 14',
      'Article 19',
    ],
    0,
  ),
  Question(
    'What are the grounds for preventive detention under Article 22?',
    [
      'Security of the State',
      'Maintenance of public order',
      'Maintenance of supplies and services essential to the community',
      'All of the above',
    ],
    3,
  ),
  Question(
    'Can a person detained under preventive detention laws be represented by a lawyer?',
    [
      'Yes, always',
      'No, never',
      'Only with the permission of the detaining authority',
      'Only in certain cases',
    ],
    2,
  ),
  Question(
    'Which clause of Article 22 provides for the right to be informed of the grounds of arrest?',
    [
      'Clause (1)',
      'Clause (2)',
      'Clause (3)',
      'Clause (4)',
    ],
    0,
  ),
  Question(
    'What is the purpose of the safeguards provided under Article 22?',
    [
      'To protect the rights of the accused',
      'To ensure fair trial',
      'To prevent arbitrary arrest and detention',
      'All of the above',
    ],
    3,
  ),
  Question(
    'Can the provisions of Article 22 be suspended during an emergency?',
    [
      'Yes, completely',
      'No, they cannot be suspended',
      'Yes, but only partially',
      'It depends on the type of emergency',
    ],
    2,
  ),
  Question(
    'Which judicial case emphasized the importance of Article 22 in protecting individual liberty?',
    [
      'Maneka Gandhi v. Union of India',
      'A.K. Gopalan v. State of Madras',
      'Kharak Singh v. State of Uttar Pradesh',
      'Menaka Gandhi v. Union of India',
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