import 'package:flutter/material.dart';

class DiaphragmScreen extends StatefulWidget {
const DiaphragmScreen({super.key});

@override
State<DiaphragmScreen> createState() => _DiaphragmScreenState();
}

class _DiaphragmScreenState extends State<DiaphragmScreen> {
double scale = 1.0;

String instruction = "Nhấn Bắt đầu";

int breathCount = 0;

bool isRunning = false;

Future<void> startBreathing() async {
if (isRunning) return;


setState(() {
  isRunning = true;
});

while (isRunning) {
  // Hít vào 4 giây
  setState(() {
    instruction = "Hít vào bằng mũi";
    scale = 1.8;
  });

  await Future.delayed(const Duration(seconds: 4));

  if (!isRunning) return;

  // Thở ra 8 giây
  setState(() {
    instruction = "Thở ra bằng miệng";
    scale = 1.0;
  });

  await Future.delayed(const Duration(seconds: 8));

  if (!isRunning) return;

  setState(() {
    breathCount++;
  });
}


}

void stopBreathing() {
setState(() {
isRunning = false;
scale = 1.0;
instruction = "Đã dừng";
});
}

@override
Widget build(BuildContext context) {
bool isInhale = instruction.contains("Hít");


return Scaffold(
  appBar: AppBar(
    title: const Text("🫁 Tập thở cơ hoành"),
    centerTitle: true,
  ),
  body: Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFE3F2FD),
          Color(0xFFBBDEFB),
        ],
      ),
    ),
    child: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                instruction,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
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

              const SizedBox(height: 30),

              SizedBox(
                width: 260,
                height: 260,
                child: Center(
                  child: AnimatedScale(
                    scale: scale,
                    duration: Duration(
                      seconds: isInhale ? 4 : 8,
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4FC3F7),
                            Color(0xFF1976D2),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            blurRadius: 30,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          isInhale ? "HÍT\nVÀO" : "THỞ\nRA",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                isInhale
                    ? "⬆️ Bụng phình lên"
                    : "⬇️ Hóp bụng lại",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Đặt một tay lên bụng, một tay lên ngực.\n"
                "Khi hít vào bụng phình lên, ngực ít di động.\n"
                "Thở ra chậm gấp đôi thời gian hít vào.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed:
                          isRunning ? null : startBreathing,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("BẮT ĐẦU"),
                    ),
                  ),

                  const SizedBox(width: 20),

                  SizedBox(
                    width: 140,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed:
                          isRunning ? stopBreathing : null,
                      icon: const Icon(Icons.stop),
                      label: const Text("DỪNG"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

}
}
