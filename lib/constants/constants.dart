import 'package:flutter/material.dart';

const Color scaffoldBackgroundColor = Color(0xFF343541);
const Color cardColor = Color(0xFF444654);

// List<String> models = [
//   'Model 1',
//   'Model 2',
//   'Model 3',
//   'Model 4',
//   'Model 5',
//   'Model 6',
// ];

// List<DropdownMenuItem<String>> get getModelItems {
//   List<DropdownMenuItem<String>> modelItems =
//       List<DropdownMenuItem<String>>.generate(
//     models.length,
//     (index) => DropdownMenuItem<String>(
//       value: models[index],
//       child: TxtStyle(label: models[index]),
//     ),
//   );
//   return modelItems;
// }

const List<Map<String, String>> chatData = [
  {'question': 'What is your name?', 'answer': 'My name is ChatBot.'},
  {
    'question': 'How old are you?',
    'answer': 'I am an AI and do not have an age.'
  },
  {
    'question': 'What is the capital of France?',
    'answer': 'The capital of France is Paris.'
  },
  {
    'question': 'What programming languages do you support?',
    'answer':
        'I can assist with questions related to Dart, Python, JavaScript, and more.'
  },
  {
    'question': 'How do I create a new Flutter project?',
    'answer':
        'To create a new Flutter project, you can use the command "flutter create project_name".'
  },
  {
    'question': 'What is the answer to life, the universe, and everything?',
    'answer': 'The answer to life, the universe, and everything is 42.'
  },
  {
    'question': 'What is the weather like today?',
    'answer':
        'I do not have access to real-time data. Please check a weather service or app for the latest weather information.'
  },
  {
    'question': 'Can you recommend any good books?',
    'answer':
        'Sure! Some popular books are "The Alchemist" by Paulo Coelho, "To Kill a Mockingbird" by Harper Lee, and "1984" by George Orwell.'
  },
  {
    'question': 'How do I style text in Flutter?',
    'answer':
        'In Flutter, you can style text using the TextStyle widget which allows you to set properties like font family, size, color, and more.'
  },
  {
    'question': 'What is the largest planet in our solar system?',
    'answer': 'Jupiter is the largest planet in our solar system.'
  },
  {
    'question': 'do you know about chatgpt 4',
    'answer':
        'As an AI language model based on GPT-3.5, my knowledge is limited up until September 2021, and I do not have information on specific details or features of GPT-4. OpenAI has not released GPT-4 as of my knowledge cutoff date. However, OpenAI continues to advance and improve their models, so it\'s possible that GPT-4 or newer versions have been released or announced since then. For the most accurate and up-to-date information on GPT-4, I would recommend referring to official sources such as OpenAI\'s website or announcements.'
  }
];
