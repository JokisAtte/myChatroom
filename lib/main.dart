import 'package:flutter/material.dart';
import 'package:my_chatroom/core/constants/breakpoints.dart';
import 'package:my_chatroom/features/chat/domain/messagesController.dart';
import 'package:my_chatroom/features/chat/presentation/screens/chatScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MessagesController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatroom demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Chatroom demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: MobileView(title: widget.title),
      desktop: DesktopView(title: widget.title),
    );
  }
}

class MobileView extends StatelessWidget {
  final String title;

  const MobileView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationView(title: title);
  }
}

class DesktopView extends StatelessWidget {
  final String title;
  const DesktopView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(color: Theme.of(context).colorScheme.secondary),
        ),
        SizedBox(
          width: AppBreakpoints.mobile,
          child: ApplicationView(title: title),
        ),
        Expanded(
          child: Container(color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }
}

class ApplicationView extends StatelessWidget {
  final String title;

  const ApplicationView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(child: Chatscreen()),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (context.screenWidth < AppBreakpoints.mobile) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
