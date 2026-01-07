# 📜 Vidhan - Nagrik Aur Samvidhan

## Project Documentation Report

---

## 🎯 Project Overview

**Vidhan** (नागरिक और संविधान - Nagrik Aur Samvidhan) is a comprehensive Flutter-based mobile and web application designed to enhance constitutional literacy among Indian citizens. The application presents the Indian Constitution in a simplified, engaging format through gamification and interactive learning experiences.

### Project Details
| Attribute | Value |
|-----------|-------|
| **Project Name** | Vidhan |
| **Platform** | Cross-platform (Android, iOS, Web, Windows, Linux, macOS) |
| **Framework** | Flutter 3.3.3+ |
| **Backend** | Firebase (Auth, Firestore, Storage, Messaging) |
| **AI Integration** | Google Gemini Pro |
| **Theme** | Smart Education |
| **Event** | Smart India Hackathon 2024 |
| **Problem Statement ID** | 1703 |

---

## 🏗️ Architecture Overview

### Technology Stack

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                        │
│  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐           │
│  │  Pages  │ │  Games  │ │ Content │ │ Chatbot │           │
│  └─────────┘ └─────────┘ └─────────┘ └─────────┘           │
├─────────────────────────────────────────────────────────────┤
│                      UTILITY LAYER                           │
│  ┌────────────────┐ ┌────────────────┐ ┌──────────────────┐ │
│  │ Bottom Nav     │ │ Drawer         │ │ Form Controllers │ │
│  └────────────────┘ └────────────────┘ └──────────────────┘ │
├─────────────────────────────────────────────────────────────┤
│                      SERVICE LAYER                           │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐  │
│  │ Firebase Auth   │ │ Firestore       │ │ Gemini AI     │  │
│  │ Service         │ │ Database        │ │ Service       │  │
│  └─────────────────┘ └─────────────────┘ └───────────────┘  │
├─────────────────────────────────────────────────────────────┤
│                    EXTERNAL SERVICES                         │
│  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐           │
│  │Firebase │ │Google   │ │YouTube  │ │Educandy │           │
│  │Platform │ │Gemini AI│ │Player   │ │WebView  │           │
│  └─────────┘ └─────────┘ └─────────┘ └─────────┘           │
└─────────────────────────────────────────────────────────────┘
```

### Directory Structure

```
vidhan/
├── lib/
│   ├── main.dart                    # Application entry point
│   ├── Chatbot/                     # AI Chatbot module
│   │   ├── chatbot.dart             # Gemini AI chat implementation
│   │   └── msg_widget.dart          # Message UI component
│   ├── content/                     # Educational content
│   │   ├── facts.dart               # Constitutional facts carousel
│   │   ├── video_player_page.dart   # YouTube video player
│   │   └── principles/              # Constitution parts
│   │       ├── part_3.dart          # Fundamental Rights
│   │       ├── temp_part_III.dart   # Enhanced Part III view
│   │       ├── part_4.dart          # Directive Principles
│   │       ├── part_5.dart          # The Union
│   │       └── see_all.dart         # All parts overview
│   ├── games/                       # Gamification modules
│   │   ├── courtRoom/               # Courtroom simulation game
│   │   │   └── courtroom.dart       # Story-based legal scenarios
│   │   ├── quize/                   # Quiz modules
│   │   │   ├── daily_quize.dart     # Daily quiz with streak
│   │   │   ├── quiz_test.dart       # Quick quiz test
│   │   │   ├── models/              # Quiz data models
│   │   │   ├── screens/             # Quiz UI screens
│   │   │   ├── widgets/             # Quiz UI components
│   │   │   └── part_3/              # Topic-specific quizzes
│   │   ├── snakes/                  # Snake & Ladder game
│   │   │   └── snakes_ladders.dart  # Educational board game
│   │   ├── educandy.dart            # External games WebView
│   │   └── TryScreen.dart           # Game testing screen
│   ├── pages/                       # Main application pages
│   │   ├── homepage.dart            # Main dashboard
│   │   ├── splashscreen.dart        # App splash screen
│   │   ├── profile_page.dart        # User profile (legacy)
│   │   ├── profile_test2.dart       # Enhanced user profile
│   │   ├── settings_page.dart       # App settings
│   │   ├── chat.dart                # Chat page
│   │   └── userAuth/                # Authentication module
│   │       ├── login_page.dart      # Login UI
│   │       ├── signup_page.dart     # Signup UI (legacy)
│   │       ├── signup_db.dart       # Signup with Firestore
│   │       ├── firebase_auth_services.dart  # Auth service
│   │       ├── form_controller_widget.dart  # Form components
│   │       ├── leaderboard.dart     # Score leaderboard
│   │       └── temp_leader.dart     # Enhanced leaderboard
│   ├── utility/                     # UI utilities
│   │   ├── bottom_nav.dart          # Bottom navigation bar
│   │   └── drawer.dart              # Side drawer
│   ├── res/                         # Resources
│   │   └── assets_res.dart          # Asset paths
│   └── utils/                       # Helper utilities
├── assets/                          # Static assets
│   ├── profile/                     # Profile avatars
│   ├── sounds/                      # Audio effects
│   └── [images]                     # Various images
├── android/                         # Android platform config
├── ios/                             # iOS platform config
├── web/                             # Web platform config
├── windows/                         # Windows platform config
├── linux/                           # Linux platform config
├── macos/                           # macOS platform config
├── pubspec.yaml                     # Dependencies
└── README.md                        # Project readme
```

---

## 📦 Dependencies

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | Core framework |
| `firebase_core` | Latest | Firebase initialization |
| `firebase_auth` | Latest | User authentication |
| `cloud_firestore` | Latest | NoSQL database |
| `firebase_storage` | 12.2.0 | File storage |
| `firebase_messaging` | 15.1.2 | Push notifications |
| `google_sign_in` | 6.2.1 | Google OAuth |

### AI & Content

| Package | Version | Purpose |
|---------|---------|---------|
| `google_generative_ai` | 0.4.6 | Gemini AI integration |
| `flutter_gemini` | Latest | Gemini Flutter SDK |
| `youtube_player_flutter` | 9.0.3 | Video playback |
| `webview_flutter` | 4.9.0 | External content |

### UI & Animation

| Package | Version | Purpose |
|---------|---------|---------|
| `google_fonts` | 6.2.1 | Typography |
| `font_awesome_flutter` | Latest | Icons |
| `lottie` | 3.1.2 | Animated graphics |
| `carousel_slider` | 5.0.0 | Image carousels |
| `curved_navigation_bar` | 1.0.6 | Bottom navigation |
| `flutter_markdown` | 0.7.3+1 | Markdown rendering |

### Utilities

| Package | Version | Purpose |
|---------|---------|---------|
| `shared_preferences` | 2.1.1 | Local storage |
| `audioplayers` | 6.1.0 | Sound effects |
| `image_picker` | Latest | Image selection |
| `http` | Latest | HTTP requests |
| `fluttertoast` | 8.2.8 | Toast messages |

---

## 🔐 Authentication System

### Overview

The authentication system supports multiple sign-in methods:

1. **Email/Password Authentication**
2. **Google Sign-In**
3. **Guest Mode (Skip)**

### User Data Structure (Firestore)

```dart
// Collection: users/{userId}
{
  'name': String,              // Username
  'email': String,             // Email address
  'profilePicture': String,    // Profile image URL
  'profilePictureIndex': int,  // Avatar index
  'rewardPoints': int,         // Total points earned
  'dailyStreak': int,          // Consecutive days played
  'totalQuizPoints': int,      // Quiz score total
  'lastDailyQuizDate': String, // Last quiz completion date
  'dailyQuizScores': [         // Quiz history
    {
      'date': String,
      'score': int,
    }
  ],
}
```

### Authentication Flow

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ Splash Screen│ ──▶ │ Auth Check   │ ──▶ │ Login/Home   │
│ (5 seconds)  │     │ Firebase Auth│     │ Page         │
└──────────────┘     └──────────────┘     └──────────────┘
                            │
                            ▼
                     ┌──────────────┐
                     │ User Signed  │
                     │    In?       │
                     └──────────────┘
                      Yes │    │ No
                          ▼    ▼
                     ┌────┐    ┌────┐
                     │Home│    │Login│
                     │Nav │    │Page │
                     └────┘    └────┘
```

### Firebase Auth Service

```dart
// lib/pages/userAuth/firebase_auth_services.dart
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email/Password Sign Up
  Future<User?> signUpWithEmailandPassword(
    String username, 
    BuildContext context, 
    String email, 
    String password
  ) async { ... }

  // Email/Password Sign In
  Future<User?> signInWithEmailandPassword(
    BuildContext context, 
    String email, 
    String password
  ) async { ... }
}
```

---

## 🏠 Main Application Flow

### Navigation Structure

```
┌─────────────────────────────────────────────────────────┐
│                    Bottom Navigation                     │
├─────────────┬─────────────┬─────────────┬──────────────┤
│   🏠 Home   │  👤 Profile │  📊 Leader  │  ⚙️ Settings │
│   Page      │    Page     │   board     │    Page      │
└─────────────┴─────────────┴─────────────┴──────────────┘
```

### Home Page Features

The home page serves as the main dashboard with the following sections:

1. **Daily Quiz Card** - Navigate to daily constitution quiz
2. **Did You Know?** - Interesting constitutional facts
3. **Games Section**:
   - Court Room (Beta) - Legal scenario simulation
   - Vidhan Run (Beta) - Quick quiz game
   - More Games - Educandy WebView integration
4. **Constitution Parts**:
   - Part III: Basic Human Rights & Duties
   - Part IV: Directive Principles
   - Part V: The Union

### Route Configuration

```dart
// Main routes defined in main.dart
routes: {
  '/home': (context) => const HomePage(),
  '/login': (context) => const LoginPage(),
  '/signup': (context) => const SignUpPage2(),
  '/quize': (context) => const DailyConstitutionQuiz(),
  '/quiz_test': (context) => const ConstitutionQuiz(),
  '/snake': (context) => const GameHome(),
  '/edu': (context) => const WebViewExample(),
  '/part_4': (context) => DutiesAndPrinciplesPage(),
  '/part_5': (context) => UnionPage(),
  '/facts': (context) => Facts(),
  '/part_3': (context) => RightsPage2(),
  '/web': (context) => const WebViewExample(),
  '/seeall': (context) => const SeeAll(),
  '/nav': (context) => const BottomNav(),
  '/courtroom': (context) => CourtroomGameApp(),
  '/quiz_1': (context) => RightToEquality(),
},
```

---

## 🎮 Gamification Modules

### 1. Daily Constitution Quiz

**Location**: `lib/games/quize/daily_quize.dart`

**Features**:
- 10 random questions daily from 200+ question bank
- Streak tracking (consecutive days)
- Score persistence to Firestore
- Bonus points for streaks
- One attempt per day limitation

**Question Structure**:
```dart
{
  'question': 'What is the total number of fundamental rights?',
  'options': ['6', '7', '5', '8'],
  'correctAnswer': 2,  // Index-based
}
```

**Scoring System**:
- +1 point per correct answer
- Streak bonus: +streak_count points
- Results stored with date and score

### 2. Courtroom Game

**Location**: `lib/games/courtRoom/courtroom.dart`

**Features**:
- Story-based legal scenarios
- Interactive narrative with multiple parts
- Timed questions (30 seconds)
- Sound effects for correct/wrong answers
- Score tracking
- Constitutional article explanations

**Game Flow**:
```
Story Part 1 → Story Part 2 → Story Part 3 → Question → Result
```

**Example Scenario**:
> Ravi, a young entrepreneur, faces discrimination in grant applications. 
> The story teaches about Article 14 (Right to Equality).

### 3. Snake & Ladder

**Location**: `lib/games/snakes/snakes_ladders.dart`

**Features**:
- Classic board game (100 squares)
- Constitution-themed questions
- Multiplayer & Computer modes
- Snakes represent wrong answers
- Ladders represent correct answers with bonus

**Game Elements**:
```dart
// Snakes (penalties)
final Map<int, int> snakes = {
  16: 6, 47: 26, 49: 11, 56: 53, 
  62: 19, 64: 60, 87: 24, 93: 73, 
  95: 75, 98: 78
};

// Ladders (rewards)
final Map<int, int> ladders = {
  1: 38, 4: 14, 9: 31, 21: 42, 28: 84
};
```

### 4. Educandy Integration

**Location**: `lib/games/educandy.dart`

**Features**:
- WebView integration with Educandy platform
- External educational games
- JavaScript-enabled web content
- Navigation control (prevents YouTube redirects)

---

## 🤖 AI Chatbot

### Overview

The chatbot uses Google's Gemini Pro model for conversational AI assistance.

**Location**: `lib/Chatbot/chatbot.dart`

### Implementation

```dart
class Chat_Bot extends StatefulWidget {
  // Uses Google Generative AI package
  late final GenerativeModel _model;
  late final ChatSession _chatSession;

  @override
  void initState() {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: 'API_KEY',
    );
    _chatSession = _model.startChat();
  }
}
```

### Features
- Real-time chat interface
- Markdown rendering for responses
- Auto-scroll to latest messages
- Error handling with dialog popups
- Customizable message colors

### Message Widget

```dart
// lib/Chatbot/msg_widget.dart
class MsgWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;
  final Color userColor;
  final Color botColor;
}
```

---

## 📚 Educational Content

### Part III - Fundamental Rights

**Location**: `lib/content/principles/temp_part_III.dart`

**Rights Covered**:
1. Right to Equality (Articles 14-18)
2. Right to Freedom (Articles 19-22)
3. Right against Exploitation (Articles 23-24)
4. Right to Freedom of Religion (Articles 25-28)
5. Cultural and Educational Rights (Articles 29-30)
6. Right to Constitutional Remedies (Article 32)

**Features per Article**:
- Simplified AI explanations
- YouTube video explanations
- Related quizzes
- Card-based UI with descriptions

### Facts Section

**Location**: `lib/content/facts.dart`

**Content**:
1. Longest Written Constitution in the World
2. Adopted on November 26, 1949
3. Drafted by Dr. B.R. Ambedkar
4. Handwritten Document

**UI Components**:
- Carousel slider with images
- Expandable fact buttons
- Detail page with descriptions

### Video Player

**Location**: `lib/content/video_player_page.dart`

**Features**:
- YouTube video integration
- Auto-play support
- Progress indicator
- Custom styling

---

## 👤 User Profile System

### Profile Page

**Location**: `lib/pages/profile_test2.dart`

### Features

1. **Profile Picture Selection**
   - 6 preset avatars
   - Grid selector dialog
   - Firestore sync

2. **Username Editing**
   - Inline edit mode
   - Validation
   - Real-time update

3. **Statistics Display**
   - Reward Points
   - Daily Streak
   - Quiz History (last 7 days)

### Profile Picture Assets

```dart
final List<String> profilePictures = [
  'assets/profile/img.png',
  'assets/profile/img_1.png',
  'assets/profile/img_2.png',
  'assets/profile/img_3.png',
  'assets/profile/img_4.png',
  'assets/profile/img_5.png',
];
```

---

## 📊 Leaderboard System

### Implementation

**Location**: `lib/pages/userAuth/leaderboard.dart`

### Features
- Real-time Firestore streaming
- Top 50 users display
- Score-based ranking
- Current user highlighting
- Avatar display with rank number

### Query Structure

```dart
FirebaseFirestore.instance
    .collection('users')
    .orderBy('score', descending: true)
    .limit(50)
    .snapshots()
```

---

## ⚙️ Settings Module

### Settings Page

**Location**: `lib/pages/settings_page.dart`

### Features

1. **Theme Toggle**
   - Dark/Light mode switch
   - Icon indicator

2. **Privacy Policy**
   - Comprehensive policy document
   - Sections: Introduction, Data Collection, Usage, Protection
   - Contact information

3. **Help & Support**
   - Complaint submission form
   - FAQ section (expandable)
   - Firestore complaint storage

### Complaint Collection Structure

```dart
// Collection: complaints
{
  'name': String,
  'email': String,
  'complaint': String,
  'timestamp': Timestamp,
}
```

---

## 🎨 UI/UX Design

### Color Scheme

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary Blue | `#0D47A1` | Buttons, accents |
| Light Blue | `#E3F2FD` | Backgrounds |
| Accent Gold | `#FFC107` | Highlights |
| Card Color | `#ACB3D5` | Content cards |
| Button Dark | `#004271` | Auth buttons |

### Typography

- **Primary Font**: Poppins (via Google Fonts)
- **Headings**: Bold, Large sizes
- **Body**: Regular weight

### Animation Features

- Lottie animations for splash screen
- Carousel auto-play (5 seconds)
- Bottom navigation curve animation
- Scale transitions in games
- Progress indicators

---

## 🔧 Configuration

### Firebase Configuration

```dart
// Firebase initialization in main.dart
await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: 'AIzaSyCyJsWqNsHnu9WgDdWrEb5NvdS7r9CwJfY',
    appId: '1:861451830242:android:2b4a8190de6ac086756fbb',
    messagingSenderId: '861451830242',
    projectId: 'vidhan-865c0',
  ),
);
```

### Supported Platforms

| Platform | Status | Notes |
|----------|--------|-------|
| Android | ✅ Ready | Primary target |
| iOS | ✅ Ready | Full support |
| Web | ✅ Ready | Built assets available |
| Windows | ✅ Ready | Desktop support |
| Linux | ✅ Ready | Desktop support |
| macOS | ✅ Ready | Desktop support |

### Multi-Language Support (Planned)

```dart
final List<String> _languages = ['English', 'Marathi', 'Hindi'];
```

---

## 📱 Screen Flow Diagram

```
                    ┌───────────────┐
                    │  App Launch   │
                    └───────┬───────┘
                            ▼
                    ┌───────────────┐
                    │ Splash Screen │
                    │  (5 seconds)  │
                    └───────┬───────┘
                            ▼
                    ┌───────────────┐
                    │ Auth Check    │
                    └───────┬───────┘
                     ┌──────┴──────┐
                     ▼             ▼
              ┌───────────┐  ┌───────────┐
              │  Login    │  │   Home    │
              │  Page     │  │Navigation │
              └─────┬─────┘  └─────┬─────┘
                    │              │
         ┌──────────┼──────────────┼──────────┐
         ▼          ▼              ▼          ▼
    ┌────────┐ ┌────────┐    ┌────────┐ ┌────────┐
    │ Sign   │ │ Google │    │ Daily  │ │ Const. │
    │ Up     │ │ SignIn │    │ Quiz   │ │ Content│
    └────────┘ └────────┘    └────────┘ └────────┘
                                  │
                    ┌─────────────┼─────────────┐
                    ▼             ▼             ▼
              ┌──────────┐ ┌──────────┐ ┌──────────┐
              │Courtroom │ │Snake &   │ │ Educandy │
              │Game      │ │Ladder    │ │ Games    │
              └──────────┘ └──────────┘ └──────────┘
```

---

## 🚀 Getting Started

### Prerequisites

1. Flutter SDK 3.3.3+
2. Dart SDK
3. Firebase account
4. Google Cloud Console (for Gemini API)

### Installation

```bash
# Clone the repository
git clone [repository-url]

# Navigate to project directory
cd vidhan

# Install dependencies
flutter pub get

# Run the application
flutter run
```

### Firebase Setup

1. Create Firebase project
2. Enable Authentication (Email/Password, Google)
3. Create Firestore database
4. Add Android/iOS apps to Firebase
5. Download and add configuration files

---

## 📈 Future Enhancements

1. **Multi-language Support** - Hindi, Marathi translations
2. **Offline Mode** - Local quiz caching
3. **Push Notifications** - Daily reminders
4. **Social Features** - Friend challenges
5. **Achievement System** - Badges and rewards
6. **Audio Content** - Constitutional podcasts
7. **AR Features** - Interactive constitution exploration

---

## 👥 Team & Credits

**Project**: Vidhan - Nagrik Aur Samvidhan  
**Event**: Smart India Hackathon 2024  
**Theme**: Smart Education  
**Problem Statement**: 1703  

---

## 📄 License

This project is developed for educational purposes as part of Smart India Hackathon 2024.

---

## 📞 Contact & Support

For technical issues or feedback, use the in-app Help & Support section.

---

*Documentation generated on: January 2026*
*Version: 1.0.0+1*

