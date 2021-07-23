import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            "Günün Falı",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/falci.png",
                width: 150,
              ),
            ),
            Expanded(
              flex: 2,
              child: Btns(),
            ),
          ],
        ),
      ),
    );
  }
}

class Btns extends StatefulWidget {
  const Btns({Key? key}) : super(key: key);

  @override
  _BtnsState createState() => _BtnsState();
}

class _BtnsState extends State<Btns> {
  List<String> aski = [
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!'
  ];
  List<String> para = [
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
  ];
  List<String> gun = [
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];

  String yorum = "TIKLA FALIN GELSİN";

  void askDeger() {
    setState(() {
      int i;
      i = Random().nextInt(5);
      yorum = aski[i];
    });
  }

  void paraDeger() {
    setState(() {
      int i;
      i = Random().nextInt(5);
      yorum = para[i];
    });
  }

  void gunDeger() {
    setState(() {
      int i;
      i = Random().nextInt(5);
      yorum = gun[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          onPressed: askDeger,
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 40,
              ),
              title: Text(
                "AŞK DURUMU",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        FlatButton(
          onPressed: paraDeger,
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.green,
                size: 40,
              ),
              title: Text(
                "PARA DURUMU",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        FlatButton(
          onPressed: gunDeger,
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.explore,
                color: Colors.blueAccent,
                size: 40,
              ),
              title: Text(
                "GÜNLÜK TAVSİYE",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            yorum,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
