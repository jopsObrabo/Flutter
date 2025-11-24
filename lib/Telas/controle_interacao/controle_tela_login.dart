  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:email_validator/email_validator.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
  import 'package:sistema_mecaniaca_inteligente/Telas/tela_inicial.dart';
  import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/menssagen_alerta.dart';
  import 'package:sistema_mecaniaca_inteligente/utils/widgets/nav.dart';

  import '../../Dao/cliente.dart';

  class ControleTelaLogin {
    final controlador_login = TextEditingController();
    final controlador_senha = TextEditingController();
    final controlador_nome = TextEditingController();
    final controlador_telefone = TextEditingController();
    final controlador_cpf = TextEditingController();
    final controlador_endereco = TextEditingController();
    final controlador_foto = TextEditingController();
    final controlador_banner = TextEditingController();

    final formkey = GlobalKey<FormState>();


    final FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference<Map<String, dynamic>> get _collection_cliente =>
        FirebaseFirestore.instance.collection('Cliente');

    CollectionReference<Map<String, dynamic>> get _collection_oficina =>
        FirebaseFirestore.instance.collection('Oficina');

    void logar(BuildContext context) async {
      if (formkey.currentState!.validate()) {
        String login = controlador_login.text.trim();
        String senha = controlador_senha.text.trim();

        if (EmailValidator.validate(login)) {
          try {
            UserCredential userCredential = await _auth
                .signInWithEmailAndPassword(email: login, password: senha);
            _irParaTelaPrincipal(userCredential.user, context);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              MensagemAlerta("Erro: Usuário não encontrado para o email informado");
            } else if (e.code == 'wrong-password') {
              MensagemAlerta(
                "Erro: Password inválido!!!",
              );
              print('Wrong password provided for that user.');
            }
          }
        } else {
          MensagemAlerta("Erro: Email informado com formato inválido");
        }
      }
    }

    void _irParaTelaPrincipal(User? user, BuildContext context) {
      String email = user!.email!;

      _collection_cliente.where("email", isEqualTo: email).limit(1).get().then((snapshotCliente) {
        if (snapshotCliente.docs.isNotEmpty) {
          var dados = snapshotCliente.docs.first;
          Cliente cliente = Cliente.fromMap(dados.data(), dados.id);

          push(context, TelaPrincipal(cliente), replace: true);
        } else {
          _collection_oficina.where("email", isEqualTo: email).limit(1).get().then((snapshotOficina) {
            if (snapshotOficina.docs.isNotEmpty) {
              var dados = snapshotOficina.docs.first;
              Oficina oficina = Oficina.fromMap(dados.data(), dados.id);
              push(context, TelaPrincipal(oficina), replace: true);
            } else {
              MensagemAlerta("Erro: Usuário não encontrado nas coleções Cliente ou Oficina");
            }
          });
        }
      });

    }

    void cadastrar(BuildContext context,bool tipoUsuario) async {
      if (formkey.currentState!.validate()) {
        String login = controlador_login.text.trim();
        String senha = controlador_senha.text.trim();
        String nome = controlador_nome.text.trim();
        String enderco = controlador_endereco.text.trim();
        String telefone = controlador_telefone.text.trim();
        String cpf = controlador_cpf.text.trim();
        String foto = controlador_foto.text.trim();
        String banner = controlador_banner.text.trim();

        if (EmailValidator.validate(login)) {
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: login, password: senha);

            if(tipoUsuario == true){
              await _collection_cliente.doc(userCredential.user!.uid).set({
                'nome' : nome,
                'email': login,
                'telefone': telefone,
                'cpf':cpf,
                'foto':foto,

              })
                  .then(
                      (value) => _irParaTelaPrincipal(userCredential.user, context))
                  .catchError(
                      (error) => print("Falha ao adicionar o usuário: $error"));
            }else{
              await _collection_oficina.doc(userCredential.user!.uid).set({
                'nome':nome,
                'email': login,
                'endereco': enderco,
                'telefone': telefone,
                'foto': foto,
                'banner':banner,
              })
                  .then(
                      (value) => _irParaTelaPrincipal(userCredential.user, context))
                  .catchError(
                      (error) => print("Falha ao adicionar o usuário: $error"));
            }

          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              MensagemAlerta( "Erro: A senha fornecida é muito fraca");
            } else if (e.code == 'email-already-in-use') {
              MensagemAlerta("Erro: Já existe conta com o email informado");
            }
          } catch (e) {
            print(e);
          }
        } else {
          MensagemAlerta("Erro: Email informado com formato inválido");
        }
      }
    }
  }