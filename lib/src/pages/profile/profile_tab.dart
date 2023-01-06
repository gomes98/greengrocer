import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
        actions: [
          IconButton(onPressed: (() {}), icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          // email
          CustomTextField(icon: Icons.email, label: 'Email'),
          // Nome
          CustomTextField(icon: Icons.person, label: 'Nome'),
          // Celuar
          CustomTextField(icon: Icons.phone, label: 'Celuar'),
          // CPF
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
        ],
      ),
    );
  }
}
