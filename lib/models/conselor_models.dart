class CounselorModels {
  final String name;
  final List<String> tags;
  final String rating;
  final String description;
  final String imageUrl;

  CounselorModels({
    required this.name,
    required this.tags,
    required this.rating,
    required this.description,
    required this.imageUrl,
  });
}

// List data konselor / guru
final dummyCounselors = [
  CounselorModels(
    name: 'Ms. Nadine Pratama, S.Psi.',
    tags: ['Akademik', 'Tips'],
    rating: '4.9',
    description:
        'Berpengalaman lebih dari 8 tahun dalam membantu meringankan berbagai indikasi gangguan.',
    imageUrl:
        'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=300',
  ),
  CounselorModels(
    name: 'Ms. Samantha Ng, S.Pd',
    tags: ['Akademik', 'Semua'],
    rating: '4.9',
    description:
        'Berpengalaman lebih dari 8 tahun dalam membantu mahasiswa mengatasi mental health.',
    imageUrl:
        'https://images.unsplash.com/photo-1580894732444-8ecded7900cd?q=80&w=300',
  ),
  CounselorModels(
    name: 'Ms. Cheryl Tan, S.Psi, M. Psi',
    tags: ['Akademik', 'Keluarga'],
    rating: '4.9',
    description:
        'Berpengalaman lebih dari 8 tahun dalam membantu mahasiswa mengatasi mental health.',
    imageUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=300',
  ),
  CounselorModels(
    name: 'Mr. Illiyin, S.Psi, M.Psi',
    tags: ['Akademik', 'Keluarga'],
    rating: '4.9',
    description:
        'Berpengalaman lebih dari 8 tahun dalam membantu mahasiswa mengatasi mental health.',
    imageUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=300',
  ),
];