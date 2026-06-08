import 'package:flutter/material.dart';

void main() {
  runApp(const MyVpnApp());
}

class MyVpnApp extends StatelessWidget {
  const MyVpnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: const Color(0xFF22D3EE),
      ),
      home: const VpnHomeScreen(),
    );
  }
}

class VpnHomeScreen extends StatefulWidget {
  const VpnHomeScreen({super.key});

  @override
  State<VpnHomeScreen> createState() => _VpnHomeScreenState();
}

class _VpnHomeScreenState extends State<VpnHomeScreen> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "MODERN VPN",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isConnected ? "PROTECTED" : "NOT CONNECTED",
              style: TextStyle(
                color: isConnected ? const Color(0xFF22D3EE) : Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // ปุ่ม Power เรืองแสง
            GestureDetector(
              onTap: () {
                setState(() {
                  isConnected = !isConnected;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxType.circle,
                  color: const Color(0xFF1E293B),
                  boxShadow: [
                    BoxShadow(
                      color: isConnected 
                          ? const Color(0xFF22D3EE).withOpacity(0.5) 
                          : Colors.black.withOpacity(0.2),
                      blurRadius: isConnected ? 40 : 10,
                      spreadRadius: isConnected ? 10 : 0,
                    )
                  ],
                  border: Border.all(
                    color: isConnected ? const Color(0xFF22D3EE) : Colors.white12,
                    width: 4,
                  ),
                ),
                child: Icon(
                  Icons.power_settings_new,
                  size: 80,
                  color: isConnected ? const Color(0xFF22D3EE) : Colors.white24,
                ),
              ),
            ),
            const Spacer(),
            // ข้อมูลความเร็ว
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat("DOWNLOAD", "12.5 Mbps", Icons.arrow_downward),
                  _buildStat("UPLOAD", "5.2 Mbps", Icons.arrow_upward),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // ปุ่มเลือก Server
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.flag, color: Colors.cyanAccent),
                  SizedBox(width: 20),
                  Text("Singapore Premium #1", style: TextStyle(fontSize: 18)),
                  Spacer(),
                  Icon(Icons.chevron_right, color: Colors.white24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white24, size: 20),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    );
  }
}

### วิธีส่งงานขึ้น GitHub อีกครั้ง:
หลังจากแก้โค้ดเสร็จแล้ว ให้ใช้คำสั่งใน Terminal เหมือนเดิมครับ:
1. `git add .`
2. `git commit -m "Upgrade UI to Modern VPN style"`
3. `git push`

เมื่อระบบ Build เสร็จและคุณติดตั้งใหม่ แอปของคุณจะเปลี่ยนจากแอปขาวๆ พื้นๆ กลายเป็น **แอป VPN สุดเท่โทนสีมืดและมีปุ่มเรืองแสง** ทันทีครับ!

**ลองอัปเกรดดูนะครับ แล้วบอกผมว่าหน้าตาใหม่นี้ถูกใจไหม?** จากนั้นเราจะไปเริ่มใส่ "ไส้ใน" เพื่อให้มันใช้งาน VPN ได้จริงๆ กันครับ!