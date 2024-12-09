import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../home/navigation/home_graph.dart';
import 'bloc/sign_in_bloc.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailTextEditingController = useTextEditingController();
    var passwordTextEditingController = useTextEditingController();

    var passwordVisible = useState(false);

    return BlocListener<SignInBloc, SignInPageState>(
      listenWhen: (previous, current) => previous.message != current.message && current.message != null,
      listener: (context, state) {
        final message = state.message;
        if (message != null) {
          _showMyDialog(message,context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: emailTextEditingController,
              textCapitalization: TextCapitalization.words,
              onChanged: (firstName) {},
              autovalidateMode: AutovalidateMode.always,
              validator: (input) {
                var isValid = input?.isValidEmail();
                return isValid == true ? null : "Incorrect email";
              },
              decoration: const InputDecoration(
                hintText: "Email",
                errorText: "Incorrect email",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: passwordTextEditingController,
              obscureText: !passwordVisible.value, //This will obscure text dynamically
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                // Here is key idea
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    passwordVisible.value = !passwordVisible.value;
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignInEvent.signIn(email: emailTextEditingController.text, password: passwordTextEditingController.text));
              },
              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String message,BuildContext context) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                HomeRoute().go(context);
              },
            ),
          ],
        );
      },
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }
}
