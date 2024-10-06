import 'package:bhavesh_lingopanda/controller/auth_controller.dart';
import 'package:bhavesh_lingopanda/utils/form_validation.dart';
import 'package:bhavesh_lingopanda/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:bhavesh_lingopanda/routes/route_name.dart';
import 'package:bhavesh_lingopanda/utils/app_color.dart';
import 'package:bhavesh_lingopanda/widgets/textfield.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final AuthFormValidator _formValidator = AuthFormValidator();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  void dispose() {
    _formValidator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColor.primary,
                      ),
                    ),
                    buildLogo(30)
                  ],
                ),
                const SizedBox(height: 32),
                buildTextField(
                  label: 'Email',
                  controller: _formValidator.emailController,
                  validator: _formValidator.validateEmail,
                ),
                const SizedBox(height: 16),
                buildTextField(
                  label: 'Password',
                  controller: _formValidator.passwordController,
                  validator: _formValidator.validatePassword,
                  isPassword: true,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _isLoading ? null : () => _handleSignIn(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColor.bgColor,
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New here?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteName.signUp);
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w800,
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

  Future<void> _handleSignIn(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        await context.read<AuthController>().signIn(
              _formValidator.emailController.text,
              _formValidator.passwordController.text,
            );
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, RouteName.comments);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: AppColor.primary,
          ),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }
}
