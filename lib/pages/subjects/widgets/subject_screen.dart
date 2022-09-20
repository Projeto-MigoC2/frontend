import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/widgets/subject_button.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectScreen();
}

class _SubjectScreen extends State<SubjectScreen> {
  
  Card assuntosDropdown(List<String> listaAssunto){
    
    final List<DropdownMenuItem<String>> listaItens = listaAssunto.map((item) =>
        DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: item == listaAssunto[0] ? const Color(0xFF000000) : const Color(0xff39EBB0),                    
                  ),
                ),
        ),
    ).toList();

    return Card(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 56,
        width: 344,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(                        
            value: listaAssunto[0],                   
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
            assuntosDropdown(matBasicaList),
            assuntosDropdown(seriesSequenciaList),
            assuntosDropdown(eqDiferenciaisList),
            assuntosDropdown(transfLaplaceList),            
          ],
        ),
    );
  }
}


