library wheren.globals;

import 'main.dart';

String firtname = 'George';
String lastname = 'Papadopoulos';
int level = 2;

void progress(double x) {
  progression += x;
  if (progression >= 1) {
    progression -= 1;
    level++;
  }
}

double progression = 0.9;
List<Event> myeventslist = <Event>[
  Event(
      OnomaEvent: 'New Years Eve Party',
      OnomaDiorganwti: 'Nikos',
      EpithetoDiorganwti: 'Kalantas',
      meros: 'Clumsies, Athens',
      hmeromhnia: DateTime(2022, 12, 31, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
];
List<Event> allevents = <Event>[
  Event(
      OnomaEvent: 'Tropical The Party',
      OnomaDiorganwti: 'Aggelos',
      EpithetoDiorganwti: 'Dimitriou',
      meros: 'Gazi Music Hall, Athens',
      hmeromhnia: DateTime(2023, 02, 19, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(days: 30)),
  Event(
    OnomaEvent: 'House Festival',
    OnomaDiorganwti: 'Reece',
    EpithetoDiorganwti: 'Johnson',
    meros: 'Technopolis Gazi, Athens',
    hmeromhnia: DateTime(2023, 02, 20, 17, 0, 0),
    perigrafh:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    diarkeia: const Duration(hours: 99),
    eikona: './assets/images/festival.jpg',
  ),
  Event(
      OnomaEvent: 'Triton',
      OnomaDiorganwti: 'Nikos',
      EpithetoDiorganwti: 'Matsamplokos',
      meros: 'Naustathmos, Salamina',
      hmeromhnia: DateTime(2023, 03, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
  Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 03, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
  Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 03, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
];
