import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemples de données simulées (en production, récupère depuis une base ou API)
    final runGroups = [
      {
        'title': 'May 2018 (03 Runs)',
        'distance': '15 km',
        'duration': '02:50:51',
        'calories': '1540 kCal',
        'runs': [
          {
            'date': 'Thu 17, 10:40am',
            'distance': '7.45 km in 1:10:44',
          },
          {
            'date': 'Mon 16, 07:03am',
            'distance': '6.05 km in 1:10:44',
          },
          {
            'date': 'Sun 15, 09:45am',
            'distance': '1.5 km in 0:06:44',
          },
        ],
      },
      {
        'title': 'April 2018 (10 Runs)',
        'distance': '347 km',
        'duration': '07:45:50',
        'calories': '3490 kCal',
        'runs': [
          {
            'date': 'Thu 17, 10:40am',
            'distance': '7.45 km in 1:10:44',
          },
          {
            'date': 'Mon 16, 07:03am',
            'distance': '6.05 km in 1:10:44',
          },
          // ... plus de runs si besoin
        ],
      },
      // Ajoute d'autres mois ici
    ];

    return Scaffold(
      // Barre d'app en haut
      appBar: AppBar(
        title: const Text('Run History'),
        backgroundColor: Colors.deepPurple.shade700,
        elevation: 0,
      ),
      // Corps principal avec un dégradé en fond
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3E1E68), Color(0xFF171B2F)], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: runGroups.length,
          itemBuilder: (context, index) {
            final group = runGroups[index];
            final runs = group['runs'] as List<dynamic>;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre de la section : ex "May 2018 (03 Runs)"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    '${group['title']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Statistiques principales (distance, durée, calories)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                  child: Row(
                    children: [
                      _statChip(Icons.map, '${group['distance']}'),
                      const SizedBox(width: 8),
                      _statChip(Icons.timer, '${group['duration']}'),
                      const SizedBox(width: 8),
                      _statChip(Icons.local_fire_department, '${group['calories']}'),
                    ],
                  ),
                ),
                // Liste des runs du mois
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: runs.length,
                  itemBuilder: (context, runIndex) {
                    final run = runs[runIndex];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      child: Card(
                        color: Colors.white.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.directions_run,
                            color: Colors.white,
                          ),
                          title: Text(
                            '${run['date']}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${run['distance']}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  // Petit widget réutilisable pour afficher une stat (icône + texte)
  Widget _statChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
