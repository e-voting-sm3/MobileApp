import 'package:evoting/done_tourism_list.dart';
import 'package:evoting/list_item.dart';
import 'package:evoting/main.dart';
import 'package:evoting/model/tourism_place.dart';
import 'package:flutter/material.dart';

class TourismList extends StatefulWidget {
  final List<TourismPlace> doneTourismPlaceList;

  const TourismList({Key? key, required this.doneTourismPlaceList})
      : super(key: key);

  @override
  _TourismListState createState() => _TourismListState(doneTourismPlaceList);
}

class _TourismListState extends State<TourismList> {
  final List<TourismPlace> doneTourismPlaceList;
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Hutan Bambu',
      location: 'Keputih',
      description:
          'Sebuah lokasi kebun bambu yang menawarkan pemandangan Instagramable sekaligus sebagai suatu lokasi yang teduh di saat siang hari. Suhu udara kota yang cukup panas menyebabkan tempat wisata ini menjadi destinasi yang tepat pada siang hari',
      imageAsset: '../../assets/images/1.webp',
      calender: 'Senin - Jumat',
      clock: '08.00 - 17.00',
      price: 'Rp. 20.000',
    ),
    TourismPlace(
      name: 'Kebun Binatang',
      location: 'Wonokromo',
      description:
          'Kebun binatang ini terletak di Jalan Setail, daerah Darmo, Wonokromo. Pernah menjadi kebun binatang paling lengkap di Asia Tenggara dengan koleksi 211 spesies dan 2.236 binatang',
      imageAsset: '../../assets/images/2.webp',
      calender: 'Senin - Rabu',
      clock: '15.00 - 22.00',
      price: 'Rp. 25.000',
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun-alum contong',
      description:
          'Tugu ini berdiri di kawasan alun-alun dengan area rumput dan pohon-pohon rindang yang teduh. Di dekat area ini juga terdapat trotoar yang memiliki kanopi. Kawasan ini sangat terjaga kebersihannya dan sangat cocok menjadi tujuan akhir pekan untuk bersantai di tengah kota.',
      imageAsset: '../../assets/images/3.webp',
      calender: 'Sabtu - Minggu',
      clock: '06.00 - 12.00',
      price: 'Rp. 15.000',
    ),
    TourismPlace(
      name: 'Museum House of Sampoerna',
      location: 'Krembangan Utara',
      description:
          'Bangunan bergaya kolonial Belanda ini terletak di Jalan Taman Sampoerna Krembangan. Walaupun usianya sudah ratusan tahun, tetapi terlihat sebagai bangunan yang megah. Bagian depannya memiliki empat pilar kokoh yang menyerupai bentuk batangan rokok.',
      imageAsset: '../../assets/images/4.webp',
      calender: 'Setiap hari',
      clock: '24 jam',
      price: 'Rp. 50.000',
    ),
    TourismPlace(
      name: 'Taman Kenjeran',
      location: 'Sukolilo Baru',
      description:
          'Taman Kenjeran memiliki beberapa pilihan tempat berwisata yang menarik, antara lain waterboom, berbagai bangunan unik serta pantai. Menikmati sunset di senja hari sangat indah di tepi pantai. Menghabiskan waktu berenang, bermain dan berfoto di bangunan-bangunan unik tempat wisata ini juga menjadi hal menarik yang bisa Anda lakukan.',
      imageAsset: '../../assets/images/5.webp',
      calender: 'Minggu',
      clock: '09.00',
      price: 'Rp. 32.000',
    ),
    TourismPlace(
      name: 'Taman Air Mancur Menari Kenjeran',
      location: 'Kenjeran',
      description:
          'Jembatan Kenjeran sendiri didirikan pada tahun 2016 yang menghubungkan daerah Merr dan Laguna. Kawasan ini akhirnya menjadi salah satu pusat wisata malam di Surabaya yang sangat menarik untuk Anda kunjungi, terlebih jika Anda berasal dari luar kota..',
      imageAsset: '../../assets/images/6.webp',
      calender: 'Senin - Kamis',
      clock: '08.00 - 21.00',
      price: 'Rp. 21.000',
    ),
    TourismPlace(
      name: 'Taman Bungkul',
      location: 'Jalan Raya Darmo',
      description:
          'Taman ini baru diresmikan pada tahun 2007 dan memiliki wahana yang sangat lengkap antara lain taman hijau lengkap dengan kolam air mancur, wifi gratis, layanan telepon umum, plaza dan panggung hiburan, jogging track, BMX track, tempat anak-anak bermain hingga pusat kuliner.',
      imageAsset: '../../assets/images/7.webp',
      calender: 'Setiap hari',
      clock: '18.00 - 00.00',
      price: 'Rp. 12.000',
    ),
    TourismPlace(
      name: 'Kebun Bibit Wonorejo',
      location: 'Wonorejo',
      description:
          'Taman ini beroperasi sejak tahun 2011 dan menjadi salah satu tempat untuk rileks di tengah hiruk pikuk suasana kota.Di taman ini Anda bisa menyaksikan pemandangan hijau, pohon-pohon yang rindang untuk bersantai dengan suasana yang teduh. Terdapat kolam-kolam kecil yang bisa menjadi spot cantik berfoto.',
      imageAsset: '../../assets/images/8.webp',
      calender: 'Jumat',
      clock: '14.00 - 16.00',
      price: 'Rp. 55.000',
    ),
    TourismPlace(
      name: 'Taman Prestasi',
      location: 'Jalan Ketapang Kali',
      description:
          'Kawasan taman seluas 6000 meter persegi ini sudah berdiri sejak tahun 1992. Lokasinya yang berada di pusat kota membuat taman ini menjadi salah satu yang paling banyak menjadi destinasi warga.',
      imageAsset: '../../assets/images/9.webp',
      calender: 'Senin - Jumat',
      clock: '08.00 - 19.00',
      price: 'Rp. 15.000',
    ),
    TourismPlace(
      name: 'Mangrove Tour Wonorejo',
      location: 'Wonorejo',
      description:
          'Di tempat ini memiliki banyak hal menarik yang bisa Anda coba. Di antaranya adalah menjelajah kawasan hutan menggunakan perahu dengan biaya penyewaan. Selain itu ada juga kolam pancing, jogging track, pendopo, kantin-kantin pusat kuliner, spot berfoto dan lainnya..',
      imageAsset: '../../assets/images/10.webp',
      calender: 'Senin - Rabu',
      clock: '07.00 - 12.00',
      price: 'Rp. 25.000',
    ),
  ];

  _TourismListState(this.doneTourismPlaceList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: ListItem(
              place: place,
              isDone: doneTourismPlaceList.contains(place),
              onCheckboxClick: (bool? value) {
                setState(() {
                  if (value != null) {
                    value
                        ? doneTourismPlaceList.add(place)
                        : doneTourismPlaceList.remove(place);
                  }
                });
              }),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}
