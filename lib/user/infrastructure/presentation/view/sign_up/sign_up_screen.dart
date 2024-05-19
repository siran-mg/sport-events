import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sport_events/core/components/buttons/primary_button.dart';
import 'package:sport_events/core/components/input_fields/app_password_field.dart';
import 'package:sport_events/core/components/input_fields/app_text_field.dart';
import 'package:sport_events/core/components/popups/error_popup.dart';
import 'package:sport_events/user/infrastructure/presentation/components/social_buttons.dart';
import 'package:sport_events/user/infrastructure/presentation/view/profiles/profiles_screen.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_up/sign_up_state.dart';
import 'package:sport_events/user/infrastructure/presentation/view/sign_up/sign_up_view_model.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({
    super.key,
    required this.goToSignIn,
  });

  final void Function() goToSignIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final signUpViewModel = ref.read(signUpViewModelProvider.notifier);
    final signUpState = ref.watch(signUpViewModelProvider);

    ref.listen(signUpViewModelProvider, (previous, next) {
      switch (next) {
        case EmailAlreadyUserError():
          displayErrorPopup(
            context: context,
            message: "Adresse email déjà lié à un compte",
          );
          break;
        case Success():
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ProfilesScreen(
                userId: FirebaseAuth.instance.currentUser!.uid,
              ),
            ),
          );
          break;
        case Initial():
        case Loading():
      }
    });

    void signUp() async {
      if (formKey.currentState?.validate() == true) {
        await signUpViewModel.signUp(
          email: emailController.text,
          password: passwordController.text,
        );
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
                      "Création de compte",
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
                const Gap(16),
                AppPasswordField(
                  controller: confirmPasswordController,
                  label: "Confirmation du mot de passe",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mot de passe obligatoire";
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Le mot de passe de confirmation ne correspond pas";
                    }
                    return null;
                  },
                ),
                const Gap(16),
                PrimaryButton(
                  label: "Valider",
                  onTap: signUp,
                  isLoading: signUpState is Loading,
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
                        text: "Vous avez déjà un compte ? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      TextSpan(
                        text: "Se connecter",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = goToSignIn,
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
