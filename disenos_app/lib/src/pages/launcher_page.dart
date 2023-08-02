import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appTheme.colorScheme.secondary,
          title: const Text('Diseños en Flutter - Telefono'),
        ),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageRoutes[i].page,
              ));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/anhdaidien.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          const SizedBox(height:20),
          const Text("08_DH_TMDT Nguyen Van Quang"),
          Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: accentColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          SafeArea(
            top: false,
            left: false,
            right: false,
            bottom: true,
            child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: accentColor,
              ),
              title: const Text('Custom theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: (value) => appTheme.customTheme = value),
            ),
          )
        ],
      ),
    );
  }
}
