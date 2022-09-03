import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/widgets/subject_button.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectScreen();
}

class _SubjectScreen extends State<SubjectScreen> {
  
  Card assuntosDropdown(int ordem, List<String> listaAssunto){
    List<DropdownMenuItem<String>> listaItens = [];
    listaItens.add(
        DropdownMenuItem(
                value: assuntosList[ordem],
                child: Text(
                  assuntosList[ordem],
                  style: const TextStyle(
                    fontFamily: 'Source Sans Pro', 
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
        ),
    );
    for(int i = 0; i<listaAssunto.length; i++){
      listaItens.add(
        DropdownMenuItem(
                value: listaAssunto[i],
                child: Text(
                  listaAssunto[i],
                  style: const TextStyle(
                    color: Color(0xFF39EBB0),
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 56,
        width: 344,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(                        
            value: assuntosList[ordem],                   
            decoration: const InputDecoration(
               prefixIcon: Icon(Icons.keyboard_arrow_down_sharp),
               enabledBorder:InputBorder.none,
            ),
            icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
            alignment: Alignment.center,
            items: listaItens,            
            dropdownColor: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
            onChanged: (value) {                  
            },
          ),
        ),
      ),
    );
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            assuntosDropdown(0, matBasicaList),
            assuntosDropdown(1, seriesSequenciaList),
            assuntosDropdown(2, eqDiferenciaisList),
            assuntosDropdown(3, transfLaplaceList),            
          ],
        ),
    );
  }
}


