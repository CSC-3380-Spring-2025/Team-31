//
// login_screen.dart
//
// The login screen
//

import '../assets/essential.dart';

//
// Example 1: Sample Screen Stack
//
// Screen Widget Template
//
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                TextFieldEmail(),
                TextFieldPassword(),
                ElevatedButton(
                  onPressed: () {
                    ;
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ;
                  },
                  child: const Text('Create Account'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ;
                  },
                  child: const Text('Login With Google'),
                ),
                // Array of page content (widgets) to be stacked into scrolling column.
                // Widgets prefixed with a "_" are screen-specific (non-reusable)
                _PageHeader(text: "Study Hall"),
                Text("This is content on the page."),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TextFieldPassword extends TextField {
  TextFieldPassword({super.key});
  final TextEditingController _controller = TextEditingController();
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: _controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: 'Enter Password',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class TextFieldEmail extends TextFormField {
  TextFieldEmail({super.key});

  //Future<State<TextFormFieldEmail>> TextFormFieldEmail.createState() async => _TextFormFieldEmailState();
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Email Address',
      ),
    );
  }
}

class _TextFormFieldEmailState extends State<TextFieldEmail> {
  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>;
  String? forceErrorText;
  bool isLoading = false;

  @override
  Future<void> dispose() async {
    controller.dispose();
    super.dispose();
  }

  //email validator
  String? validator(String? value) {
    //check to see if field is empty
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    //checks to see if any spaces are present
    if (value.length != value.replaceAll(' ', '').length) {
      return 'Email must not contain any spaces';
    }
    //ensures email has @ sign
    if (!value.contains('@')) {
      return 'Must be a valid email address';
    }
    //ensures email has appropriate ending
    if (!value.contains('.com') ||
        !value.contains('.org') ||
        !value.contains('.edu') ||
        !value.contains('.net')) {
      return 'Must be a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // // TODO: implement build
    throw UnimplementedError();
  }
}

class ObscuredTextFormField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return throw UnimplementedError();
  }
}
//
// Example 2: Screen-Specific Widgets
//
// Screen-Specific Stateless Widget Template
//
// (non-reusable widgets prefixed with _)
// Define below the primary widget; move reusable widgets to lib/src/widgets/
//

class _PageHeader extends StatelessWidget {
  final String text;
  const _PageHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

typedef HeaderBuilder =
    Widget Function(
      BuildContext context,
      BoxConstraints constraints,
      double shrinkOffset,
    );
