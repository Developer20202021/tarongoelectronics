import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class DueCustomers extends StatefulWidget {


  DueCustomers({super.key,});

  @override
  _DueCustomersState createState() => _DueCustomersState();
}

class _DueCustomersState extends State<DueCustomers> {
  int _selectedDestination = 0;

  bool SearchByPhoneNo = true;
  bool SearchByFileNo = false;
  bool SearchByProductID = false;


  TextEditingController SearchByPhoneNoController = TextEditingController();

  TextEditingController SearchByFileNoController = TextEditingController();

  TextEditingController SearchByProductIDController = TextEditingController();




List  AllDueCustomerInfo = [];




Future<void> getDueCustomerInfo() async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductSaleInfo');

    Query DueCustomerquery = _collectionDueCustomerRef.where("CustomerType", isEqualTo: "Due");

    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}




Future<void> SearchByPhoneNoCustomerInfo(String PhoneNo) async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductSaleInfo');

    Query DueCustomerquery = _collectionDueCustomerRef.where("CustomerType", isEqualTo: "Due").where("CustomerPhoneNo", isEqualTo: PhoneNo);

    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}




Future<void> SearchByFileNoCustomerInfo(String FileNo) async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductSaleInfo');

    Query DueCustomerquery = _collectionDueCustomerRef.where("CustomerType", isEqualTo: "Due").where("FileNo", isEqualTo: FileNo);

    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}





Future<void> SearchByProductIdCustomerInfo(String ProductVisibleID) async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductSaleInfo');

    Query DueCustomerquery = _collectionDueCustomerRef.where("CustomerType", isEqualTo: "Due").where("ProductVisibleID", isEqualTo: ProductVisibleID.toLowerCase());

    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}






  @override
  void initState() {
     FlutterNativeSplash.remove();

     getDueCustomerInfo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: [
        Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'All Menu',
                  style: textTheme.headline6,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Item 1'),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Item 2'),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Item 3'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Label',
                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Item A'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
            ],
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Due Customers"),



                   SearchByPhoneNo? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                Card(
                  elevation: 20,
                  child: Container(width: 200,child:  TextField(
             
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Phone No',
                   
                        hintText: 'Enter Phone No',
                            
                        //  enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                        //     ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                        
                        
                        ),
                    controller: SearchByPhoneNoController,
                  ),),
                ),


               ElevatedButton(onPressed: () async{

                  
                SearchByPhoneNoCustomerInfo(SearchByPhoneNoController.text.trim());

                }, child: Text("Search")),

                ],):Text(""),






                 SearchByFileNo? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                Card(
                  elevation: 20,
                  child: Container(width: 200,child:  TextField(
             
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                        border: OutlineInputBorder(),
                        labelText: 'Enter File No',
                   
                        hintText: 'Enter File No',
                            
                        //  enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                        //     ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                        
                        
                        ),
                    controller: SearchByFileNoController,
                  ),),
                ),


               ElevatedButton(onPressed: () async{

                  
                SearchByFileNoCustomerInfo(SearchByFileNoController.text.trim());

                }, child: Text("Search")),

                ],):Text(""),





                SearchByProductID? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                Card(
                  elevation: 20,
                  child: Container(width: 200,child:  TextField(
             
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Product ID',
                   
                        hintText: 'Enter Product ID',
                            
                        //  enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                        //     ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                        
                        
                        ),
                    controller: SearchByProductIDController,
                  ),),
                ),


               ElevatedButton(onPressed: () async{

                  SearchByProductIdCustomerInfo(SearchByProductIDController.text.trim());


                }, child: Text("Search")),

                ],):Text(""),




                
                  PopupMenuButton(
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return  [
                        PopupMenuItem(
                          value: '/hello',
                          child: CheckboxListTile(
                                      title: const Text(
                                          "Search By Phone No"
                                              ,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Josefin Sans")),
                                      value: SearchByPhoneNo,
                                      onChanged: (newValue) {
                                        setState(() {
                                          SearchByPhoneNo = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                        ),
                        PopupMenuItem(
                          value: '/about',
                          child: CheckboxListTile(
                                      title: const Text(
                                          "Search By File No"
                                              ,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Josefin Sans")),
                                      value: SearchByFileNo,
                                      onChanged: (newValue) {
                                        setState(() {
                                          SearchByFileNo = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                        ),
                        PopupMenuItem(
                          value: '/contact',
                          child: CheckboxListTile(
                                      title: const Text(
                                          "Search By Product ID"
                                              ,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Josefin Sans")),
                                      value: SearchByProductID,
                                      onChanged: (newValue) {
                                        setState(() {
                                          SearchByProductID = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                        )
                      ];
                    },
                  )




                ],
              ),
            ),
            body: GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.all(20),
              childAspectRatio: 3 / 2,
              children: [

                Card(
                  surfaceTintColor: Colors.white,
                  elevation: 20,
                  child: Padding(
                  padding: const EdgeInsets.all(16),
                    child: DataTable2(
                
                      isHorizontalScrollBarVisible: true,
                         headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          columnSpacing: 12,
                          headingRowColor: MaterialStatePropertyAll(Colors.pink),
                          horizontalMargin: 12,
                          minWidth: 2500,
                          dividerThickness: 3,
                    columns: const[
                      DataColumn2(
                        label: Text('SL'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Customer Name'),
                      ),
                      DataColumn(
                        label: Text('Customer Phone No'),
                      ),
                      DataColumn(
                        label: Text('Customer Address'),
                      ),
                      DataColumn(
                        label: Text('Sale ProductID'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Sale Product Name'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Sale Product Description'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Qty'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Total Price'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Cash In'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Total Cash In'),
                        numeric: true,
                      ),
                
                
                      DataColumn(
                        label: Text('Interest'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Due'),
                        numeric: true,
                      ),
                
                
                
                      DataColumn(
                        label: Text('Status'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Condition'),
                        numeric: true,
                      ),
                
                
                       DataColumn(
                        label: Text('Sale Date'),
                        numeric: true,
                      ),
                
                      DataColumn(
                        label: Text('Pay Now'),
                        numeric: true,
                      ),
                
                    ],
                    rows: List<DataRow>.generate(
                        AllDueCustomerInfo.length,
                        (index) => DataRow(cells: [
                              DataCell(Text('${index+1}')),
                              DataCell(Text(AllDueCustomerInfo[index]["CustomerName"].toString().toUpperCase())),
                              DataCell(Text(AllDueCustomerInfo[index]["CustomerPhoneNo"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["CustomerAddress"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["ProductVisibleID"].toString().toUpperCase())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["ProductName"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["ProductDescription"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["Qty"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["TotalPrice"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["CashIn"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["TotalCashIn"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["Interest"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["Due"].toString())),
                
                              DataCell(Text(AllDueCustomerInfo[index]["CustomerType"].toString())),
                
                              DataCell(Text("${AllDueCustomerInfo[index]["ConditionMonth"].toString()} month")),
                
                              DataCell(Text(AllDueCustomerInfo[index]["Date"].toString())),
                
                              DataCell(ElevatedButton(onPressed: (){
                
                              }, child: Text("Pay Now"))),
                           
                            ]))),
                  ),
                )
             
              ],
            ),
          ),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}