import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tarongoelectronics/Dashboard/AllCustomers.dart';
import 'package:tarongoelectronics/Dashboard/HomeScreen.dart';
import 'package:uuid/uuid.dart';

class DueCustomers extends StatefulWidget {

  // final int SelectedDestination;



  DueCustomers({super.key,});

  @override
  _DueCustomersState createState() => _DueCustomersState();
}

class _DueCustomersState extends State<DueCustomers> {
  int _selectedDestination = 0;

  bool SearchByPhoneNo = true;
  bool SearchByFileNo = false;
  bool SearchByProductID = false;

    var uuid = Uuid();


  TextEditingController SearchByPhoneNoController = TextEditingController();

  TextEditingController SearchByFileNoController = TextEditingController();

  TextEditingController SearchByProductIDController = TextEditingController();

  TextEditingController PhoneNoController = TextEditingController();

  TextEditingController DueAmountController = TextEditingController();

  TextEditingController DueAmountPayController = TextEditingController();

  TextEditingController InterestDueController= TextEditingController();

  TextEditingController InterestPayController= TextEditingController();




List  AllDueCustomerInfo = [];

int TotalDue = 0;
int TotalInterest = 0;
int TotalCashIn = 0;




Future<void> getDueCustomerInfo() async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductSaleInfo');

    Query DueCustomerquery = _collectionDueCustomerRef.where("CustomerType", isEqualTo: "Due");

    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     if (AllDueCustomerInfo.isEmpty) {
       
     } else {

      for (var i = 0; i < AllDueCustomerInfo.length; i++) {

        var DueAmount = AllDueCustomerInfo[i]["Due"];

        int DueAmountInt = int.parse(DueAmount.toString());
        int InterestAmount = int.parse(AllDueCustomerInfo[i]["InterestDue"]);
        int TotalCashInInt =int.parse(AllDueCustomerInfo[i]["InterestDue"]);

        setState(() {
          TotalDue = TotalDue + DueAmountInt;
          TotalInterest + TotalInterest + InterestAmount;
          TotalCashIn = TotalCashIn + TotalCashInInt;
        });
        
      }
       
     }

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


          if (AllDueCustomerInfo.isEmpty) {
       
     } else {

      for (var i = 0; i < AllDueCustomerInfo.length; i++) {

        var DueAmount = AllDueCustomerInfo[i]["Due"];

        int DueAmountInt = int.parse(DueAmount);
        int InterestAmount = int.parse(AllDueCustomerInfo[i]["InterestDue"]);
        int TotalCashInInt =int.parse(AllDueCustomerInfo[i]["InterestDue"]);

        setState(() {
          TotalDue = TotalDue + DueAmountInt;
          TotalInterest + TotalInterest + InterestAmount;
          TotalCashIn = TotalCashIn + TotalCashInInt;
        });
        
      }
       
     }









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


          if (AllDueCustomerInfo.isEmpty) {
       
     } else {

      for (var i = 0; i < AllDueCustomerInfo.length; i++) {

        var DueAmount = AllDueCustomerInfo[i]["Due"];

        int DueAmountInt = int.parse(DueAmount);
        int InterestAmount = int.parse(AllDueCustomerInfo[i]["InterestDue"]);
        int TotalCashInInt =int.parse(AllDueCustomerInfo[i]["InterestDue"]);

        setState(() {
          TotalDue = TotalDue + DueAmountInt;
          TotalInterest + TotalInterest + InterestAmount;
          TotalCashIn = TotalCashIn + TotalCashInInt;
        });
        
      }
       
     }

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


          if (AllDueCustomerInfo.isEmpty) {
       
     } else {

      for (var i = 0; i < AllDueCustomerInfo.length; i++) {

        var DueAmount = AllDueCustomerInfo[i]["Due"];

        int DueAmountInt = int.parse(DueAmount);
        int InterestAmount = int.parse(AllDueCustomerInfo[i]["InterestDue"]);
        int TotalCashInInt =int.parse(AllDueCustomerInfo[i]["InterestDue"]);

        setState(() {
          TotalDue = TotalDue + DueAmountInt;
          TotalInterest + TotalInterest + InterestAmount;
          TotalCashIn = TotalCashIn + TotalCashInInt;
        });
        
      }
       
     }

     setState(() {
       AllDueCustomerInfo = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}






  @override
  void initState() {
     FlutterNativeSplash.remove();

     setState(() {
       _selectedDestination = 1;
     });

     getDueCustomerInfo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

     var TrxID = uuid.v4();

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
                title: Text('Sale'),
                selected: _selectedDestination == 0,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Due Customers'),
                selected: _selectedDestination == 1,
                onTap: () {

                

                },
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('All Customers'),
                selected: _selectedDestination == 2,
                onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllCustomers()));
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'For You',
                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Settings'),
                selected: _selectedDestination == 3,
                onTap: (){

                },
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
                        ),


                        PopupMenuItem(
                          value: '/contact',
                          child: ElevatedButton(onPressed: (){




                                       showDialog(
                                                context: context,
                                                builder: (context) {
                                           

                                                  return StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return AlertDialog(
                                title: Text('View Payment Details'),
                                content: SingleChildScrollView(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text("মোট বকেয়াঃ ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,fontFamily: "Josefin Sans"),),

                                         Text("$TotalDue", style: const TextStyle(color: Colors.black, fontSize: 14,fontFamily: "Josefin Sans"),),

                                      ],
                                    ),



                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text("মোট পরিশোধঃ ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,fontFamily: "Josefin Sans"),),

                                         Text("$TotalCashIn", style: const TextStyle(color: Colors.black, fontSize: 14,fontFamily: "Josefin Sans"),),

                                      ],
                                    ),



                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text("ইন্টারেস্ট বাকিঃ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,fontFamily: "Josefin Sans"),),

                                         Text("$TotalInterest", style: const TextStyle(color: Colors.black, fontSize: 14,fontFamily: "Josefin Sans"),),

                                      ],
                                    ),




                                  ],
                                ),),
                                actions: [
                                  ElevatedButton(
                                   
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('CANCEL'),
                                  ),
                                  ElevatedButton(
                                    
                                    onPressed: () {

                                      Navigator.pop(context);
                                    },
                                    child: Text('ACCEPT'),
                                  ),
                                ],
                              );});});







                          }, child: Text("View Payment Details")),
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
                         headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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



                                showDialog(
                                                context: context,
                                                builder: (context) {

                                                  bool loading = false;
                                           

                                                  return StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return AlertDialog(
                                title: Text('Pay Now'),
                                content:loading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

              
              Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Phone No: ${AllDueCustomerInfo[index]["CustomerPhoneNo"]}',

                      hintText: 'Phone No: ${AllDueCustomerInfo[index]["CustomerPhoneNo"]}',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: PhoneNoController,
                  ),
                ),

                                       
                   const SizedBox(
                              height: 20,
                            ),


                                
              Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Total Due: ${AllDueCustomerInfo[index]["Due"]}',

                      hintText: 'Total Due: ${AllDueCustomerInfo[index]["Due"]}',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: DueAmountController,
                  ),
                ),

                                       
                   const SizedBox(
                              height: 20,
                            ),


                    
                  
                  Container(
                  width: 300,
                  child: TextField(
                    
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Pay Due',

                      hintText: 'Pay Due',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: DueAmountPayController,
                  ),
                ),

                                       
                   const SizedBox(
                              height: 20,
                            ),


                    
                Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Total Interest Due: ${AllDueCustomerInfo[index]["InterestDue"]}',

                      hintText: 'Total Interest Due: ${AllDueCustomerInfo[index]["InterestDue"]}',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: InterestDueController,
                  ),
                ),

                                       
                   const SizedBox(
                              height: 20,
                            ),


                
                Container(
                  width: 300,
                  child: TextField(
                    
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Interest Pay',

                      hintText: 'Interest Pay',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: InterestPayController,
                  ),
                ),

                                       
                   const SizedBox(
                              height: 20,
                            ),


                                  ],
                                ),),
                                actions: [
                                  ElevatedButton(
                                   
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('CANCEL'),
                                  ),
                                  ElevatedButton(
                                    
                                    onPressed: () async{

                    setState((){
                      loading = true;
                    });


                int DueAmountInt = (int.parse(AllDueCustomerInfo[index]["Due"])-int.parse(DueAmountPayController.text.trim().toString()));


                final docUser = FirebaseFirestore.instance.collection("ProductSaleInfo").doc(AllDueCustomerInfo[index]["CustomerID"]);

                final jsonData ={
                    "InterestDue":(int.parse(AllDueCustomerInfo[index]["InterestDue"])-int.parse(InterestPayController.text.trim().toString())).toString(),
                    "InterestPaid":(int.parse(AllDueCustomerInfo[index]["InterestPaid"])+int.parse(InterestPayController.text.trim().toString())).toString(),
                    "Due":(int.parse(AllDueCustomerInfo[index]["Due"])-int.parse(DueAmountPayController.text.trim().toString())).toString(),
                    "CustomerType":DueAmountInt<=0?"Paid":"Due",
                    "TotalCashIn":(int.parse(AllDueCustomerInfo[index]["TotalCashIn"])+int.parse(DueAmountPayController.text.trim().toString())).toString(),
                };


              await docUser.update(jsonData).then((value) => setState(() async{

            final docUser = FirebaseFirestore.instance.collection("DuePaymentAddInfo");

                final PayData ={
                    "CustomerName":AllDueCustomerInfo[index]["InterestDue"],
                    "CustomerPhoneNo":AllDueCustomerInfo[index]["CustomerPhoneNo"],
                    "CustomerAddress":AllDueCustomerInfo[index]["CustomerAddress"],
                    "CustomerID":AllDueCustomerInfo[index]["CustomerID"],
                    "ProductVisibleID":AllDueCustomerInfo[index]["ProductVisibleID"],
                    "ProductUniqueID":AllDueCustomerInfo[index]["ProductUniqueID"],
                    "FileNo":AllDueCustomerInfo[index]["FileNo"],
                    "TrxID":TrxID,
                    "InterestDue":(int.parse(AllDueCustomerInfo[index]["InterestDue"])-int.parse(InterestPayController.text.trim().toString())).toString(),
                    "InterestPaid":(int.parse(AllDueCustomerInfo[index]["InterestPaid"])+int.parse(InterestPayController.text.trim().toString())).toString(),
                    "Due":(int.parse(AllDueCustomerInfo[index]["Due"])-int.parse(DueAmountPayController.text.trim().toString())).toString(),
                    "CustomerType":DueAmountInt<=0?"Paid":"Due",
                    "TotalCashIn":(int.parse(AllDueCustomerInfo[index]["TotalCashIn"])+int.parse(DueAmountPayController.text.trim().toString())).toString(),
                    "CashIn":DueAmountPayController.text.trim(),
                    "year":"${DateTime.now().year}",
                    "month":"${DateTime.now().month}/${DateTime.now().year}",
                    "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                    "DateTime":DateTime.now().toIso8601String(),
                };


              await docUser.doc(TrxID).set(PayData).then((value) => setState(() async{

                loading = false;

                  Navigator.pop(context);
                  getDueCustomerInfo();

              })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
                        content: const Text('Something Wrong!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      )));

                  // Navigator.pop(context);
                  // getDueCustomerInfo();



                    try {

                          var AdminMsg = "Dear Customer,Tarongo Electronics এ ${DueAmountPayController.text.trim()} টাকা কিস্তি পরিশোধ করেছেন।";



                        final response = await http
                            .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=1024519252916991043295858a1b3ac3cb09ae52385b1489dff95&to=${AllDueCustomerInfo[index]["CustomerPhoneNo"]}&message=${AdminMsg}'));

                        if (response.statusCode == 200) {
                          // If the server did return a 200 OK response,
                          // then parse the JSON.
                          print(jsonDecode(response.body));
                          
                        
                        } else {
                          // If the server did not return a 200 OK response,
                          // then throw an exception.
                          throw Exception('Failed to load album');
                        }


                        } catch (e) {
                          
                        }


              })).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
                        content: const Text('Something Wrong!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      )));

                                      // Navigator.pop(context);
                                    },
                                    child: Text('Receive'),
                                  ),
                                ],
                              );});});



                
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

  // void selectDestination(int index) {
  //   setState(() {

  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
  //     _selectedDestination = index;
  //   });
  // }
}