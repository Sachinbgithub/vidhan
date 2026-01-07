import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Facts extends StatelessWidget {
  const Facts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts Display'),
        backgroundColor: const Color(0xFF8B4513), // Dark brown app bar color
      ),
      body:  FactsPage(),
    );
  }
}

class FactsPage extends StatelessWidget {
  final List<String> images = [
    'assets/img1.jpeg',
    'assets/img3.jpg',
    'assets/img2.jpg', // Corrected image name
  ];

  final List<String> facts = [
    'Fact 1: Longest Written Constitution in the World.',
    'Fact 2: Adopted on November 26, 1949.',
    'Fact 3: Drafted by Dr. B.R. Ambedkar.',
    'Fact 4: Handwritten Document.',
  ];

  final List<String> descriptions = [
    "The Indian Constitution is the longest written constitution of any sovereign nation in the world. It originally consisted of 395 articles, 22 parts, and 8 schedules, but after multiple amendments, it now has 470 articles, 25 parts, and 12 schedules.",
    "Although the Constitution was signed and completed on November 26, 1949, it came into full effect on January 26, 1950. November 26 is celebrated as Constitution Day, while January 26 is observed as Republic Day.",
    "Dr. B.R. Ambedkar, the chairman of the drafting committee, is regarded as the principal architect of the Indian Constitution. His profound knowledge and vision for a democratic India helped shape one of the most progressive constitutions.",
    "The original Constitution of India was handwritten and calligraphed in both Hindi and English. The calligraphy was done by Prem Behari Narain Raizada. The original copies are preserved in special cases filled with helium in the Library of the Parliament of India.",
  ];

   FactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/download.jpeg'),
              // Your background image

              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            // Carousel Slider for images
            CarouselSlider(
              options: CarouselOptions(
                height: 350, // Increased height
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
              ),
              items: images.map((image) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 25), // Gap between slider and buttons

            // Information Buttons
            Column(
              children: List.generate(facts.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: SizedBox(
                    width: double.infinity, // Make buttons full width
                    height: 90, // Fixed height for uniformity
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to FactDetailPage with the selected fact and description
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FactDetailPage(
                              articleTitle: facts[index],
                              description: descriptions[index],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD2B48C),
                        // Light brown button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Curved shape
                          side: BorderSide(
                              color: Colors.black.withOpacity(0.5),
                              width: 1), // Border color and width
                        ),
                        elevation:
                            10, // Elevation for a shadow effect (3D look)
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          facts[index],
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .black), // Dark text color for visibility
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class FactDetailPage extends StatelessWidget {
  final String articleTitle;
  final String description;

  const FactDetailPage(
      {super.key, required this.articleTitle, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleTitle),
        backgroundColor: const Color(0xFF8B4513), // Dark brown app bar color
      ),
      body: ListView(
        children: [
          Stack(
          children: [
            // Background Image for Detail Page
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg1.jpg'),
                  // Your background image for detail page
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(articleTitle,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  Text(description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class Facts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Facts Display',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.transparent, // Make background transparent for the image
//       ),
//       home: FactsPage(),
//     );
//   }
// }
//
// class FactsPage extends StatelessWidget {
//   final List<String> images = [
//     'assets/img1.jpeg',
//     'assets/img3.jpg',
//     'assets/img2.jpg', // Corrected image name
//   ];
//
//   final List<String> facts = [
//     'Fact 1: Longest Written Constitution in the World.',
//     'Fact 2: Adopted on November 26, 1949.',
//     'Fact 3: Drafted by Dr. B.R. Ambedkar.',
//     'Fact 4: Handwritten Document.',
//   ];
//
//   final List<String> descriptions = [
//     "The Indian Constitution is the longest written constitution of any sovereign nation in the world. It originally consisted of 395 articles, 22 parts, and 8 schedules, but after multiple amendments, it now has 470 articles, 25 parts, and 12 schedules.",
//     "Although the Constitution was signed and completed on November 26, 1949, it came into full effect on January 26, 1950. November 26 is celebrated as Constitution Day, while January 26 is observed as Republic Day.",
//     "Dr. B.R. Ambedkar, the chairman of the drafting committee, is regarded as the principal architect of the Indian Constitution. His profound knowledge and vision for a democratic India helped shape one of the most progressive constitutions.",
//     "The original Constitution of India was handwritten and calligraphed in both Hindi and English. The calligraphy was done by Prem Behari Narain Raizada. The original copies are preserved in special cases filled with helium in the Library of the Parliament of India.",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Interesting Facts'),
//         backgroundColor: Color(0xFF8B4513), // Dark brown app bar color
//       ),
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/download.jpeg'), // Your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               // Carousel Slider for images
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 350, // Increased height
//                   autoPlay: true,
//                   autoPlayInterval: Duration(seconds: 5),
//                   enlargeCenterPage: true,
//                 ),
//                 items: images.map((image) {
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 2),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                         image: AssetImage(image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//
//               SizedBox(height: 25), // Gap between slider and buttons
//
//               // Information Buttons
//               Column(
//                 children: List.generate(facts.length, (index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//                     child: SizedBox(
//                       width: double.infinity, // Make buttons full width
//                       height: 90, // Fixed height for uniformity
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Navigate to FactDetailPage with the selected fact and description
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => FactDetailPage(
//                                 articleTitle: facts[index],
//                                 description: descriptions[index],
//                               ),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFFD2B48C), // Light brown button color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30), // Curved shape
//                             side: BorderSide(color: Colors.black.withOpacity(0.5), width: 1), // Border color and width
//                           ),
//                           elevation: 10, // Elevation for a shadow effect (3D look)
//                         ),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             facts[index],
//                             style:
//                             TextStyle(fontSize: 16, color: Colors.black), // Dark text color for visibility
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class FactDetailPage extends StatelessWidget {
//   final String articleTitle;
//   final String description;
//
//   const FactDetailPage({Key? key, required this.articleTitle, required this.description}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(articleTitle),
//         backgroundColor: Color(0xFF8B4513), // Dark brown app bar color
//       ),
//       body: Stack(
//         children: [
//           // Background Image for Detail Page
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/bg1.jpg'), // Your background image for detail page
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height:
//                 80),
//                 Text(articleTitle, style:
//                 const TextStyle(fontSize: 24, fontWeight:
//                 FontWeight.bold)),
//                 const SizedBox(height:
//                 30),
//                 Text(description,
//                     style:
//                     const TextStyle(fontSize:
//                     16)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
