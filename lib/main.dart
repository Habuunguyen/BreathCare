import 'package:flutter/material.dart';
import 'breathing_screen.dart';
import 'pursed_lip_screen.dart';
import 'diaphragm_screen.dart';

void main() {
  runApp(const BreathCareApp());
}

class BreathCareApp extends StatelessWidget {
  const BreathCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BreathCare',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget exerciseCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    icon,
                    size: 24,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0EA5E9),
              Color(0xFF38BDF8),
              Color(0xFFE0F2FE),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                const SizedBox(height: 8),

                const Icon(
                  Icons.air,
                  color: Colors.white,
                  size: 50,
                ),

                const SizedBox(height: 6),

                const Text(
                  "BreathCare",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const Text(
                  "Hít thở khỏe mỗi ngày",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: ListView(
                    children: [

                      exerciseCard(
                        context: context,
                        title: "Thở chúm môi",
                        subtitle: "Giảm khó thở, cải thiện trao đổi khí",
                        icon: Icons.air,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const PursedLipScreen(),
                            ),
                          );
                        },
                      ),

                      exerciseCard(
                        context: context,
                        title: "Thở cơ hoành",
                        subtitle: "Tăng thông khí phổi",
                        icon: Icons.favorite,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const DiaphragmScreen(),
                            ),
                          );
                        },
                      ),

                      exerciseCard(
                        context: context,
                        title: "Thở thư giãn 4-4-6",
                        subtitle: "Giảm căng thẳng, ngủ ngon hơn",
                        icon: Icons.self_improvement,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const BreathingScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 6),

                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Text(
                              "💡 Lời khuyên hôm nay",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              "Duy trì tập thở 10-15 phút mỗi ngày để cải thiện chức năng hô hấp.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}