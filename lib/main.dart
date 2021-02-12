import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B. Cihan Cengiz',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(body: Page()),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(maxWidth: 720),
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                // top
                Container(
                  width: double.maxFinite,
                  // constraints: BoxConstraints(maxWidth: 320),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blueGrey, Colors.deepPurple]),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8))),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AvatarWidget(),
                        SkillsTagCloud(),
                      ],
                    ),
                  ),
                ),
                // header
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeaderWidget(),
                      SizedBox(height: 16),
                      BodyWidget(),
                      TimelinesWidget(),
                    ],
                  ),
                ),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.deepPurple]),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
      child: Wrap(
        children: [
          ContactsWidget(),
          MadebyFlutterWidget(),
          // LanguageToggleButtonsWidget(),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Selam ben Cihan,",
            style: TextStyle(fontSize: 28),
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Text(
        "2 yildir Flutter catisi ile mobil ve web uygulamalari gelistiriyorum. "
        "Bireysel ve ekip olarak bir cok projede tasarimci ve gelistirici olarak calistim. "
        "Bunlardan bir kismini kaynak kodlari ile birlikte hemen asagida gorebilirsiniz. "
        "Firsat buldukca Flutter ve Dart hakkinda icerikler olusturmaya calisiyorum. "
        "Su siralarda golang, swift ve kotlin ile ilgileniyorum. "
        "Dileginiz kanaldan benimle iletisime gecmekten cekinmeyin ^^",
      ),
    );
  }
}

class TimelinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TimelineTile(
          oppositeContents: TimelineNodeLeftSideWidget(
            projects: [
              ProjectsModel(
                  name: 'Yonder',
                  source: 'https://github.com/TeamEPIC/flutter_hackathon_21',
                  icon: FontAwesomeIcons.github),
              ProjectsModel(
                  name: 'SwapiMiner',
                  source: 'https://github.com/bcihanc/flutter_api_sample',
                  icon: FontAwesomeIcons.github),
              ProjectsModel(
                  name: 'Shopzone',
                  source:
                      'https://github.com/bcihanc/flutter_shoppingapp_sample',
                  icon: FontAwesomeIcons.github),
              ProjectsModel(
                  name: 'Tasky',
                  source: 'https://github.com/bcihanc/flutter_todo_sample',
                  icon: FontAwesomeIcons.github),
              ProjectsModel(
                  name: 'Trailerify',
                  source: 'https://github.com/bcihanc/flutter_videoapp_sample',
                  icon: FontAwesomeIcons.github),
            ],
          ),
          contents: TimelineNodeRightSideWidget(
            company: 'Samples',
            title: 'Flutter Dev - 2021',
            body:
                "Hem egitim hemde portfolio amacli yarattigim bir kac uygulama, rest api isteklerini, local veritabani kontrollerini ve state yonetimi gibi konulara nasil yaklastigimi bu projelerden gorebilirsiniz.",
          ),
          node: TimelineNode(
            indicator: OutlinedDotIndicator(),
            startConnector: TransparentConnector(),
            endConnector: SolidLineConnector(),
          ),
        ),
        TimelineTile(
          oppositeContents: TimelineNodeLeftSideWidget(
            projects: [
              ProjectsModel(
                  name: 'reff',
                  source: 'https://github.com/bcihanc/reff',
                  icon: FontAwesomeIcons.github),
              ProjectsModel(
                  name: 'reff web',
                  source: 'https://github.com/bcihanc/reff_web',
                  icon: FontAwesomeIcons.github),
              ProjectsModel(
                  name: 'reff shared',
                  source: 'https://github.com/bcihanc/reff_shared',
                  icon: FontAwesomeIcons.github),
            ],
          ),
          contents: TimelineNodeRightSideWidget(
            company: 'Kare Agency',
            title: 'Flutter Dev - 2020',
            body:
                "Firebase'in neredeyse tum yeteneklerini kullanan bir anket uygulamasi, mobil taraf kullanicilarla etkilesime gecen modul, web tarafi veritabanini ve istatistikleri yoneten modul.",
          ),
          node: TimelineNode(
            indicator: OutlinedDotIndicator(),
            startConnector: SolidLineConnector(),
            endConnector: SolidLineConnector(),
          ),
        ),
        TimelineTile(
          oppositeContents: TimelineNodeLeftSideWidget(
            projects: [
              ProjectsModel(
                  name: 'Easy Workouts',
                  source:
                      'https://play.google.com/store/apps/details?id=com.greycatapps.workouts&hl=en&gl=US',
                  icon: FontAwesomeIcons.android),
              ProjectsModel(
                  name: "Smoker's Calc",
                  source:
                      'https://play.google.com/store/apps/details?id=com.greycatapps.smokerscalc&hl=en&gl=US',
                  icon: FontAwesomeIcons.android),
            ],
          ),
          contents: TimelineNodeRightSideWidget(
            company: 'Grey Cat Apps',
            title: 'Flutter Dev - 2019',
            body:
                "Flutter ile birlikte gecirdigimiz ilk 6 ay icinde ortaya cikan 2 kucuk uygulama, AppStore ve Play Store icin yayinlama ve guncelleme deneyimi.",
          ),
          node: TimelineNode(
            indicator: OutlinedDotIndicator(),
            startConnector: SolidLineConnector(),
            endConnector: TransparentConnector(),
          ),
        ),
      ],
    );
  }
}

class ProjectsModel {
  final String name;
  final String source;
  final IconData icon;

  const ProjectsModel({this.name, this.source, this.icon});
}

class TimelineNodeLeftSideWidget extends StatelessWidget {
  /// project name, source and icon
  final List<ProjectsModel> projects;

  const TimelineNodeLeftSideWidget({
    Key key,
    this.projects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: projects.map((project) {
            return TextButton.icon(
                style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    textStyle: TextStyle(fontSize: 12)),
                onPressed: () => launchUrl(project.source),
                icon: Icon(project.icon, size: 12),
                label: Text(
                  project.name,
                  overflow: TextOverflow.ellipsis,
                ));
          }).toList(),
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/avatar.jpg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

class NameAndTitleWidget extends StatelessWidget {
  const NameAndTitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cihan Cengiz',
          style: TextStyle(fontSize: 24),
        ),
        Text('Flutter Dev'),
      ],
    );
  }
}

class LanguageToggleButtonsWidget extends StatefulWidget {
  const LanguageToggleButtonsWidget({
    Key key,
  }) : super(key: key);

  @override
  _LanguageToggleButtonsWidgetState createState() =>
      _LanguageToggleButtonsWidgetState();
}

class _LanguageToggleButtonsWidgetState
    extends State<LanguageToggleButtonsWidget> {
  final isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        constraints: BoxConstraints(minHeight: 28, minWidth: 28),
        onPressed: (index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = false;
              }
            }
          });
        },
        children: [Text('tr'), Text('en')],
        isSelected: isSelected);
  }
}

class MadebyFlutterWidget extends StatelessWidget {
  const MadebyFlutterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Made by'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset('assets/flutter.png', height: 16, width: 16),
          ),
          Text('Web with'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Icon(FontAwesomeIcons.solidHeart, size: 16, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class SkillsTagCloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(FontAwesomeIcons.fire),
      title: Container(
        padding: const EdgeInsets.all(8),
        width: double.maxFinite,
        child: Text('Skills'),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: double.maxFinite,
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              MyChip(icon: FontAwesomeIcons.github, label: 'git'),
              MyChip(icon: FontAwesomeIcons.code, label: 'Dart'),
              MyChip(icon: FontAwesomeIcons.code, label: 'C#'),
              MyChip(icon: FontAwesomeIcons.code, label: 'JavaScript'),
              MyChip(icon: FontAwesomeIcons.code, label: 'TypeScript'),
              MyChip(icon: FontAwesomeIcons.code, label: 'HTML'),
              MyChip(icon: FontAwesomeIcons.code, label: 'CSS'),
              MyChip(icon: FontAwesomeIcons.code, label: 'XML'),
              MyChip(icon: FontAwesomeIcons.code, label: 'YAML'),
              MyChip(icon: FontAwesomeIcons.code, label: 'JSON'),
              MyChip(icon: FontAwesomeIcons.meteor, label: 'Kanban'),
              MyChip(icon: FontAwesomeIcons.meteor, label: 'Agile'),
              MyChip(icon: FontAwesomeIcons.meteor, label: 'Scrum'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'JetBrains'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'VSCode'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'Photoshop'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'Illustrator'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'Illustrator'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'XD'),
              MyChip(icon: FontAwesomeIcons.edit, label: 'Sketch'),
              MyChip(icon: FontAwesomeIcons.weebly, label: 'HTTP'),
              MyChip(icon: FontAwesomeIcons.weebly, label: 'REST'),
              MyChip(icon: FontAwesomeIcons.weebly, label: 'GraphQL'),
              MyChip(icon: FontAwesomeIcons.brain, label: 'OOP'),
              MyChip(icon: FontAwesomeIcons.brain, label: 'Design Patterns'),
              MyChip(icon: FontAwesomeIcons.brain, label: 'SOLID & DRY'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'NodeJS'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Vue'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Wordpress'),
              MyChip(icon: FontAwesomeIcons.fire, label: '.NET'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Flutter'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Docker'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Firebase'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'MongoDB'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'MySQL'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'PostgreSQL'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'UI & UX'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'CI/CD'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Unit Test'),
              MyChip(icon: FontAwesomeIcons.fire, label: 'Integration Test'),
            ],
          ),
        )
      ],
    );
  }
}

class MyChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const MyChip({
    Key key,
    this.icon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 10),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class MouseHoverColorChangerWidget extends StatefulWidget {
  const MouseHoverColorChangerWidget({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _MouseHoverColorChangerWidgetState createState() =>
      _MouseHoverColorChangerWidgetState();
}

class _MouseHoverColorChangerWidgetState
    extends State<MouseHoverColorChangerWidget> {
  var _onHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: _onHover
              ? Theme.of(context).accentColor.withOpacity(0.3)
              : Colors.transparent,
          child: widget.child),
      onHover: (event) {
        if (!_onHover) {
          setState(() => _onHover = true);
        }
      },
      onExit: (event) {
        if (_onHover) {
          setState(() => _onHover = false);
        }
      },
    );
  }
}

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(iconTheme: Theme.of(context).iconTheme.copyWith(size: 16)),
      child: ListView(
        shrinkWrap: true,
        children: [
          MouseHoverColorChangerWidget(
            child: ListTile(
                onTap: () {
                  final emailLaunchUri = Uri(
                    scheme: 'tel',
                    path: '+905322709042',
                  );

                  launchUrl(emailLaunchUri.toString());
                },
                dense: true,
                leading: Icon(Icons.phone),
                trailing: Icon(Icons.open_in_new),
                title: Text('+90 532 270 9042')),
          ),
          MouseHoverColorChangerWidget(
            child: ListTile(
                dense: true,
                trailing: Icon(Icons.open_in_new),
                leading: Icon(Icons.map),
                onTap: () => launchUrl('https://goo.gl/maps/uNwpVGUNRcqd1bz36'),
                title: Text('Antalya / Turkey')),
          ),
          MouseHoverColorChangerWidget(
            child: ListTile(
                dense: true,
                leading: Icon(Icons.mail),
                title: Text(
                  'b.cihancengiz@gmail.com',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(Icons.open_in_new),
                onTap: () {
                  final emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'b.cihancengiz@gmail.com',
                  );

                  launchUrl(emailLaunchUri.toString());
                }),
          ),
          MouseHoverColorChangerWidget(
            child: ListTile(
                onTap: () => launchUrl('https://bcihanc.medium.com'),
                dense: true,
                leading: Icon(Icons.link),
                trailing: Icon(Icons.open_in_new),
                title: Text('Medium')),
          ),
          MouseHoverColorChangerWidget(
            child: ListTile(
                dense: true,
                leading: Icon(FontAwesomeIcons.github),
                trailing: Icon(Icons.open_in_new),
                onTap: () => launchUrl('https://github.com/bcihanc'),
                title: Text('Github')),
          )
        ],
      ),
    );
  }
}

Future<bool> launchUrl(String url) async {
  if (await canLaunch(url)) {
    return await launch(url);
  }
  return false;
}

class TimelineNodeRightSideWidget extends StatelessWidget {
  final String company;
  final String title;
  final String body;

  const TimelineNodeRightSideWidget(
      {Key key, this.company, this.title, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(company),
          SizedBox(height: 4),
          Opacity(
              opacity: 0.4,
              child: Text(
                title,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
              )),
          Divider(),
          Opacity(
              opacity: 0.4,
              child: Text(body,
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12)))
        ],
      ),
    );
  }
}
