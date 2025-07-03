import 'package:flutter/material.dart';
import 'package:my_chatroom/core/constants/breakpoints.dart';
import 'package:my_chatroom/core/widgets/responsive_widget.dart';
import 'package:my_chatroom/features/chat/domain/messages_controller.dart';
import 'package:my_chatroom/features/chat/presentation/screens/chat_screen.dart';
import 'package:my_chatroom/features/user/domain/user_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MessagesController()),
        ChangeNotifierProvider(create: (context) => UserController()),
      ],
      child: const MyApp(),
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
      home: MyHomePage(
        title:
            'Chatroom demo. Logged in as ${Provider.of<UserController>(context).userName}.',
      ),
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

Future<void> modalBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final TextEditingController textController = TextEditingController();

      return AlertDialog(
        title: const Text("Set username"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter username"),
          maxLength: 9,
          onSubmitted: (String value) {
            handleUsernameChange(textController, context);
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Center(
            child: FloatingActionButton(
              child: const Text('Enter'),
              onPressed: () {
                handleUsernameChange(textController, context);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}

void handleUsernameChange(
  TextEditingController textController,
  BuildContext context,
) {
  final userController = Provider.of<UserController>(context, listen: false);
  userController.setUsername(textController.text);
  textController.clear();
}
