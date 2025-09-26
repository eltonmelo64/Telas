import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Navegação',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
        backgroundColor: Colors.indigo,
        elevation: 6,
        actions: [
          // Botão no canto superior direito
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              _showSettingsMenu(context);
            },
            tooltip: 'Configurações',
          ),
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              _showAppInfo(context);
            },
            tooltip: 'Informações',
          ),
        ],
      ),
      endDrawer: _buildSideMenu(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade100, Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 60, color: Colors.indigo),
                SizedBox(height: 20),
                Text(
                  'Seja Bem-vindo!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo.shade800,
                  ),
                ),
                SizedBox(height: 40),
                _buildCustomButton(
                  context: context,
                  text: 'Acessar Galeria',
                  icon: Icons.photo_library,
                  screen: SecondScreen(),
                  color: Colors.purple,
                ),
                SizedBox(height: 20),
                _buildCustomButton(
                  context: context,
                  text: 'Tela de Mapa',
                  icon: Icons.verified,
                  screen: ThirdScreen(),
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Configurações',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.palette, color: Colors.indigo),
                title: Text('Tema do App'),
                onTap: () {
                  Navigator.pop(context);
                  _showThemeOptions(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.indigo),
                title: Text('Notificações'),
                onTap: () {
                  Navigator.pop(context);
                  _showNotificationSettings(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.security, color: Colors.indigo),
                title: Text('Privacidade'),
                onTap: () {
                  Navigator.pop(context);
                  _showPrivacyInfo(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAppInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações do App'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Versão: 1.0.0'),
              SizedBox(height: 10),
              Text('Desenvolvido com Flutter'),
              SizedBox(height: 10),
              Text('© 2024 - Todos os direitos reservados'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _showThemeOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escolher Tema'),
          content: Text('Funcionalidade em desenvolvimento...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Configurações de Notificação'),
          content: Text('Funcionalidade em desenvolvimento...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPrivacyInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Política de Privacidade'),
          content: SingleChildScrollView(
            child: Text(
              'Este aplicativo respeita sua privacidade. Todos os dados são mantidos de forma segura e não são compartilhados com terceiros sem sua autorização explícita.',
              style: TextStyle(fontSize: 14),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Entendi'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSideMenu(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo.shade600, Colors.purple.shade600],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.indigo.shade800,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Menu Navegação',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildMenuOption(
              context: context,
              icon: Icons.home_filled,
              title: 'Tela Principal',
              onTap: () => Navigator.pop(context),
            ),
            Divider(color: Colors.white54, height: 1),
            _buildMenuOption(
              context: context,
              icon: Icons.collections,
              title: 'Galeria de Imagens',
              onTap: () => _navigateTo(context, SecondScreen()),
            ),
            Divider(color: Colors.white54, height: 1),
            _buildMenuOption(
              context: context,
              icon: Icons.task_alt,
              title: 'Tela de Confirmação',
              onTap: () => _navigateTo(context, ThirdScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      hoverColor: Colors.white24,
    );
  }

  Widget _buildCustomButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Widget screen,
    required Color color,
  }) {
    return ElevatedButton.icon(
      onPressed: () => _navigateTo(context, screen),
      icon: Icon(icon, size: 24),
      label: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
