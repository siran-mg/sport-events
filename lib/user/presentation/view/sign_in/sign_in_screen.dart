import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_events/core/components/buttons/primary_button.dart';
import 'package:sport_events/core/components/input_fields/app_password_field.dart';
import 'package:sport_events/core/components/input_fields/app_text_field.dart';
import 'package:sport_events/core/components/popups/error_popup.dart';
import 'package:sport_events/user/presentation/view/sign_in/sign_in_state.dart';
import 'package:sport_events/user/presentation/view/sign_in/sign_in_view_model.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInViewModel = ref.read(signInViewModelProvider.notifier);
    final signInState = ref.watch(signInViewModelProvider);

    void handleStateChanges() {
      switch (signInState) {
        case Initial():
        case Loading():
        case Success():
        // TODO: Handle this case.
        case BadCredentials():
          displayErrorPopup(
            context: context,
            message: "Email ou mot de passe incorrect",
          );
      }
    }

    void signIn() {
      if (formKey.currentState?.validate() == true) {
        signInViewModel.login(
          email: emailController.text,
          password: passwordController.text,
        );

        handleStateChanges();
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sport Events"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Form(
            key: formKey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email obligatoire";
                    }
                    return null;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppPasswordField(
                      passwordController: passwordController,
                      label: "Mot de passe",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mot de passe obligatoire";
                        }
                        return null;
                      },
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
                const SizedBox(
                  height: 16,
                ),
                PrimaryButton(
                  label: "Se connecter",
                  onTap: signIn,
                  isLoading: signInState is Loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
