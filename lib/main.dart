import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(KUITEcoApp());
}

class KUITEcoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {"title": "Mobil o'yinlar", "icon": Icons.videogame_asset},
    {"title": "Internet saytlar", "icon": Icons.language},
    {"title": "Ilmiy nazariyalar", "icon": Icons.science},
    {"title": "Dastur haqida", "icon": Icons.info},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KUIT-ECO', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(sections.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            DetailScreen(title: sections[index]["title"]),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(sections[index]["icon"], size: 30, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      sections[index]["title"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen({required this.title});

  final Map<String, List<Map<String, String>>> content = {
    "Mobil o'yinlar": [
      {
        "name": "My Earth – Save the Planet (Android, iOS)",
        "description":
            "Qisqacha: Bu o‘yinda siz global ekologik muammolarni hal qilasiz, chiqindilarni qayta ishlaysiz, atmosferani ifloslantirmaslik uchun toza energiyadan foydalanasiz.",
        "link":
            "https://play.google.com/store/apps/details?id=com.digigame.save.planet",
      },
      {
        "name": "Toca Nature (Android, iOS)",
        "description":
            "Qisqacha: Bolalar va kattalar uchun qiziqarli o‘yin bo‘lib, unda siz tabiatni shakllantirasiz: daraxt ekasiz, daryolar yaratishingiz va hayvonlarni boqishingiz mumkin.",
        "link":
            "https://play.google.com/store/apps/details?id=com.tocaboca.tocakitchen2",
      },
      {
        "name": "Plasticity (PC, Android)",
        "description":
            "Qisqacha: Plastmassaning atrof-muhitga ta’siri haqida o‘ylashga undovchi o‘yin. O‘yinchi ifloslangan shaharni tozalash va chiqindilarni qayta ishlash orqali tabiatni asrashga harakat qiladi.",
        "link":
            "https://play.google.com/store/apps/details?id=com.softecks.plastic_technology",
      },
      {
        "name": "Eco Birds (Android, iOS)",
        "description":
            "Qisqacha: Oddiy, ammo foydali o‘yin. Har bir o‘yin jarayoni oxirida real hayotda daraxt ekish uchun xayriya qilinadi.",
        "link": "https://play.google.com/store/apps/details?id=co.bird.android",
      },
      {
        "name": "SimCity BuildIt (Android, iOS)",
        "description":
            "Qisqacha: O‘zingizning ekologik shaharingizni qurib, toza energiya, chiqindi boshqaruvi va yashil hududlarni rivojlantirish orqali atrof-muhitni asray olasiz.",
        "link":
            "https://play.google.com/store/apps/details?id=com.ea.game.simcitymobile_row",
      },
      {
        "name": "Eco City – Green Planet (Android)",
        "description":
            "Qisqacha: Ekologik toza shahar qurish va barqaror rivojlanishni ta’minlash bo‘yicha o‘yin. Qayta tiklanuvchi energiya manbalaridan foydalanib, tabiatga zarar yetkazmagan holda rivojlanish kerak.",
        "link":
            "https://play.google.com/store/apps/details?id=tpmi.catsi.eco_city",
      },
      {
        "name": "Terra Nil (PC, iOS, Android, Nintendo Switch)",
        "description":
            "Qisqacha: Bu ekologik o‘yin bo‘lib, unda tashlandiq yerlarni yashil hududlarga aylantirasiz. Daryo va o‘rmonlarni tiklab, yovvoyi tabiatni qayta tiklash vazifalarini bajarasiz.",
        "link":
            "https://play.google.com/store/apps/details?id=com.netflix.NGP.TerraNil",
      },
      {
        "name": "Recycle! (Android, iOS)",
        "description":
            "Qisqacha: O‘yinchi chiqindilarni to‘g‘ri saralashni o‘rganadi va chiqindilarni qayta ishlash orqali ekologik muhitni yaxshilaydi.",
        "link":
            "https://play.google.com/store/apps/details?id=mobi.inthepocket.fostplus.recyclage",
      },
      {
        "name": "Mission: Clean Earth (Android, iOS)",
        "description":
            "Qisqacha: O‘yin maqsadi – sayyorani ifloslanishdan tozalash va ekologik muammolarni hal qilish. Plastik chiqindilarni to‘plash va ularni qayta ishlash orqali tabiatni tiklash mumkin.",
        "link": "https://play.google.com/store/apps/details?id=com.onenone.ecp",
      },
      {
        "name": "Save the Earth: Climate Strike (Android)",
        "description":
            "Qisqacha: Global iqlim muammolariga qarshi kurashish uchun o‘yinchilar turli kampaniyalarni o‘tkazadi, ekologik harakatlarni tashkil qiladi va atrof-muhitni himoya qilish uchun ishlaydi.",
        "link":
            "https://play.google.com/store/apps/details?id=com.NIVO.SavingEarth",
      },
      {
        "name": "WildCraft: Animal Sim Online 3D (Android, iOS)",
        "description":
            "Qisqacha: Siz yovvoyi tabiatda yashovchi hayvon sifatida o‘ynaysiz va o‘z oilangizni himoya qilib, tirik qolishingiz kerak. Ekotizimni tushunish va tabiat muhofazasi haqida bilim olishga yordam beradi.",
        "link":
            "https://play.google.com/store/apps/details?id=com.turborocketgames.wildcraft",
      },

      {
        "name": "WolfQuest (PC, Android, iOS)",
        "description":
            "Qisqacha: Bo‘rilar hayotini simulyatsiya qiluvchi o‘yin. Tabiiy muhitda ov qilish, oilangizni himoya qilish va ekotizimga ta’sir etuvchi elementlarni boshqarish mumkin.",
        "link":
            "https://play.google.com/store/apps/details?id=com.swiftappskom.thewolfrpg",
      },

      {
        "name": "Deep Blue Dump (PC, Android, iOS)",
        "description":
            "Qisqacha: Dengiz hayotini plastik va chiqindilardan tozalash bo‘yicha o‘yin. Siz okeandagi chiqindilarni to‘plash va dengiz hayvonlarini qutqarish vazifalarini bajarasiz.",
        "link":
            "https://play.google.com/store/apps/details?id=com.apofiss.deepblue",
      },
    ],
    "Internet saytlar": [
      {
        "name": "Green Games Guide",
        "description":
            "Tavsif: Bu saytda ekologiyaga bag‘ishlangan o‘yinlar katalogi mavjud. Unda o‘yinlarning atrof-muhitga ta’siri, barqarorlik mavzulari va o‘yinchilarni ekologik ongni rivojlantirishga undaydigan elementlar haqida ma’lumot beriladi.",
        "link":
            " https://www.greengamesguide.com (https://www.greengamesguide.com/)",
      },
      {
        "name": "Games4Sustainability",
        "description":
            "Tavsif: Bu platforma atrof-muhit va barqaror rivojlanishga bag‘ishlangan o‘yinlar katalogini taqdim etadi. Saytda o‘yinlarni janr, mavzu va maqsad bo‘yicha filtrlash mumkin.",
        "link": "https://games4sustainability.org/",
      },
      {
        "name": "Playing for the Planet Initiative",
        "description":
            "Tavsif: Birlashgan Millatlar Tashkiloti (BMT) tashabbusi bo‘lib, ekologik muammolarga qarshi kurashish va barqaror rivojlanishni targ‘ib qilish uchun o‘yin sanoati bilan hamkorlik qiladi. Ushbu loyiha ekologik o‘yinlar haqida ma’lumot beradi va yangi tashabbuslarni ilgari suradi.",
        "link": "https://playing4theplanet.org/",
      },
      {
        "name": "Steam Green Games Tag (Kompyuter o‘yinlari uchun)",
        "description":
            "Tavsif: Agar siz ekologik mavzudagi PC o‘yinlarini qidirsangiz, Steam do‘konidagi “Ecology” tegi orqali filtrlangan o‘yinlar ro‘yxatini ko‘rishingiz mumkin.",
        "link": "https://store.steampowered.com/tags/en/Ecology/",
      },
      {
        "name": "IndieDB – Eco Games",
        "description":
            "Tavsif: Mustaqil (indie) ishlab chiquvchilar yaratgan ekologik mavzudagi o‘yinlarni topish mumkin bo‘lgan platforma. Bu yerda ko‘pincha yangi va eksperimental o‘yin loyihalari joylashtiriladi.",
        "link": "https://www.indiedb.com/tags/eco",
      },
    ],
    "Ilmiy nazariyalar": [
      {
        "name": "Tabiatni tushunish va unga mehr qo‘yish",
        "description":
            "Bolalarga tabiatni sevishni o‘rgatish uchun ularni sayohatlarga olib chiqish, bog‘ yoki o‘rmonlarda sayr qilish foydali bo‘ladi. Hayvonlar va o‘simliklar hayoti haqida qiziqarli hikoyalar va o‘yinlar orqali tushuntirish mumkin.",
        "link":
            "https://cyberleninka.ru/article/n/mtt-da-bolalarga-ekologik-tarbiya-berishning-shakllari-va-usullari",
      },
      {
        "name": "Kitob va multfilmlar orqali o‘rgatish",
        "description":
            "Ekologik mavzudagi kitoblar – masalan, Tabiat do‘stlari kabi bolalar uchun yozilgan ekologik ertak va hikoyalar.Multfilmlar va hujjatli filmlar – ekologiya haqida qiziqarli va ta’lim beruvchi multfilmlar ko‘rsatish",
        "link":
            "https://cyberleninka.ru/article/n/mtt-da-bolalarga-ekologik-tarbiya-berishning-shakllari-va-usullari",
      },
      {
        "name": "Kundalik odatlarni shakllantirish",
        "description":
            "Suv va elektrni tejash – suvni bekorga oqizmaslik va elektrni tejash bo‘yicha ko‘rsatmalar berish.Plastik iste’molini kamaytirish – plastik paketlar o‘rniga mato sumkalar ishlatish, qayta ishlatiladigan buyumlardan foydalanish.Transport o‘rniga piyoda yurish yoki velosipedda yurish – bolalarni atrof-muhitga zarar yetkazmaydigan transport turlariga o‘rgatish.",
        "link":
            "https://cyberleninka.ru/article/n/mtt-da-bolalarga-ekologik-tarbiya-berishning-shakllari-va-usullari",
      },
      {
        "name": "Atrof-muhit muammolari haqida bilim berish",
        "description":
            "Plastik ifloslanish, global isish va chiqindilar muammosi haqida yoshga mos tarzda tushuntirish kerak.Multfilmlar, kitoblar va interaktiv o‘yinlardan foydalanish foydali bo‘ladi.",
        "link":
            "https://cyberleninka.ru/article/n/mtt-da-bolalarga-ekologik-tarbiya-berishning-shakllari-va-usullari",
      },
      {
        "name": "Ekologik odatlar shakllantirish",
        "description":
            "Qayta ishlashni o‘rgatish (plastik, qog‘oz, shisha va metall chiqindilarini ajratish).Elektr energiyasini tejash va suvdan to‘g‘ri foydalanish bo‘yicha o‘yinlar uyushtirish.Daraxt ekish, o‘simliklar parvarishi bilan shug‘ullanish.",
        "link":
            "https://cyberleninka.ru/article/n/mtt-da-bolalarga-ekologik-tarbiya-berishning-shakllari-va-usullari",
      },
      {
        "name": "Ekologik mas'uliyat va faollikni oshirish",
        "description":
            "Mahalliy ekologik aksiyalarda ishtirok etish (o‘rmon ekish, chiqindilarni tozalash).Ekologiyaga bag‘ishlangan maktab loyihalari va tanlovlarda qatnashish.",
        "link": "https://climatekids.nasa.gov/",
      },
    ],
    "Dastur haqida": [
      {
        "name": "KUIT-ECO",
        "description":
            "Ushbu dastur ekologik bilimlarni kengaytirish uchun ishlab chiqilgan. Unda mobil o‘yinlar, ilmiy nazariyalar va foydali internet saytlar to‘plangan.\n Ekologik o‘yinlar – bu bolalar va kattalar uchun tabiatni asrash, atrof-muhitni muhofaza qilish va ekologik muammolarni tushunishga yordam beradigan o‘yinlardir. Bunday o‘yinlar bilim berish bilan birga, qiziqarli va interaktiv bo‘lib, ekologik ongni shakllantirishga yordam beradi.\n Bu o‘yinlar bolalar uchun foydali bo‘lib, ularga ekologik muammolarni tushunish va hal qilish yo‘llarini o‘rgatishga yordam beradi. ",
        "link":
            "https://staff.tiiame.uz/storage/users/164/articles/QvLrPZgS4XHLnMzzKfvi7ci6DK5Yz5jH3oW9ddGp.pdf",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: content[title]?.length ?? 0,
          itemBuilder: (context, index) {
            var item = content[title]![index];

            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["name"]!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item["description"]!,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _launchURL(item["link"]!),
                    icon: Icon(Icons.open_in_new, size: 18),
                    label: Text(
                      "Saytni ochish",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'URL ochib bo‘lmadi: $urlString';
    }
  }
}
