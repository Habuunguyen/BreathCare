import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  double scale = 1.0;

  String instruction = "Nhấn Bắt đầu";

  int count = 0;

  int breathCount = 0; // <-- THÊM DÒNG NÀY

  bool isRunning = false;

  Future<void> startBreathing() async {
    if (isRunning) return;

    setState(() {
      isRunning = true;
    });

    while (isRunning) {

      // HÍT VÀO 4 GIÂY
      setState(() {
        instruction = "Hít vào";
        scale = 1.8;
      });

      for (int i = 1; i <= 4; i++) {
        if (!isRunning) return;

        setState(() {
          count = i;
        });

        await Future.delayed(const Duration(seconds: 1));
      }

      // GIỮ HƠI 4 GIÂY
      setState(() {
        instruction = "Giữ hơi";
      });

      for (int i = 4; i >= 1; i--) {
        if (!isRunning) return;

        setState(() {
          count = i;
        });

        await Future.delayed(const Duration(seconds: 1));
      }

      // THỞ RA 6 GIÂY
      setState(() {
        instruction = "Thở ra";
        scale = 1.0;
      });

      for (int i = 6; i >= 1; i--) {
  if (!isRunning) return;

  setState(() {
    count = i;
  });

  await Future.delayed(const Duration(seconds: 1));
}

// HOÀN THÀNH 1 CHU KỲ 4-4-6
setState(() {
  breathCount++;
});

} // đóng while(isRunning)
} // đóng hàm startBreathing()

  void stopBreathing() {
    setState(() {
      isRunning = false;
      instruction = "Đã dừng";
      count = 0;
      scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tập thở 4-4-6"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
  instruction,
  style: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

Text(
  "Số lần thở: $breathCount",
  style: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 40),

            SizedBox(
              width: 250,
              height: 250,
              child: Center(
                child: AnimatedScale(
                  scale: scale,
                  duration: const Duration(seconds: 4),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        count == 0 ? "" : "$count",
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: startBreathing,
                  child: const Text("Bắt đầu"),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: stopBreathing,
                  child: const Text("Dừng"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}