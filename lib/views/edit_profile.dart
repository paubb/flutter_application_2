import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Firebase/auth_service.dart';
import 'package:flutter_application_2/models/profile.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _profile = ModalRoute.of(context).settings.arguments as Profile;
    _username.text = _profile.name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Edit profile",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
            ),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
                await FirebaseAuthService.updateUsername(
                  _username.text.trim(),
                );
                // Unfocus text input
                FocusManager.instance.primaryFocus?.unfocus();
                // Pop loading Dialog
                Navigator.pop(context);

                // Pop edit view
                Navigator.pop(context, _username.text.trim());
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _username,
                            decoration: InputDecoration(
                              hintText: "Enter new username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              // Check if this field is empty
                              if (value == null || value.trim().isEmpty) {
                                return 'A username is required';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
