import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text('Crie uma Emergência'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
              decoration: InputDecoration(labelText: 'Nome Completo:'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Digite um nome.';
                return null;
              }),
          TextFormField(
              decoration: InputDecoration(labelText: 'Numero de Telefone:'), inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ] ),
          SizedBox(height: 50,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(style: TextStyle(color: Colors.black.withOpacity(1),fontSize: 16.5,),'Envie uma foto do problema'),
            ],
          ),
          imagemSelecionada == null ? Container() : Image.file(imagemSelecionada!),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){
                pegarImagemGaleria();
              }, icon: Icon(Icons.add_photo_alternate_outlined,size: 45,)),
              IconButton(onPressed: (){
                pegarImagemCamera();
              }, icon: Icon(Icons.photo_camera_outlined,size: 45,)),
            ],
          )
        ],
      ),

    );
  }

  pegarImagemGaleria() async{
    final PickedFile? imagemTemporaria = await imagePicker.getImage(source: ImageSource.gallery);
    if(imagemTemporaria != null){
      imagemSelecionada = File(imagemTemporaria.path);
    }
  }

  pegarImagemCamera() async{
    final PickedFile? imagemTemporaria = await imagePicker.getImage(source: ImageSource.camera);
    if(imagemTemporaria != null){
      imagemSelecionada = File(imagemTemporaria.path);
    }
  }
}