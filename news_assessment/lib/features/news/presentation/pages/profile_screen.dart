import 'package:flutter/material.dart';

Widget _buildProfileDetail(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Row(
      children: [
        Icon(icon, size: 24, color: Colors.black54),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.05),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Ranu Rajendra Shukla',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          _buildProfileDetail(Icons.person, 'Flutter Developer'),
          _buildProfileDetail(Icons.business, 'Tech Company'),
          _buildProfileDetail(Icons.email, 'shuklaomkar180@gmail.com'),
          _buildProfileDetail(Icons.phone, '+917738572978'),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}




// Widget for buttons
// Widget _buildButton(BuildContext context, String text, Color color,
//     VoidCallback onPressed, double width, bool isRtransparent) {
//   return CustomeButton(
//     transparent: isRtransparent,
//     text: text,
//     onPressed: () {},
//     horizontalPadding: width * 0.15,
//     verticalPadding: 12,
//   );
// }