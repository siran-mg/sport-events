import 'package:flutter/material.dart';
import 'package:sport_events/core/components/app_password_field.dart';
import 'package:sport_events/core/components/app_text_field.dart';
import 'package:sport_events/core/components/primary_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sport Events"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                Text(
                  "Connexion",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                AppTextField(
                  emailController: emailController,
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppPasswordField(
                      passwordController: passwordController,
                      label: "Mot de passe",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Mot de passe oublié ?",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
                PrimaryButton(label: "Se connecter", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
