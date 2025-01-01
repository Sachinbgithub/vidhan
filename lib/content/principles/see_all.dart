import 'package:flutter/material.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("constitution"),),
      body:
      Center(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      Navigator.pushNamed(context, '/part_3')
                      as Route<Object?>);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/img_9.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 100,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Part III: Basic Human Rights & Duties",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      Navigator.pushNamed(context, '/part_4')
                      as Route<Object?>);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      filterQuality: FilterQuality.medium ,
                      image: AssetImage('assets/img_10.png'),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.red,
                    gradient: const LinearGradient(colors: [Colors.red, Colors.transparent]),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 100,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Part IV: Directive Principles of State Policy",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ), Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      Navigator.pushNamed(context, '/part_4')
                      as Route<Object?>);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      filterQuality: FilterQuality.medium ,
                      image: AssetImage('assets/img_11.png'),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.red,
                    gradient: const LinearGradient(colors: [Colors.red, Colors.transparent]),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 100,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Part V: The Union",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
