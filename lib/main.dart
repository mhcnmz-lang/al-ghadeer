import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AlGhadeerApp());
}

class AlGhadeerApp extends StatelessWidget {
  const AlGhadeerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'عيادة الغدير',
      theme: ThemeData(
        primaryColor: const Color(0xFF0E8A7A),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0E8A7A)),
        textTheme: GoogleFonts.tajawalTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E8A7A),
        centerTitle: true,
        title: Text('عيادة الغدير التمريضية',
            style: GoogleFonts.tajawal(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFF0E8A7A),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const Icon(Icons.local_hospital,
                      color: Colors.white, size: 50),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('أهلاً بكم في عيادة الغدير',
                            style: GoogleFonts.tajawal(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('خدمة تمريضية منزلية 24 ساعة - النجف',
                            style:
                                GoogleFonts.tajawal(color: Colors.white70)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _menuCard(context, 'حجز زيارة', Icons.calendar_month,
                    Colors.teal, const BookingPage()),
                _menuCard(context, 'خدماتنا', Icons.medical_services,
                    Colors.blue, const ServicesPage()),
                _menuCard(context, 'المرضى', Icons.people, Colors.orange,
                    const PatientsPage()),
                _menuCard(context, 'المواعيد', Icons.access_time,
                    Colors.purple, const AppointmentsPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, IconData icon,
      Color color, Widget page) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => page)),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: color),
            const SizedBox(height: 10),
            Text(title,
                style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final services = [
      'قياس ضغط الدم',
      'قياس السكر',
      'إعطاء حقن وريدية وعضلية',
      'تضميد جروح وحروق',
      'سحب دم منزلي',
      'تركيب مغذي',
      'رعاية كبار السن',
      'متابعة بعد العمليات'
    ];
    return Scaffold(
      appBar: AppBar(
          title: Text('خدماتنا',
              style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFF0E8A7A),
          foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: services.length,
        itemBuilder: (c, i) => Card(
          child: ListTile(
              leading:
                  const Icon(Icons.check_circle, color: Color(0xFF0E8A7A)),
              title: Text(services[i], style: GoogleFonts.tajawal())),
        ),
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('حجز زيارة', style: GoogleFonts.tajawal()),
          backgroundColor: const Color(0xFF0E8A7A),
          foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
                    labelText: 'اسم المريض',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 12),
            TextField(
                decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 12),
            TextField(
                maxLines: 3,
                decoration: InputDecoration(
                    labelText: 'العنوان والخدمة المطلوبة',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E8A7A),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('تم إرسال الحجز بنجاح',
                          style: GoogleFonts.tajawal())));
                  Navigator.pop(context);
                },
                child: Text('إرسال الحجز',
                    style: GoogleFonts.tajawal(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المرضى', style: GoogleFonts.tajawal()), backgroundColor: const Color(0xFF0E8A7A), foregroundColor: Colors.white),
      body: Center(child: Text('قائمة المرضى - قريباً', style: GoogleFonts.tajawal(fontSize: 18))),
    );
  }
}

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المواعيد', style: GoogleFonts.tajawal()), backgroundColor: const Color(0xFF0E8A7A), foregroundColor: Colors.white),
      body: Center(child: Text('جدول المواعيد - قريباً', style: GoogleFonts.tajawal(fontSize: 18))),
    );
  }
}
