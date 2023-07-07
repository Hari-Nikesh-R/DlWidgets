# DlWidgets

DlWidgets is a Flutter library that aims to simplify the development process by providing a collection of useful and customizable widgets.

## Features

- **Design Widgets:** Reduced time in developing password text field and normal text field. All the Widgets are pre-built developed.
- 
## Installation

To use DlWidgets in your Flutter project, you need to add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  dl_widgets: ^1.0.0
```

Then, run the following command to fetch the package:

```bash
flutter pub get
```

## Usage
Import the DlWidgets package into your Dart file:

import 'package:dl_widgets/dl_widgets.dart';

Now, you can start using the DlWidgets library. Here's an example of how to use one of the widgets:

## Login page Demo
```dart

import 'package:dlwidgets/dlwidgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _State();
}

class _State extends State<LoginPage> {

  String? token;
  String? emailError;
  String? passwordError;
  String? tickerMessage;
  TickerType? tickerType;

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login(String email, String password, BuildContext context) async {
    token = "Make an API CALL for getting";
    setState(() {
      if(token!=null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Authenticated")
        ));
        tickerMessage = "Authenticated";
        tickerType = TickerType.success;
      }
      else{
        showDialog(context: context, builder: (context) => DlAlertDialog(dlAlertDialogImpl: alertDialog, showDialogFlag: showDialogF));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid user")
        ));
        tickerMessage = "Invalid user";
        tickerType = TickerType.error;
      }
    });
  }

  TextEditingController textEditingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late DlTextFormFieldImpl emailField;
  late DlAlertDialogImpl alertDialog;
  late DlTextFormFieldImpl passWordField;
  @override
  void initState() {

    alertDialog = DlAlertDialogImpl(title: Text("Invalid User"), content: Text("Not allowed"), positiveAction: ElevatedButton(onPressed:(){}, child: Text("Yes")), negativeAction: ElevatedButton(onPressed:(){}, child: Text("No")), backgroundColor: Colors.white, shape: DialogShape.curved);

    emailField = DlTextFormFieldImpl(TextEditingController(), (value) {
      setState(() {
        emailField.errorText = null;
        passWordField.errorText = null;
      });
    }, emailError, "Email");
    passWordField = DlTextFormFieldImpl(TextEditingController(), (value) {
      setState(() {
        emailField.errorText = null;
        passWordField.errorText = null;
      });
    }, passwordError, "Password");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/5), child:
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3), child: DlCardView(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DlTextFormField(isCenter: false, activeColor: Colors.blue, isPassword: false, input: emailField),
                        DlTextFormField(isCenter: false, activeColor: Colors.blue, isPassword: true, input: passWordField),
                        tickerType != null ? DlTicker(textInfo: tickerMessage??"", tickerType: tickerType) : Container()
                      ],
                    ),
                  )),
                  DlButton(buttonName: "Login", size: ButtonSize.small, onPressed: (){
                    setState(() {
                      if(emailField.textFieldController.text.isEmpty){
                        emailField.errorText = "Email must not be empty";
                      }
                      if(passWordField.textFieldController.text.isEmpty){
                        passWordField.errorText = "Password must not be empty";
                      }
                    });
                    login(emailField.textFieldController.text, passWordField.textFieldController.text, context);
                  }, buttonColor:  Colors.blue),
                  Center(
                      child: Padding(padding: const EdgeInsets.all(24), child: GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },child: const Text("Sign up", maxLines: 1, style: TextStyle(color: Colors.blue)),),
                      ))
                ],
              )))),
        ],
      ),);
  }
}
```
<img src = "https://drive.google.com/uc?export=view&id=1xOUPkoIE-xSTlOgdditEr6e4f0RQCn5W" >
For more detailed information on how to use each widget, refer to the API documentation.

## Contributing
Contributions to DlWidgets are welcome! If you find a bug or have a feature suggestion, please open an issue on the GitHub repository.

## License
This library is available under the MIT License.
