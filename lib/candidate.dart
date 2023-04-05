class Candidate {
  final String id;
  final String name;
  final String image;
  final String visi;

  Candidate(this.id, this.name, this.image, this.visi);
}

final List<Candidate> candidates = [
  Candidate('1', 'Jokowi & Puan', 'candidate1.png',
      'Menciptakan kehidupan yang aman, tentram, adil, dan makmur untuk masyarakat sekitar sembari membangun lingkungan desa yang lebih tertata.'),
  Candidate('2', 'Prabowo & Megawati', 'candidate2.png',
      'Menciptakan Indonesia yang bebas dari narkoba dan menjauhkan generasi muda dari bahaya narkotika, zat aditif serta psikotropika.'),
  Candidate('3', 'Ganjar & Risma', 'candidate3.png',
      'Meningkatkan kinerja sumber daya manusia pada proses pengolahan untuk memelihara kualitas bahan baku'),
];
