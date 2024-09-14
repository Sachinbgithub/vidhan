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
      appBar: AppBar(title: Text("constitution"),),
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
                    image: DecorationImage(
                      image: AssetImage('assets/protest.jpg'),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
                      image: AssetImage('assets/part_IV.jpg'),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
                      image: AssetImage('assets/crowd.jpg'),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
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
