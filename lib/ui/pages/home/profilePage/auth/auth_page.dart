import 'package:flutter/material.dart';
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
          Column(
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
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.primaryPurple,
                  ),
                  fixedSize: MaterialStateProperty.resolveWith(
                    (states) => const Size(300, 45),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Получить код',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(
          'Номер телефона',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
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
