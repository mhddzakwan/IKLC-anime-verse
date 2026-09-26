
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/routes.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),

            // Profile Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  // Profile Picture (Static)
                  Container(
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/black_clover.jpg', // Sesuaikan dengan path/nama file gambar Anda
                        fit: BoxFit.cover,
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.25,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Display Name / Username
                  Text(
                    'IKLC AnimeVerse',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.005),

                  // Email
                  Text(
                    'iklcanimeverse@gmail.com',
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // Member since
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    child: Text(
                      'Member since September 2026',
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            // Account Settings Section Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Change Username Button
            ProfileButton(
              icon: Icons.person_outline,
              title: 'Change Username',
              subtitle: 'Update your display name',
              onTap: () {
                // Static dummy function
              },
            ),

            SizedBox(height: screenHeight * 0.01),

            // Change Password Button
            ProfileButton(
              icon: Icons.lock_outline,
              title: 'Change Password',
              subtitle: 'Update your account password',
              onTap: () {
                // Static dummy function
              },
            ),

            SizedBox(height: screenHeight * 0.03),

            // App Information Section Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'App Information',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),

            // About Button
            ProfileButton(
              icon: Icons.info_outline,
              title: 'About AnimeVerse',
              subtitle: 'Version 1.0.0',
              onTap: () {
                // Static dummy function
              },
            ),

            SizedBox(height: screenHeight * 0.05),

            // Logout Button (Static)
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Static dummy function
                  context.go(AppRoutes.signIn);
                },
                icon: Icon(
                  Icons.logout,
                  size: screenWidth * 0.05,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD34343), // Menyesuaikan warna merah pada gambar
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.018,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  elevation: 0,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}