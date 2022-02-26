import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/create_product_view_model.dart';

class CreateProductView extends StatefulWidget {
  const CreateProductView({Key? key}) : super(key: key);

  @override
  _CreateProductViewState createState() => _CreateProductViewState();
}

class _CreateProductViewState extends State<CreateProductView> {
  final productNameController = TextEditingController();
  final manufacturerNameController = TextEditingController();
  final productionLocationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    productNameController.dispose();
    manufacturerNameController.dispose();
    productionLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateProductViewModel>.reactive(
        viewModelBuilder: () => CreateProductViewModel(),
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Container(
                    color: Colors.grey[800],
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                24.0, 24.0, 24.0, 12.0),
                            child: TextField(
                                controller: productNameController,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  labelText: 'Product name',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[400]),
                                ),
                                style: const TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                24.0, 12.0, 24.0, 12.0),
                            child: TextField(
                                controller: manufacturerNameController,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  labelText: 'Manufacturer Name',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[400]),
                                ),
                                style: const TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                24.0, 12.0, 24.0, 12.0),
                            child: TextField(
                                controller: productionLocationController,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  labelText: 'Production Location',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[400]),
                                ),
                                style: const TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: FloatingActionButton.extended(
                                heroTag: "add_component_button",
                                onPressed: () {
                                  model.navigateToSelectComponentsView(context);
                                },
                                backgroundColor: Colors.black,
                                icon: const Icon(Icons.add),
                                label: const Text('Add component')),
                          ),
                          Flexible(
                              child: listComponents(model.selectedComponents)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: FloatingActionButton.extended(
                                    heroTag: "cancel_button",
                                    onPressed: () {
                                      model.navigateBack(context);
                                    },
                                    backgroundColor: Colors.blue[400],
                                    icon: const Icon(Icons.cancel),
                                    label: const Text('Cancel')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: model.busy
                                    ? const CircularProgressIndicator()
                                    : FloatingActionButton.extended(
                                        heroTag: "save_button",
                                        onPressed: () {
                                          model.saveNewProduct(
                                            productNameController.text,
                                            manufacturerNameController.text,
                                            productionLocationController.text,
                                            context,
                                          );
                                        },
                                        backgroundColor: Colors.red[400],
                                        icon: const Icon(Icons.save),
                                        label: const Text('Save')),
                              ),
                            ],
                          ),
                        ]))))));
  }

  Widget listComponents(List<String> components) {
    return ListView.builder(
      itemCount: components.length,
      itemBuilder: (context, index) {
        return Row(children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(4.0) //
                        )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${index + 1}° Component: ${components[index]}',
                      style: const TextStyle(color: Colors.white)),
                )),
          )),
        ]);
      },
    );
  }
}
