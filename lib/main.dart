import 'package:flutter/material.dart';
import 'package:flutter_mockup_discord/models/channels.dart';

void main() => runApp(MaterialApp(
      title: "Discord Mock-up",
      home: App(),
    ));

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: Drawer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildGroupNavigation(),
            buildChannels(),
          ],
        ),
      ),
      body: Container(
        child: Text("data"),
      ),
    );
  }

  Expanded buildChannels() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 22),
            color: Colors.grey[850],
            child: ListTile(
              title: Text(
                "freecodecamp.Manila",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.white54,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[850],
              child: ListView(
                children: channels.map((c) {
                  return Menu(
                      title: c.name,
                      children: c.groups.map((f) {
                        print(f);
                        return MenuItem(title: f.name);
                      }).toList());
                }).toList(),
              ),
              // child: ListView(
              //   children: <Widget>[
              //     new Menu(
              //       title: "Menu 2",
              //     ),
              //     new Menu(
              //       title: "Menu 3",
              //     ),
              //     new Menu(
              //       title: "Menu 4",
              //     ),
              //   ],
              // )
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildChannel({String text, IconData icon}) {
    return ListTile(
      selected: true,
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white54,
            size: 14,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      // leading: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        print("object");
      },
    );
  }

  buildGroupNavigation() {
    return Container(
      color: Colors.black87,
      width: 75,
      child: ListView(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.people_outline,
              color: Colors.white54,
            ),
            onPressed: () {},
          ),
          Divider(
            color: Colors.white70,
          ),
          CircularButton(
            icon: Icons.gesture,
          ),
          SizedBox(
            height: 16,
          ),
          CircularButton(
            icon: Icons.g_translate,
          ),
          SizedBox(
            height: 16,
          ),
          CircularButton(
            icon: Icons.free_breakfast,
          ),
          SizedBox(
            height: 16,
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: OutlineInputBorder(),
            padding: EdgeInsets.all(14),
            child: Icon(
              Icons.add,
              color: Colors.white54,
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Discord"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.people),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );
  }
}

class MenuItem {
  final String title;
  final IconData leading;
  final IconData trailing;

  MenuItem({this.title, this.leading, this.trailing});
}

class Menu extends StatelessWidget {
  final String title;
  final IconData leading;
  final IconData trailing;
  final List<MenuItem> children;

  const Menu(
      {Key key,
      @required this.title,
      this.leading,
      this.trailing,
      this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                leading ?? (Icons.keyboard_arrow_down),
                color: Colors.white54,
                size: 14,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          buildSubmenus()
        ],
      ),
    );
  }

  buildSubmenus() {
    if (children == null) return Container();
    if (children.length == 0) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.map((m) => buildSubmenu(title: m.title)).toList(),
    );
  }

  Container buildSubmenu({String title}) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 16, 16, 8),
      child: Text(
        "# $title",
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Function onPress;
  final IconData icon;

  const CircularButton({Key key, this.icon, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Colors.white,
      padding: EdgeInsets.all(14),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
