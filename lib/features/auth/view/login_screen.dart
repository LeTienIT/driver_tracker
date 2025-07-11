import 'dart:ui';
import 'package:driver_tracker/core/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/login_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isAutoLoginAttempted = false;

  @override
  void initState() {
    super.initState();
    _checkAutoLogin();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Future<void> _checkAutoLogin() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final loginAuto = preferences.getBool('loginAuto') ?? false;

      if (!loginAuto || !mounted) return;

      final user = preferences.getString('user') ?? '';
      final pass = preferences.getString('pass') ?? '';

      if (user.trim().isEmpty || pass.trim().isEmpty) return;

      emailController.text = user;
      passwordController.text = pass;

      if (!mounted) return;

      setState(() => _isAutoLoginAttempted = true);

      final vm = ref.read(loginProvider.notifier);
      await vm.login(user, pass);
      final result = ref.read(loginProvider);
      result.whenOrNull(
        data: (success) {
          if (success == true) {
            Navigator.pushNamedAndRemoveUntil(context, '/trip-list', (router)=>false);
          }
        },
        error: (e, _) {
          print("Lỗi auto login: $e");
        },
      );

    } catch (e) {
      if (!mounted) return;
    }
  }

  void _handleLogin(BuildContext context) async {
    final vm = ref.read(loginProvider.notifier);
    await vm.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    final result = ref.read(loginProvider);
    result.whenOrNull(
      data: (success) {
        if (success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng nhập thành công')),
          );
          Navigator.pushNamedAndRemoveUntil(context, '/trip-list', (router)=>false);
        }
        else {
          CustomDialog.showMessageDialog(context: context, title: 'Thông báo', message: 'Tài khoản hoặc mật khẩu không đúng');
        }
      },
      error: (e, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final size = MediaQuery.of(context).size;
    if (_isAutoLoginAttempted) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Stack(
        children: [
          // Ảnh nền
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/background_login.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay mờ
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
                         ),
          ),
          // Form login
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                            ),
                          validator: (value){
                              if(value!.trim().isEmpty){
                                return "Email không được để trống";
                              }
                              return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Mật khẩu',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value!.trim().isEmpty){
                              return "Mật khẩu không được để trống";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        state.isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(_formKey.currentState!.validate()){
                                      _handleLogin(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    "Đăng nhập",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
