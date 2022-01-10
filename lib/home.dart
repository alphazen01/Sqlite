import 'package:flutter/material.dart';
import 'package:sqlite/customer_model.dart';
import 'package:sqlite/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController fNameEditingController = TextEditingController();
  TextEditingController lNameEditingController = TextEditingController();
   TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sqlite")
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             TextField(
               controller:fNameEditingController,
                 decoration: InputDecoration(
                   hintText: "First Name",
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                        color: Colors.black,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   focusedBorder:OutlineInputBorder(
                     borderSide:BorderSide(
                       color: Colors.blue,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20) 
                     ), 
                     ),
                 ),
                 SizedBox(height: 20,),
                 TextField(
                   controller: lNameEditingController,
                 decoration: InputDecoration(
                   hintText: "Last Name",
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                        color: Colors.black,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   focusedBorder:OutlineInputBorder(
                     borderSide:BorderSide(
                       color: Colors.blue,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20) 
                     ), 
                     ),
                 ),
                 SizedBox(height: 20,),
                 TextField(
                   controller: emailEditingController,
                 decoration: InputDecoration(
                   hintText: "email",
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                        color: Colors.black,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   focusedBorder:OutlineInputBorder(
                     borderSide:BorderSide(
                       color: Colors.blue,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20) 
                     ), 
                     ),
                 ),
                 SizedBox(height: 20,),
                 ElevatedButton(
                   onPressed: ()async{
                     final customer=CustomerModel(
                       id: 1,
                       firstName: fNameEditingController.text,
                       lastName: lNameEditingController.text,
                       email: emailEditingController.text
                     );
                     await DatabaseHelper.instance.addCustomer(customer);
                   },
                 
                 
                    
                   child: Text("Save"), 
              ),
              Container(
                height: 400,
                child: FutureBuilder(
                  future: DatabaseHelper.instance.getCustomer(),
                  builder: (BuildContext context, AsyncSnapshot<List<CustomerModel>>snapshot){
                      if(!snapshot.hasData) {
                        return Text("Loading......");
                      }
                    return ListView(
                      children: snapshot.data!.map((customer) {
                        return ListTile(
                          title:Text(customer.firstName??"") ,
                          subtitle: Text(customer.lastName??""),
                        );
                      }).toList()
                    );
                  }
                ),
              )
            ],
          ),
        ),
      );
  }
}