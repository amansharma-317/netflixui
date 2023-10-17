class Episode {
  final int episodeNumber;
  final String title;
  final String description;
  final String duration;

  Episode(
      {required this.episodeNumber,
        required this.title,
        required this.description,
        required this.duration});
}

final List<Episode> episodes = [
  Episode(episodeNumber: 1, title: 'Solaricks', description: 'They\'re back...and right where we left em. Without a portal gun, Rick and Morty are stranded as they float through space in the ruins of the Citadel.',
      duration: '22m'),
  Episode(episodeNumber: 1, title: 'Solaricks', description: 'They\'re back...and right where we left em. Without a portal gun, Rick and Morty are stranded as they float through space in the ruins of the Citadel.',
      duration: '22m'),
  Episode(episodeNumber: 1, title: 'Solaricks', description: 'They\'re back...and right where we left em. Without a portal gun, Rick and Morty are stranded as they float through space in the ruins of the Citadel.',
      duration: '22m')
  // Add more episodes here
];