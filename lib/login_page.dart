import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_signin_flutter_firebase/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null)
            return buildLoginButton();
          else
            return buildProfileView();
        }),
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value.photoUrl ?? '')
                  .image,
          radius: 100,
        ),
        Text(
          controller.googleAccount.value.displayName ?? '',
          style: Get.textTheme.headline3,
        ),
        Text(
          controller.googleAccount.value.email ?? '',
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(
          height: 16,
        ),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: () {
              controller.logout();
            })
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        //GoogleSignIn().signIn();
        controller.login();
      },
      icon: Icon(Icons.security),
      label: Text('Sign In With Google'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
