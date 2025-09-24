import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/auth/presentation/widgets/confirm_button.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/presentation/bloc/basket_bloc.dart';

class AddBasketPage extends StatefulWidget {
  const AddBasketPage({super.key});

  @override
  State<AddBasketPage> createState() => _AddBasketPageState();
}

class _AddBasketPageState extends State<AddBasketPage> {
  final _formKey = GlobalKey<FormState>();
  final _subcategoryController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _customCategoryController = TextEditingController();

  String? _selectedCategory;
  bool _useCustomCategory = false;

  @override
  void dispose() {
    _subcategoryController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _customCategoryController.dispose();
    super.dispose();
  }

  void _onCategoryChanged(String? value) {
    setState(() {
      if (value == _customCategoryKey) {
        _useCustomCategory = true;
        _selectedCategory = null;
      } else {
        _useCustomCategory = false;
        _selectedCategory = value;
      }
    });
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final category =
        _useCustomCategory
            ? _customCategoryController.text.trim()
            : _selectedCategory?.trim();
    if (category == null || category.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Выберите или введите категорию')),
        );
      return;
    }

    final subcategory = _subcategoryController.text.trim();
    final name = _nameController.text.trim();
    final description =
        _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim();
    final price = double.parse(_priceController.text.replaceAll(',', '.'));

    final item = BasketItemEntity(
      id: '',
      category: category,
      subcategory: subcategory,
      name: name,
      price: price,
      quantity: 1,
      description: description,
      imagePath: null,
      createdAt: DateTime.now(),
    );

    context.read<BasketBloc>().add(BasketItemAdded(item));

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Товар добавлен в корзину')));

    context.pop();
  }

  static const _customCategoryKey = '__custom__';

  OutlineInputBorder _fieldBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => context.pop(),
        ),
        title: Text('Добавить', style: AppTextStyles.f20w700),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Сканировать', style: AppTextStyles.f14w400),
          ),
        ],
      ),
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          final categories = state.categories;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/backbasket.png'),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCategoryField(categories),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _subcategoryController,
                      label: 'Подкатегория',
                      validator:
                          (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Введите подкатегорию'
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _nameController,
                      label: 'Название',
                      validator:
                          (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Введите название'
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _priceController,
                      label: 'Цена',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        final raw = value?.replaceAll(',', '.').trim();
                        final parsed = double.tryParse(raw ?? '');
                        if (parsed == null || parsed <= 0) {
                          return 'Введите корректную цену';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _descriptionController,
                      label: 'Описание',
                      maxLines: 5,
                      validator: (_) => null,
                    ),
                    const SizedBox(height: 24),
                    ConfirmButton(title: 'Сохранить', onPressed: _onSave),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryField(List<String> categories) {
    final items = <DropdownMenuItem<String>>[
      for (final category in categories)
        DropdownMenuItem<String>(value: category, child: Text(category)),
      const DropdownMenuItem<String>(
        value: _customCategoryKey,
        child: Text('Другая категория'),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText: 'Категория',
            labelStyle: AppTextStyles.f16w400.copyWith(color: AppColors.grey),
            filled: true,
            fillColor: const Color(0xFFFFF0F3),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: _fieldBorder(AppColors.lightGrey),
            focusedBorder: _fieldBorder(AppColors.primary),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _useCustomCategory ? _customCategoryKey : _selectedCategory,
              hint: Text(
                'Выберите категорию',
                style: AppTextStyles.f16w400.copyWith(color: AppColors.grey),
              ),
              isExpanded: true,
              items: items,
              onChanged: _onCategoryChanged,
            ),
          ),
        ),
        if (_useCustomCategory) ...[
          const SizedBox(height: 12),
          _buildTextField(
            controller: _customCategoryController,
            label: 'Своя категория',
            validator:
                (value) =>
                    value == null || value.trim().isEmpty
                        ? 'Введите категорию'
                        : null,
          ),
        ],
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: AppTextStyles.f16w400,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.f16w400.copyWith(color: AppColors.grey),
        filled: true,
        fillColor: const Color(0xFFFFF0F3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: _fieldBorder(AppColors.lightGrey),
        focusedBorder: _fieldBorder(AppColors.primary),
        errorBorder: _fieldBorder(AppColors.primary),
        focusedErrorBorder: _fieldBorder(AppColors.primary),
      ),
      validator: validator,
    );
  }
}
