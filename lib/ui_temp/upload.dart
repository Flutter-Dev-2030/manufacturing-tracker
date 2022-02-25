import 'package:dapp/ui_temp/product.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:dapp/viewmodels_temp/upload_view_model.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  dynamic components = [];
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final idController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    dateController.dispose();
    idController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadViewModel>.reactive(
        viewModelBuilder: () => UploadViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Upload'),
              backgroundColor: Colors.grey[900],
            ),
            body: Container(
                color: Colors.grey[800],
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
                        child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5)),
                              labelText: 'Product name',
                              labelStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                        child: TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5)),
                              labelText: 'Product date',
                              labelStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                        child: TextField(
                            controller: idController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5)),
                              labelText: 'Product ID',
                              labelStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FloatingActionButton.extended(
                            heroTag: "add_component_button",
                            onPressed: () async {
                              components = await Navigator.pushNamed(
                                  context, '/component');
                              setState(() {
                                listComponents(components);
                              });
                            },
                            backgroundColor: Colors.blue[400],
                            icon: Icon(Icons.add),
                            label: Text('Add component')),
                      ),
                      Flexible(child: listComponents(components)),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FloatingActionButton.extended(
                            heroTag: "save_button",
                            onPressed: () {
                              viewModel.addProduct(Product(
                                  name: nameController.text,
                                  date: dateController.text,
                                  id: idController.text,
                                  components:
                                      viewModel.getComponentsName(components)));
                              // print(viewModel.getProducts());
                            },
                            backgroundColor: Colors.red[400],
                            icon: Icon(Icons.save),
                            label: Text('Save')),
                      ),
                    ])))));
  }

  Widget listComponents(components) {
    return ListView.builder(
      itemCount: components?.length ?? 0,
      itemBuilder: (context, index) {
        return Row(children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(4.0) //
                        )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '${index + 1}° Component: ${components[index].name}',
                      style: TextStyle(color: Colors.white)),
                )),
          )),
        ]);
      },
    );
  }
}

// _addTile(),

// Widget _addTile() {
//   return ListTile(
//     title: Padding(
//       padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
//       child: FloatingActionButton.extended(
//           heroTag: "add_component_button",
//           onPressed: () {
//             final controller = TextEditingController();
//             final field = TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white, width: 1.5)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white, width: 1.5)),
//                 labelText:
//                     "Enter component ${_controllers.length + 1} address",
//                 labelStyle: TextStyle(color: Colors.grey[400]),
//               ),
//               style: TextStyle(color: Colors.white),
//             );

//             setState(() {
//               _controllers.add(controller);
//               _fields.add(field);
//             });
//           },
//           backgroundColor: Colors.blue[400],
//           icon: Icon(Icons.add),
//           label: Text('Add component')),
//     ),
//   );
// }
