import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/core/components/app_password_field.dart';
import 'package:sport_events/core/components/app_text_field.dart';
import 'package:sport_events/core/components/primary_button.dart';
import 'package:sport_events/core/view_model/data_state.dart';
import 'package:sport_events/user/presentation/view_model/auth_view_model.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.authViewModel,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sport Events"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Connexion",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
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
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryButton(
                label: "Se connecter",
                onTap: () {
                  authViewModel.login();
                },
                isLoading: ref.watch(authViewModelProvider) is Loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
