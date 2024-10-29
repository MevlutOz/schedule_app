import 'package:btk_hackathon/ui/anasayfa.dart';
import 'package:flutter/material.dart';

class UyeGiris extends StatefulWidget {
  const UyeGiris({super.key});

  @override
  State<UyeGiris> createState() => _UyeGirisState();
}

class _UyeGirisState extends State<UyeGiris> {
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Üye Giriş"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 20.0, bottom: 20.0),
              child: TextField(
                controller: tfKullaniciAdi,
                decoration: const InputDecoration(hintText: "Kullanıcı adını giriniz"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 20.0, bottom: 20.0),
              child: TextField(
                controller: tfSifre,
                decoration: const InputDecoration(hintText: "Şifrenizi Giriniz"),
                obscureText: true,
              ),
            ),
            SizedBox(width: 150,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }, child: const Text("Giriş")),
            )

            ],
          ),
      ),
    );
  }
}
