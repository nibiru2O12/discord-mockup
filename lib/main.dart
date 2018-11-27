import 'package:flutter/material.dart';
import 'package:flutter_mockup_discord/common/ColumnWithSeparator.dart';
import 'package:flutter_mockup_discord/models/channels.dart';
import 'package:flutter_mockup_discord/models/groups.dart';

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
      drawer: NavigationDrawer(),
      body: Container(
        child: Text("data"),
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


class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildDrawer(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  buildGroupNavigation(),
                  buildChannels(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 65,
              color: Colors.grey[850],
              child: Row(
                children: <Widget>[
                  buildNavigationBottomBottun(icon: Icons.account_circle,size: 40),
                  buildNavigationBottomTitle(),
                  buildNavigationBottomBottun(icon: Icons.find_in_page),
                  buildNavigationBottomBottun(icon: Icons.alternate_email),
                  buildNavigationBottomBottun(icon: Icons.settings),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildNavigationBottomTitle() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 0, 4, 0),
        child: ColumnWithSeparator(
          margin: EdgeInsets.symmetric(vertical: 3),
          children: <Widget>[
            Text(
              "rjgagui",
              style: TextStyle(color: Colors.white, fontSize:16),
            ),
            Text(
              "#1233",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Material buildNavigationBottomBottun({IconData icon, Function onTap, double size}) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.all(6),
            child: Icon(
              icon,
              color: Colors.white,
              size: size ?? 26,
            )),
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
          ColumnWithSeparator(
            margin: EdgeInsets.only(bottom: 12),
            children: groups
                .map((g) => CircularButton(
                      icon: Icons.gesture,
                    ))
                .toList(),
          ),
          CircularButton(
            icon: Icons.add,
          )
        ],
      ),
    );
  }
}


class MenuItem {
  final String title;
  final IconData leading;
  final IconData trailing;

  MenuItem({this.title, this.leading, this.trailing});
}

class Menu extends StatefulWidget {
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
  MenuState createState() {
    return new MenuState();
  }
}

class MenuState extends State<Menu> {
  bool _isOpen = false;

  _toggleOpen() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildMenuButton(
              leading: widget.leading, title: widget.title, onTap: _toggleOpen),
          buildSubmenus()
        ],
      ),
    );
  }

  Material buildMenuButton({IconData leading, Function onTap, String title}) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 6),
                child: Icon(
                  leading ?? (Icons.keyboard_arrow_down),
                  color: Colors.white54,
                  size: 14,
                ),
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
        ),
      ),
    );
  }

  buildSubmenus() {
    if (widget.children == null || !_isOpen) return Container();
    if (widget.children.length == 0) return Container();

    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.children
            .map((m) => buildMenuButton(
                title: m.title, onTap: () {}, leading: Icons.filter))
            .toList(),
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
    return OutlineButton(
      splashColor: Colors.white54,
      onPressed: () {},
      shape: CircleBorder(),
      // fillColor: Colors.white,
      padding: EdgeInsets.all(14),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
