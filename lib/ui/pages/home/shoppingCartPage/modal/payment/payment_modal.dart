part of '../../cartPage/shopping_cart_view.dart';

class _DialogPayment extends StatefulWidget {
  const _DialogPayment({Key? key}) : super(key: key);

  @override
  State<_DialogPayment> createState() => _DialogPaymentState();
}

class _DialogPaymentState extends State<_DialogPayment> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 700,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.smallP),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Способы оплаты',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    splashRadius: 24,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: AppPadding.smallP),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _CardForms(),
                  _BankCards(),
                ],
              ),
              const SizedBox(height: AppPadding.smallP),
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

class _CardForms extends StatelessWidget {
  const _CardForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserInfoTextFieldWidget(labelText: 'Номер карты'),
        const SizedBox(height: AppPadding.mediumP),
        const UserInfoTextFieldWidget(labelText: 'CSV/CVV'),
        const SizedBox(height: AppPadding.mediumP),
        TextButton(
          onPressed: () {},
          style: Theme.of(context).textButtonTheme.style?.copyWith(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => AppColors.paymentGreen,
                ),
              ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.smallP,
              vertical: AppPadding.smallP,
            ),
            child: Text(
              'Добавить карту',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BankCards extends StatelessWidget {
  const _BankCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
