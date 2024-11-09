import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class EnhancedLeaderboardPage extends StatelessWidget {
//   const EnhancedLeaderboardPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Leaderboard'),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .orderBy('score', descending: true)
//             .limit(50)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//
//           final users = snapshot.data?.docs ?? [];
//
//           return Column(
//             children: [
//               if (users.length >= 3) _buildTopThree(users.sublist(0, 3)),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     final user = users[index].data() as Map<String, dynamic>;
//                     final isCurrentUser = user['uid'] == FirebaseAuth.instance.currentUser?.uid;
//
//                     return _buildLeaderboardItem(
//                       context,
//                       index + 1,
//                       user['username'] ?? 'Anonymous',
//                       user['score'] ?? 0,
//                       isCurrentUser,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildTopThree(List<QueryDocumentSnapshot> topUsers) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       color: Colors.blue[50],
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           _buildTopUserWidget(topUsers[1], 2, 80),
//           _buildTopUserWidget(topUsers[0], 1, 100),
//           _buildTopUserWidget(topUsers[2], 3, 60),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTopUserWidget(QueryDocumentSnapshot user, int rank, double size) {
//     final userData = user.data() as Map<String, dynamic>;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           radius: size / 2,
//           backgroundColor: Colors.blue[rank * 100],
//           child: Text(
//             userData['username']?[0] ?? 'A',
//             style: TextStyle(fontSize: size / 3, color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           userData['username'] ?? 'Anonymous',
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         Text(
//           '${userData['score']}',
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//         _buildRankBadge(rank),
//       ],
//     );
//   }
//
//   Widget _buildRankBadge(int rank) {
//     IconData icon;
//     Color color;
//     switch (rank) {
//       case 1:
//         icon = Icons.looks_one;
//         color = Colors.amber;
//         break;
//       case 2:
//         icon = Icons.looks_two;
//         color = Colors.grey[300]!;
//         break;
//       case 3:
//         icon = Icons.looks_3;
//         color = Colors.brown[300]!;
//         break;
//       default:
//         icon = Icons.emoji_events;
//         color = Colors.blue[300]!;
//     }
//     return Icon(icon, color: color, size: 30);
//   }
//
//   Widget _buildLeaderboardItem(BuildContext context, int rank, String username, int score, bool isCurrentUser) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: isCurrentUser ? Colors.yellow[100] : Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.blue[rank * 100 % 900],
//           child: Text(
//             '$rank',
//             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//         title: Text(
//           username,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         trailing: Text(
//           '$score pts',
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             color: Colors.blue[800],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LeaderboardWithDummyRanks extends StatelessWidget {
  const LeaderboardWithDummyRanks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(

        title: Center(child: const Text('Leaderboard')),
        backgroundColor: Colors.blue[50],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .orderBy('score', descending: true)
            .limit(50)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data?.docs ?? [];
          final combinedUsers = _combineWithDummyUsers(users);

          return Column(
            children: [
              if (combinedUsers.length >= 3) _buildTopThree(combinedUsers.sublist(0, 3)),
              Expanded(
                child: ListView.builder(
                  itemCount: combinedUsers.length,
                  itemBuilder: (context, index) {
                    final user = combinedUsers[index];
                    final isCurrentUser = user['uid'] == FirebaseAuth.instance.currentUser?.uid;

                    return _buildLeaderboardItem(
                      context,
                      index + 1,
                      user['username'] ?? 'Anonymous',
                      user['score'] ?? 0,
                      isCurrentUser,
                      user['isDummy'] ?? false,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _combineWithDummyUsers(List<QueryDocumentSnapshot> firebaseUsers) {
    List<Map<String, dynamic>> dummyUsers = [
      {'uid': 'dummy1', 'username': 'Sachin', 'score': 1250, 'isDummy': true},
      {'uid': 'dummy2', 'username': 'Sufiyan', 'score': 1000, 'isDummy': true},
      {'uid': 'dummy3', 'username': 'Vaibhav', 'score': 900, 'isDummy': true},
      {'uid': 'dummy4', 'username': 'Chinmayee', 'score': 850, 'isDummy': true},
      {'uid': 'dummy5', 'username': 'Hrishikesh', 'score': 200, 'isDummy': true},
      {'uid': 'dummy5', 'username': 'Rohit', 'score': 800, 'isDummy': true},
    ];

    List<Map<String, dynamic>> combinedUsers = firebaseUsers.map((doc) => doc.data() as Map<String, dynamic>).toList();
    combinedUsers.addAll(dummyUsers);
    combinedUsers.sort((a, b) => (b['score'] as num).compareTo(a['score'] as num));

    return combinedUsers;
  }

  Widget _buildTopThree(List<Map<String, dynamic>> topUsers) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.blue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTopUserWidget(topUsers[1], 2, 80),
          _buildTopUserWidget(topUsers[0], 1, 100),
          _buildTopUserWidget(topUsers[2], 3, 60),
        ],
      ),
    );
  }

  Widget _buildTopUserWidget(Map<String, dynamic> user, int rank, double size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundColor: Colors.blue[rank * 100],
          child: Text(
            user['username']?[0] ?? 'A',
            style: TextStyle(fontSize: size / 3, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user['username'] ?? 'Anonymous',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '${user['score']}',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        _buildRankBadge(rank),
      ],
    );
  }

  Widget _buildRankBadge(int rank) {
    IconData icon;
    Color color;
    switch (rank) {
      case 1:
        icon = Icons.looks_one;
        color = Colors.amber;
        break;
      case 2:
        icon = Icons.looks_two;
        color = Colors.grey[300]!;
        break;
      case 3:
        icon = Icons.looks_3;
        color = Colors.brown[300]!;
        break;
      default:
        icon = Icons.emoji_events;
        color = Colors.blue[300]!;
    }
    return Icon(icon, color: color, size: 30);
  }

  Widget _buildLeaderboardItem(BuildContext context, int rank, String username, int score, bool isCurrentUser, bool isDummy) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.yellow[100] : (isDummy ? Colors.green[50] : Colors.white),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[rank * 100 % 900],
          child: Text(
            '$rank',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Row(
          children: [
            Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (isDummy) const SizedBox(width: 8),
            if (isDummy)
              const Icon(Icons.computer, size: 16, color: Colors.grey)
          ],
        ),
        trailing: Text(
          '$score pts',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.blue[800],
          ),
        ),
      ),
    );
  }
}