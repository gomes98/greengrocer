import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/services/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
        actions: [
          IconButton(
            onPressed: (() {
              authController.signOut();
            }),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // email
          CustomTextField(
            readOnly: true,
            icon: Icons.email,
            label: 'Email',
            initialValue: authController.user.email,
          ),
          // Nome
          CustomTextField(
            readOnly: true,
            icon: Icons.person,
            label: 'Nome',
            initialValue: authController.user.name,
          ),
          // Celuar
          CustomTextField(
            readOnly: true,
            icon: Icons.phone,
            label: 'Celuar',
            initialValue: authController.user.phone,
          ),
          // CPF
          CustomTextField(
            readOnly: true,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: authController.user.cpf,
          ),

          // botão de atualização de senha
          SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  updatePassword();
                },
                child: const Text("Atualizar Senha"),
              )),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // titulo
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Atualização de senha",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // senha atual
                          CustomTextField(
                            isSecret: true,
                            icon: Icons.lock,
                            label: "Senha atual",
                            validator: passwordValidator,
                            controller: currentPasswordController,
                          ),
                          // nova senha
                          CustomTextField(
                            controller: newPasswordController,
                            isSecret: true,
                            icon: Icons.lock_outline,
                            label: "Nova senha",
                            validator: passwordValidator,
                          ),
                          // confirmação de nova senha
                          CustomTextField(
                            isSecret: true,
                            icon: Icons.lock_outline,
                            label: "Confirmar nova senha",
                            validator: (value) {
                              final result = passwordValidator(value);

                              if (result != null) {
                                return result;
                              }

                              if (newPasswordController.text != value) {
                                return "As senhas não são iguais";
                              }

                              return null;
                            },
                          ),

                          SizedBox(
                            height: 45,
                            child: Obx(() => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            authController.changePassword(
                                              currentPassword:
                                                  currentPasswordController
                                                      .text,
                                              newPassword:
                                                  newPasswordController.text,
                                            );
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : const Text('Atualizar'),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
