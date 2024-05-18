import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sport_events/core/components/buttons/primary_button.dart';
import 'package:sport_events/core/components/input_fields/app_password_field.dart';
import 'package:sport_events/core/components/input_fields/app_text_field.dart';
import 'package:sport_events/core/components/popups/error_popup.dart';
import 'package:sport_events/user/infrastructure/presentation/components/social_buttons.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_in/sign_in_state.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_in/sign_in_view_model.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({
    super.key,
    required this.goToSignup,
  });

  final Function() goToSignup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final signInViewModel = ref.read(signInViewModelProvider.notifier);
    final signInState = ref.watch(signInViewModelProvider);

    void handleStateChanges() {
      switch (signInState) {
        case BadCredentials():
          displayErrorPopup(
            context: context,
            message: "Email ou mot de passe incorrect",
          );
        case Initial():
        case Loading():
        case Success():
        // TODO: Handle this case.
      }
    }

    void signIn() async {
      if (formKey.currentState?.validate() == true) {
        await signInViewModel.login(
          email: emailController.text,
          password: passwordController.text,
        );

        handleStateChanges();
      }
    }

    return Center(
      child: SingleChildScrollView(
        child: Padding(
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
                const Gap(32),
                AppTextField(
                  controller: emailController,
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email obligatoire";
                    }
                    return null;
                  },
                ),
                const Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppPasswordField(
                      controller: passwordController,
                      label: "Mot de passe",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mot de passe obligatoire";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(16),
                SizedBox(
                  height: 42,
                  child: PrimaryButton(
                    label: "Se connecter",
                    onTap: signIn,
                    isLoading: signInState is Loading,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Ou"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                const SocialButtons(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Vous n'avez pas encore de compte ? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      TextSpan(
                        text: "Créer un compte",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = goToSignup,
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
