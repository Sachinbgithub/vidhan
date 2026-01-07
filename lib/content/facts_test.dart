import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vidhan/games/quize/facts_quiz.dart';

class EnhancedConstitutionFactsPage extends StatefulWidget {
  const EnhancedConstitutionFactsPage({Key? key}) : super(key: key);

  @override
  State<EnhancedConstitutionFactsPage> createState() =>
      _EnhancedConstitutionFactsPageState();
}

class _EnhancedConstitutionFactsPageState
    extends State<EnhancedConstitutionFactsPage> with TickerProviderStateMixin {
  int _currentSlide = 0;
  late TabController _tabController;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> quickFacts = [
    {
      'number': '448',
      'title': 'Articles',
      'icon': Icons.article,
    },
    {
      'number': '25',
      'title': 'Parts',
      'icon': Icons.category,
    },
    {
      'number': '12',
      'title': 'Schedules',
      'icon': Icons.schedule,
    },
    {
      'number': '104',
      'title': 'Amendments',
      'icon': Icons.edit_note,
    },
  ];

  final List<Map<String, dynamic>> carouselItems = [
    {
      'title': 'Longest Constitution',
      'description':
      'The Indian Constitution is the longest written constitution of any sovereign country in the world.',
      'color': Colors.blue[700],
      'icon': Icons.menu_book,
    },
    {
      'title': 'Handwritten Beauty',
      'description':
      'The original Constitution was handwritten in beautiful calligraphy by Prem Behari Narain Raizada.',
      'color': Colors.purple[700],
      'icon': Icons.brush,
    },
    {
      'title': 'Time to Create',
      'description':
      'It took 2 years, 11 months, and 18 days to complete the Constitution.',
      'color': Colors.green[700],
      'icon': Icons.timer,
    },
  ];

  final List<Map<String, dynamic>> timelineFacts = [
    {
      'date': '1946',
      'event': 'Constituent Assembly established',
      'details': 'First meeting held on December 9, 1946',
    },
    {
      'date': '1947',
      'event': 'Independence achieved',
      'details': 'Work on constitution continued post-independence',
    },
    {
      'date': '1950',
      'event': 'Constitution adopted',
      'details': 'Came into effect on January 26, 1950',
    },
  ];

  final List<Map<String, dynamic>> featureFacts = [
    {
      'title': 'Federal Structure',
      'description': 'Unique blend of federal and unitary features',
    },
    {
      'title': 'Fundamental Rights',
      'description': 'Comprehensive set of civil liberties',
    },
    {
      'title': 'Directive Principles',
      'description': 'Guidelines for governance and social justice',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.blue[50],
                elevation: 0,
                expandedHeight: 100,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Do you know?',style: TextStyle(fontSize: 20),),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue[50]!, Colors.blue[100]!],
                      ),
                    ),
                  ),
                ),
                // actions: [
                //   IconButton(
                //     icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                //     onPressed: () => setState(() => _isFavorite = !_isFavorite),
                //   ),
                //   IconButton(
                //     icon: const Icon(Icons.share),
                //     onPressed: () {},
                //   ),
                // ],
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildQuickFactsSection(),
              _buildCarouselSection(),
              _buildTabSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showFactOfTheDay,
        label: const Text('Fact of the Day'),
        icon: const Icon(Icons.lightbulb),
      ),
    );
  }

  Widget _buildQuickFactsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Facts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: quickFacts.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: InkWell(
                  onTap: () => _showQuickFactDetail(quickFacts[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          quickFacts[index]['icon'],
                          size: 30,
                          color: Colors.blue[700],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          quickFacts[index]['number'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          quickFacts[index]['title'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: carouselItems.length,
          options: CarouselOptions(
            height: 180,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Card(
              color: carouselItems[index]['color'],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      carouselItems[index]['icon'],
                      size: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      carouselItems[index]['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        carouselItems[index]['description'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _pageController,
          count: carouselItems.length,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            spacing: 8,
            dotColor: Colors.grey[300]!,
            activeDotColor: Colors.blue[700]!,
          ),
        ),
      ],
    );
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.blue[700],
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Timeline'),
            Tab(text: 'Features'),
            Tab(text: 'Trivia'),
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTimelineTab(),
              _buildFeaturesTab(),
              _buildTriviaTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: timelineFacts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[700],
              child: Text(
                timelineFacts[index]['date'].substring(2),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(timelineFacts[index]['event']),
            subtitle: Text(timelineFacts[index]['details']),
          ),
        );
      },
    );
  }

  Widget _buildFeaturesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: featureFacts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(featureFacts[index]['title']),
            subtitle: Text(featureFacts[index]['description']),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }

  Widget _buildTriviaTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz,
            size: 48,
            color: Colors.blue[700],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: ()
            {Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => FactsQuiz()// Replace with your video ID
    ),
    );
  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }

  void _showQuickFactDetail(Map<String, dynamic> fact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(fact['title']),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                fact['icon'],
                size: 48,
                color: Colors.blue[700],
              ),
              const SizedBox(height: 16),
              Text('The Constitution contains ${fact['number']} ${fact['title'].toLowerCase()}.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showFactOfTheDay() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Text(
              'Fact of the Day',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'The original Constitution of India was handwritten and took 2 years, 11 months, and 18 days to complete.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}