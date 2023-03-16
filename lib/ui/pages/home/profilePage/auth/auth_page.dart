import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_products/ui/pages/home/profilePage/auth/viewModel/auth_view_model.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/page_wrapper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'images/background_login.jpg',
            fit: BoxFit.cover,
          ),
          ChangeNotifierProvider<AuthViewModel>(
            create: (context) => AuthViewModel(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Авторизация',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppPadding.bigP),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const _AuthTextField(),
                ),
                const SizedBox(height: AppPadding.mediumP),
                const _AuthButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => AppColors.primaryPurple,
        ),
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => const Size(300, 45),
        ),
      ),
      onPressed: () => context.read<AuthViewModel>().auth(),
      child: Text(
        'Зарегистрироваться',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
      ),
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<AuthViewModel>().phoneController,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(
          'Номер телефона',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        errorText: context.watch<AuthViewModel>().errorMessage,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryPurple,
            width: 2,
          ),
        ),
      ),
    );
  }
}
