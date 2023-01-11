part of '../../cartPage/shopping_cart_view.dart';

class _DialogReceiver extends StatefulWidget {
  const _DialogReceiver({Key? key}) : super(key: key);

  @override
  State<_DialogReceiver> createState() => __DialoRreceiverState();
}

class __DialoRreceiverState extends State<_DialogReceiver> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.mediumP),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Получатель',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    splashRadius: 24,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: AppPadding.mediumP),
              const UserInfoTextFieldWidget(labelText: 'ФИО'),
              const SizedBox(height: AppPadding.mediumP),
              const UserInfoTextFieldWidget(labelText: 'Адрес'),
              const SizedBox(height: AppPadding.mediumP),
              const UserInfoTextFieldWidget(labelText: 'Телефон'),
              const SizedBox(height: AppPadding.mediumP),
              const UserInfoTextFieldWidget(labelText: 'Квартира'),
              const SizedBox(height: AppPadding.mediumP),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: Theme.of(context).textButtonTheme.style?.copyWith(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => AppColors.primaryPurple),
                        ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.smallP,
                        vertical: AppPadding.smallP,
                      ),
                      child: Text(
                        'Сохранить',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
