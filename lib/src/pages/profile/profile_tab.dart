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
        children: [
          // email
          CustomTextField(
            readOnly: true,
            icon: Icons.email,
            label: 'Email',
            initialValue: app_data.user.email,
          ),
          // Nome
          CustomTextField(
            readOnly: true,
            icon: Icons.person,
            label: 'Nome',
            initialValue: app_data.user.name,
          ),
          // Celuar
          CustomTextField(
            readOnly: true,
            icon: Icons.phone,
            label: 'Celuar',
            initialValue: app_data.user.phone,
          ),
          // CPF
          CustomTextField(
            readOnly: true,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: app_data.user.cpf,
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
                onPressed: () {},
                child: const Text("Atualizar Senha"),
              )),
        ],
      ),
    );
  }
}
