import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamicinstapp/screens/notification.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.string(
            '''
            <svg width="158" height="158" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle cx="24" cy="24" r="24" fill="#033941"/>
              <path d="M24 12C17.3726 12 12 17.3726 12 24C12 30.6274 17.3726 36 24 36C30.6274 36 36 30.6274 36 24C36 17.3726 30.6274 12 24 12Z" fill="#FEFDEB"/>
              <path d="M24 28C26.2091 28 28 26.2091 28 24C28 21.7909 26.2091 20 24 20C21.7909 20 20 21.7909 20 24C20 26.2091 21.7909 28 24 28Z" fill="#033941"/>
              <path d="M24 16C22.8954 16 22 15.1046 22 14C22 12.8954 22.8954 12 24 12C25.1046 12 26 12.8954 26 14C26 15.1046 25.1046 16 24 16Z" fill="#033941"/>
              <path d="M24 36C25.1046 36 26 35.1046 26 34C26 32.8954 25.1046 32 24 32C22.8954 32 22 32.8954 22 34C22 35.1046 22.8954 36 24 36Z" fill="#033941"/>
              <path d="M34 24C34 25.1046 34.8954 26 36 26C37.1046 26 38 25.1046 38 24C38 22.8954 37.1046 22 36 22C34.8954 22 34 22.8954 34 24Z" fill="#033941"/>
              <path d="M14 24C14 25.1046 13.1046 26 12 26C10.8954 26 10 25.1046 10 24C10 22.8954 10.8954 22 12 22C13.1046 22 14 22.8954 14 24Z" fill="#033941"/>
            </svg>
            ''',
            height: 50,
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, size: 28),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) =>  NotificationPage()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}