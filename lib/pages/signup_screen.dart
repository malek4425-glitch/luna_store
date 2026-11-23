import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  size: 75,
                  color: Color(0xFF8B5CF6),
                ),
                const SizedBox(height: 15),

                Text(
                  'create_account'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  'signup_subtitle'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: isDark ? Colors.white70 : const Color(0xFF6B5A85),
                  ),
                ),
                const SizedBox(height: 30),

                // Full Name
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration(
                    context,
                    'full_name'.tr(),
                    Icons.person_outline,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'enter_full_name'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                // Phone
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration(
                    context,
                    'phone_number'.tr(),
                    Icons.phone_outlined,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'enter_phone'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    context,
                    'email_address'.tr(),
                    Icons.email_outlined,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'enter_email'.tr();
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'valid_email'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration:
                      _inputDecoration(
                        context,
                        'password'.tr(),
                        Icons.lock_outline,
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_password'.tr();
                    }
                    if (value.length < 6) {
                      return 'password_min_length'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration:
                      _inputDecoration(
                        context,
                        'confirm_password'.tr(),
                        Icons.lock_outline,
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter_confirm_password'.tr();
                    }
                    if (value != _passwordController.text) {
                      return 'passwords_no_match'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Terms and Conditions
                CheckboxListTile(
                  value: _acceptTerms,
                  activeColor: const Color(0xFF8B5CF6),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'agree_terms'.tr(),
                    style: TextStyle(fontSize: 13, color: textColor),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 15),

                // Send OTP
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    if (!_acceptTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('accept_terms'.tr())),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('otp_sent'.tr())));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'send_otp'.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Back to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already_account'.tr(),
                      style: TextStyle(color: textColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'login'.tr(),
                        style: const TextStyle(
                          color: Color(0xFF8B5CF6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context,
    String label,
    IconData icon,
  ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: const Icon(Icons.circle, color: Color(0xFF8B5CF6), size: 0),
      prefix: Icon(icon, color: const Color(0xFF8B5CF6)),
      filled: true,
      fillColor: Theme.of(context).cardColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
