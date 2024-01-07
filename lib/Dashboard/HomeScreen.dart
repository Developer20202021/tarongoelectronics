import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:uuid/uuid.dart';


class HomeScreen extends StatefulWidget {


  HomeScreen({super.key,});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDestination = 0;

   var uuid = Uuid();


  TextEditingController SearchByProductIDController = TextEditingController();

   TextEditingController ProductNameController = TextEditingController();
   TextEditingController ProductDescriptionController = TextEditingController();
   TextEditingController StockAmountController = TextEditingController();
   TextEditingController BuyingPriceController = TextEditingController();
   TextEditingController SalePriceController = TextEditingController();
   TextEditingController CustomerNameController = TextEditingController();
   TextEditingController CustomerPhoneNoController = TextEditingController();
   TextEditingController CustomerAddressController = TextEditingController();
   TextEditingController ConditionMonthController = TextEditingController();
   TextEditingController DiscountAmountController= TextEditingController();
   TextEditingController CashInController= TextEditingController();
   TextEditingController InterestController= TextEditingController();
   TextEditingController FileNoController = TextEditingController();








static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));



// var ProductID = "";




List  AllProductInfoData = [];




Future<void> getProductInfo() async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductInfo');

    QuerySnapshot DueCustomerquerySnapshot = await _collectionDueCustomerRef.get();

    // Get data from docs and convert map to List
     AllProductInfoData = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllProductInfoData = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
     });

    // print(AllData);
}





Future<void> getSearchProductInfo(String ProductVisibleID) async {


  CollectionReference _collectionDueCustomerRef =
    FirebaseFirestore.instance.collection('ProductInfo');

    Query DueCustomerquery = _collectionDueCustomerRef.where("ProductVisibleID", isEqualTo: ProductVisibleID);

    QuerySnapshot DueCustomerquerySnapshot = await DueCustomerquery.get();

    // Get data from docs and convert map to List
     AllProductInfoData = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();

     setState(() {
       AllProductInfoData = DueCustomerquerySnapshot.docs.map((doc) => doc.data()).toList();
       SearchByProductIDController.clear();
     });

    // print(AllData);
}














@override
  void initState() {

    FlutterNativeSplash.remove();

    getProductInfo();

    // TODO: implement initState
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    var ProductUniqueID = uuid.v4();

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


                  PopupMenuButton(
                      onSelected: (value) {
                        // your logic
                      },
                      itemBuilder: (BuildContext bc) {
                        return  [
                          PopupMenuItem(
                                child: Text("ষ্টক যুক্ত করুন", style: TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                                            value: '/about',
                                            onTap: () async {


                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  String SelectedStudentStatus =
                                                      "";
                                                  String Title ="নিচে Product এর Details লিখুন";

                                                    bool loading = false;

                                                  
                                                

                                                  // String LabelText ="আয়ের খাত লিখবেন";

                                                  return StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return AlertDialog(
                                                        title:  Column(
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                  "${Title}", style: TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                                                            ),

                                                            
                                                    

                            
                                                          ],
                                                        ),
                                                        content:loading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
                                                          
                                                          child:  Column(
                                                            children: [
              
              Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product Name',

                      hintText: 'Product Name',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: ProductNameController,
                  ),
                ),

                                       
                      SizedBox(
                              height: 20,
                            ),

                    

                    Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product Description',

                      hintText: 'Product Description',

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
                    controller: ProductDescriptionController,
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),




                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Amount',

                      hintText: 'Stock Amount',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: StockAmountController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),

                  


                  Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Buying Price',

                      hintText: 'Buying Price',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: BuyingPriceController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),


              
              Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sale Price',

                      hintText: 'Sale Price',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: SalePriceController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),






                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child:
                                                                Text("Cancel"),
                                                          ),


                                                  ElevatedButton(
                                                          onPressed:
                                                            () async {

            setState((){

              loading = true;

            });


             var id=getRandomString(7);


            var updateData =
                      {
                        "ProductName":ProductNameController.text.trim().toString(),
                        "ProductDescription":ProductDescriptionController.text.trim().toString(),
                        "ProductAmount":StockAmountController.text.trim().toString(),
                        "BuyingPrice":BuyingPriceController.text.trim().toString(),
                        "SalePrice":SalePriceController.text.trim().toString(),
                        "ProductUniqueID":ProductUniqueID,
                        "ProductVisibleID":id.toString().toLowerCase(),
                        "year":"${DateTime.now().year}",
                        "month":"${DateTime.now().month}/${DateTime.now().year}",
                        "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        "DateTime":DateTime.now().toIso8601String(),
                        };

                  final StudentInfo = FirebaseFirestore.instance.collection('ProductInfo').doc(ProductUniqueID);
                  
                  StudentInfo.set(updateData).then((value) =>setState(() {
                                        

                                  // Navigator.pop(context);


                              
                            AwesomeDialog(
                              width: 500,
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              body: Center(child: Text("আপনি আপনার Product এর গায়ে (${id.toString().toUpperCase()}) Code টি লিখে রাখুন", style: const TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),)),
                              title: 'নিচে Product এর Code টি দেখুন',
                              desc:   'নিচে Product এর Code টি দেখুন',
                              btnOkOnPress: () {

                                Navigator.pop(context);

                              },
                              )..show();





                                final snackBar = SnackBar(
                                        
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                        titleFontSize: 12,
                                        title: 'successfull',
                                        message: 'Hey Thank You. Good Job',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.success,
                                                ),
                                            );

                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

                       setState(() {
                        loading = false;
                             });
                            }))
                      .onError((error,stackTrace) =>setState(() {
                        final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                        title: 'Something Wrong!!!!',
                        message: 'Try again later...',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                            ),
                        );

                ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

                      setState(() {
                            loading = false;
                               });
                      }));




                                                                  },
                                                                  child: const Text(
                                                                      "Save"),
                                                                ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                          PopupMenuItem(
                            value: '/hello',
                            child: Text("আজকের বিক্রয়ের তথ্য", style: TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                          ),
                         PopupMenuItem(
                            value: '/hello',
                            child: Text("মাসিক বিক্রয়ের তথ্য", style: TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                          ),


                           PopupMenuItem(
                            value: '/hello',
                            child: Text("বকেয়া বিক্রয়ের তথ্য", style: TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                          ),




                        ];
                      },
                    ),




                  Text("Dashboard"),

                    Row(
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

                  getSearchProductInfo(SearchByProductIDController.text.trim().toLowerCase());


                }, child: Text("Search")),

                ],),
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
                          headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          columnSpacing: 12,
                          headingRowColor: MaterialStatePropertyAll(Colors.pink),
                          horizontalMargin: 12,
                          minWidth: 600,
                          dividerThickness: 3,
                          columns: [
                            DataColumn2(
                              label: Text('SL'),
                              size: ColumnSize.L,
                            ),
                            DataColumn(
                              label: Text('Product ID'),
                            ),
                            DataColumn(
                              label: Text('Product Name'),
                            ),
                            DataColumn(
                              label: Text('Product Amount'),
                            ),
                            DataColumn(
                              label: Text('Buying Price'),
                            ),
                            DataColumn(
                              label: Text('Sale Price'),
                              numeric: true,
                            ),
                             DataColumn(
                              label: Text('Sale'),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text('Edit'),
                              numeric: true,
                            ),

                            DataColumn(
                              label: Text('Details'),
                              numeric: true,
                            ),
                          ],
                          rows: List<DataRow>.generate(
                              AllProductInfoData.length,
                              (index) => DataRow(cells: [
                                    DataCell(Text('${index+1}')),
                                    DataCell(Text(AllProductInfoData[index]["ProductVisibleID"].toString().toUpperCase())),
                                    DataCell(Text(AllProductInfoData[index]["ProductName"].toString().toUpperCase())),
                                    DataCell(Text(AllProductInfoData[index]["ProductAmount"].toString().toUpperCase())),
                                    DataCell(Text("${AllProductInfoData[index]["BuyingPrice"].toString().toUpperCase()}৳")),
                                    DataCell(Text("${AllProductInfoData[index]["SalePrice"].toString().toUpperCase()}৳")),

                                    

                                    int.parse(AllProductInfoData[index]["ProductAmount"].toString())<=0?DataCell(Text("Out of stock", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)):
                                    DataCell(ElevatedButton(onPressed: (){


                                

                                showDialog(
                                                context: context,
                                                builder: (context) {
                                                  String SelectedStudentStatus =
                                                      "";
                                                  String Title ="নিচে Customer এর Details লিখুন";
                                                  bool DiscountAvailable = false;
                                                  bool ConditionAvailable = false;

                                                   bool loading = false;

                                                  ProductNameController.text = AllProductInfoData[index]["ProductName"];

                                                  ProductDescriptionController.text=
                                                    AllProductInfoData[index]["ProductDescription"];
                                                  
                                                  StockAmountController.text =AllProductInfoData[index]["ProductAmount"];

                                                  SalePriceController.text =AllProductInfoData[index]["SalePrice"];

                                                  BuyingPriceController.text =AllProductInfoData[index]["BuyingPrice"];

                                                  var QtyAmount="1";
                                                  
                                                

                                                  // String LabelText ="আয়ের খাত লিখবেন";

                                                  return StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return AlertDialog(
                                                        title:  Column(
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                  Title, style: const TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                                                            ),

                                                            
                                                    

                            
                                                          ],
                                                        ),
                                                        content:loading?const Center(child: CircularProgressIndicator(),):SingleChildScrollView(
                                                          
                                                          child:  Column(
                                                            children: [
              
              


                SizedBox(height:10),

                Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Amount: ${AllProductInfoData[index]["ProductAmount"]}',

                      hintText: 'Stock Amount: ${AllProductInfoData[index]["ProductAmount"]}',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: StockAmountController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),

                  


                  Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Buying Price: ${AllProductInfoData[index]["BuyingPrice"]}',

                      hintText: 'Buying Price: ${AllProductInfoData[index]["BuyingPrice"]}',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: BuyingPriceController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),


              
              Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sale Price:${AllProductInfoData[index]["SalePrice"]}',

                      hintText: 'Sale Price:${AllProductInfoData[index]["SalePrice"]}',

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
                    controller: SalePriceController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),


                  
                  Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Customer Name',

                      hintText: 'Customer Name',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: CustomerNameController,
                  ),
                ),

                                       
                      SizedBox(
                              height: 20,
                            ),

                    

                    Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Customer Phone No',

                      hintText: 'Customer Phone No',

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
                    controller: CustomerPhoneNoController,
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),


                
                Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Customer Address',

                      hintText: 'Customer Address',

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
                    controller: CustomerAddressController,
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),


              Container(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    
                    onChanged: (value) {},
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'TotalPrice:${(int.parse(AllProductInfoData[index]["SalePrice"].toString())*int.parse(QtyAmount))}',

                      hintText: 'TotalPrice:${(int.parse(AllProductInfoData[index]["SalePrice"].toString())*int.parse(QtyAmount))}',

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
                   
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),

              
               InputQty(
                
                  decoration: QtyDecorationProps(width: 50, contentPadding: EdgeInsets.all(20)),
                  maxVal: double.parse(AllProductInfoData[index]["ProductAmount"].toString()),
                  initVal: 1,
                  minVal: 1,
                  steps: 1,
                  onQtyChanged: (val) {

                    setState((){
                      QtyAmount = val.toString();
                    });
                    print(val);
                  },
                ),


                 SizedBox(
                              height: 20,
                            ),


              

              Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cash In',

                      hintText: 'Cash In',

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
                    controller: CashInController,
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),

                
                Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'File No',

                      hintText: 'File No',

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
                    controller: FileNoController,
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),

                
                      CheckboxListTile(
                                      title: const Text(
                                          "Discount Available?"
                                              ,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Josefin Sans")),
                                      value: DiscountAvailable,
                                      onChanged: (newValue) {
                                        setState(() {
                                          DiscountAvailable = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),


                        
                        SizedBox(
                              height: 20,
                            ),


                        
                        CheckboxListTile(
                                      title: const Text(
                                          "Condition Available?"
                                              ,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Josefin Sans")),
                                      value: ConditionAvailable,
                                      onChanged: (newValue) {
                                        setState(() {
                                          ConditionAvailable = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),


                  SizedBox(
                              height: 10,
                            ),
                      

                DiscountAvailable?Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Discount Amount',

                      hintText: 'Discount Amount',

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
                    controller: DiscountAmountController,
                  ),
                ):Text(""),

                 SizedBox(
                              height: 10,
                            ),

                
                 DiscountAvailable?Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Interest',

                      hintText: 'Interest',

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
                    controller: InterestController,
                  ),
                ):Text(""),

                 SizedBox(
                              height: 10,
                            ),

                
                ConditionAvailable?Container(
                  width: 300,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Condition month',

                      hintText: 'Condition month',

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
                    controller: ConditionMonthController,
                  ),
                ):Text(""),







                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child:
                                                                Text("Cancel"),
                                                          ),


                                                  ElevatedButton(
                                                          onPressed:
                                                            () async {

            setState((){

              loading = true;

            });


            var CustomerType ="Due";

            if (DiscountAvailable) {


              if ((((int.parse(AllProductInfoData[index]["SalePrice"].toString())*int.parse(QtyAmount))-int.parse(CashInController.text.trim().toString()))-int.parse(DiscountAmountController.text.trim().toString()))<=0) {

                setState((){

                  CustomerType ="Paid";

                });
                
              } else {

                 setState((){

                  CustomerType ="Due";

                });
                
              }


              
            } else {


              if ((int.parse(AllProductInfoData[index]["SalePrice"].toString())-int.parse(CashInController.text.trim().toString()))<=0) {

                setState((){

                  CustomerType ="Paid";

                });
                
              } else {

                setState((){

                  CustomerType ="Due";

                });
                
              }
              
            }


           


            var updateData =
                      {
                        "CustomerID":ProductUniqueID,
                        "ProductName":ProductNameController.text.trim().toString(),
                        "ProductDescription":ProductDescriptionController.text.trim().toString(),
                       "ProductUniqueID":AllProductInfoData[index]["ProductUniqueID"],

                       "ProductVisibleID":AllProductInfoData[index]["ProductVisibleID"],
                       "CustomerName":CustomerNameController.text.trim().toLowerCase(),
                       "CustomerPhoneNo":CustomerPhoneNoController.text.trim(),
                       "CustomerAddress":CustomerAddressController.text.trim(),
                       "Discount":DiscountAvailable?DiscountAmountController.text.trim().toString():"0",
                       "Interest":DiscountAvailable?InterestController.text.trim().toString():"0",
                       "Qty":QtyAmount,
                      'CustomerType':CustomerType,
                       "Due":DiscountAvailable?(((int.parse(AllProductInfoData[index]["SalePrice"].toString())*int.parse(QtyAmount))-int.parse(CashInController.text.trim().toString()))-int.parse(DiscountAmountController.text.trim().toString())):(int.parse(AllProductInfoData[index]["SalePrice"].toString())-int.parse(CashInController.text.trim().toString())),
                       "FileNo":FileNoController.text.trim(),
                       "CashIn":CashInController.text.trim().toString(),
                       "TotalCashIn":CashInController.text.trim().toString(),
                       "TotalPrice":(int.parse(AllProductInfoData[index]["SalePrice"].toString())*int.parse(QtyAmount)).toString(),
                       "ConditionMonth":ConditionAvailable?ConditionMonthController.text.trim().toString():"0",
                        "BuyingPrice":AllProductInfoData[index]["BuyingPrice"],
                        "SalePrice":AllProductInfoData[index]["SalePrice"],
                        "year":"${DateTime.now().year}",
                        "month":"${DateTime.now().month}/${DateTime.now().year}",
                        "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        "DateTime":DateTime.now().toIso8601String(),
                        "PaymentGivingDay":DateTime.now().day==31?"30":"${DateTime.now().day}"
                        };

                  final StudentInfo = FirebaseFirestore.instance.collection('ProductSaleInfo').doc(ProductUniqueID);
                  
                  StudentInfo.set(updateData).then((value) =>setState(() async{





                    final docUser = FirebaseFirestore.instance.collection("ProductInfo").doc(AllProductInfoData[index]["ProductUniqueID"]);

                final jsonData ={

                    "ProductAmount":(int.parse(AllProductInfoData[index]["ProductAmount"].toString())-int.parse(QtyAmount)).toString(),
                
                  
                };


              await docUser.update(jsonData).then((value) => setState(() async{

                loading = false;

                  Navigator.pop(context);

                  getProductInfo();



                    try {

                          var AdminMsg = "Dear Customer,Tarongo Electronics থেকে আপনি ${CashInController.text.trim()} টাকা দিয়ে একটি Product ক্রয় করেছেন।";



                        final response = await http
                            .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=1024519252916991043295858a1b3ac3cb09ae52385b1489dff95&to=${CustomerPhoneNoController.text.trim()}&message=${AdminMsg}'));

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

                            // getProductInfo();


                              
                            // AwesomeDialog(
                            //   width: 500,
                            //   context: context,
                            //   animType: AnimType.scale,
                            //   dialogType: DialogType.success,
                            //   body: Center(child: Text("আপনি আপনার Product এর গায়ে (${AllProductInfoData[index]["ProductVisibleID"]}) Code টি লিখে রাখুন", style: const TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),)),
                            //   title: 'নিচে Product এর Code টি দেখুন',
                            //   desc:   'নিচে Product এর Code টি দেখুন',
                            //   btnOkOnPress: () {

                            //     Navigator.pop(context);

                            //   },
                            //   ).show();





                                final snackBar = SnackBar(
                                        
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                        titleFontSize: 12,
                                        title: 'successfull',
                                        message: 'Hey Thank You. Good Job',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.success,
                                                ),
                                            );

                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

                       setState(() {
                        loading = false;
                             });
                            }))
                      .onError((error,stackTrace) =>setState(() {
                        final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                        title: 'Something Wrong!!!!',
                        message: 'Try again later...',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                            ),
                        );

                ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

                      setState(() {
                            loading = false;
                               });
                      }));




                                                                  },
                                                                  child: const Text(
                                                                      "Save"),
                                                                ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              );













                                    }, child: Text("Sale"))),

                                    DataCell(ElevatedButton(onPressed: () async{


                                      showDialog(
                                                context: context,
                                                builder: (context) {
                                                  String SelectedStudentStatus =
                                                      "";
                                                  String Title ="নিচে Product Edit করুন";

                                                   bool loading = false;

                                                  ProductNameController.text = AllProductInfoData[index]["ProductName"];

                                                  ProductDescriptionController.text=
                                                    AllProductInfoData[index]["ProductDescription"];
                                                  
                                                  StockAmountController.text =AllProductInfoData[index]["ProductAmount"];

                                                  SalePriceController.text =AllProductInfoData[index]["SalePrice"];

                                                  BuyingPriceController.text =AllProductInfoData[index]["BuyingPrice"];
                                                  
                                                

                                                  // String LabelText ="আয়ের খাত লিখবেন";

                                                  return StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return AlertDialog(
                                                        title:  Column(
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                  Title, style: const TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),),
                                                            ),

                                                            
                                                    

                            
                                                          ],
                                                        ),
                                                        content:loading?const Center(child: CircularProgressIndicator(),):SingleChildScrollView(
                                                          
                                                          child:  Column(
                                                            children: [
              
              Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product Name',

                      hintText: 'Product Name',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: ProductNameController,
                  ),
                ),

                                       
                      SizedBox(
                              height: 20,
                            ),

                    

                    Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product Description',

                      hintText: 'Product Description',

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
                    controller: ProductDescriptionController,
                  ),
                ),

                 SizedBox(
                              height: 20,
                            ),




                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Amount',

                      hintText: 'Stock Amount',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: StockAmountController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),

                  


                  Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Buying Price',

                      hintText: 'Buying Price',

                      //  enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //     ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    ),
                    controller: BuyingPriceController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),


              
              Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sale Price',

                      hintText: 'Sale Price',

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
                    controller: SalePriceController,
                  ),
                ),

                                       
                   SizedBox(
                              height: 20,
                            ),






                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child:
                                                                Text("Cancel"),
                                                          ),


                                                  ElevatedButton(
                                                          onPressed:
                                                            () async {

            setState((){

              loading = true;

            });


           


            var updateData =
                      {
                        "ProductName":ProductNameController.text.trim().toString(),
                        "ProductDescription":ProductDescriptionController.text.trim().toString(),
                        "ProductAmount":StockAmountController.text.trim().toString(),
                        "BuyingPrice":BuyingPriceController.text.trim().toString(),
                        "SalePrice":SalePriceController.text.trim().toString(),
                        "year":"${DateTime.now().year}",
                        "month":"${DateTime.now().month}/${DateTime.now().year}",
                        "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        "DateTime":DateTime.now().toIso8601String(),
                        };

                  final StudentInfo = FirebaseFirestore.instance.collection('ProductInfo').doc(AllProductInfoData[index]["ProductUniqueID"]);
                  
                  StudentInfo.update(updateData).then((value) =>setState(() {
                                        

                                  // Navigator.pop(context);

                            getProductInfo();


                              
                            AwesomeDialog(
                              width: 500,
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              body: Center(child: Text("আপনি আপনার Product এর গায়ে (${AllProductInfoData[index]["ProductVisibleID"]}) Code টি লিখে রাখুন", style: const TextStyle(fontFamily: "Josefin Sans", fontWeight: FontWeight.bold),)),
                              title: 'নিচে Product এর Code টি দেখুন',
                              desc:   'নিচে Product এর Code টি দেখুন',
                              btnOkOnPress: () {

                                Navigator.pop(context);

                              },
                              ).show();





                                final snackBar = SnackBar(
                                        
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                        titleFontSize: 12,
                                        title: 'successfull',
                                        message: 'Hey Thank You. Good Job',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.success,
                                                ),
                                            );

                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

                       setState(() {
                        loading = false;
                             });
                            }))
                      .onError((error,stackTrace) =>setState(() {
                        final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                        title: 'Something Wrong!!!!',
                        message: 'Try again later...',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                            ),
                        );

                ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

                      setState(() {
                            loading = false;
                               });
                      }));




                                                                  },
                                                                  child: const Text(
                                                                      "Save"),
                                                                ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              );









                                    }, child: Text("Edit", style: TextStyle(color: Colors.white),), style: ButtonStyle(shadowColor: MaterialStatePropertyAll(Colors.green), backgroundColor: MaterialStatePropertyAll(Colors.green),),)),

                                  DataCell(ElevatedButton(onPressed: () {


                                     showDialog(
                                                context: context,
                                                builder: (context) {
                                         

                              return StatefulBuilder(
                                      builder:(context, setState) {
                               return AlertDialog(
                                      title: Text('Show Details ${AllProductInfoData[index]["ProductVisibleID"].toString().toUpperCase()}'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Product ID: ${AllProductInfoData[index]["ProductVisibleID"].toString().toUpperCase()}"),
                                            
                                            Text("Product Name: ${AllProductInfoData[index]["ProductName"]}"),

                                            Text("Product Description: ${AllProductInfoData[index]["ProductDescription"]}"),


                                            Text("Product Buying Price: ${AllProductInfoData[index]["BuyingPrice"]}"),

                                            Text("Product Sale Price: ${AllProductInfoData[index]["SalePrice"]}"),


                                            Text("Product Stock: ${AllProductInfoData[index]["ProductAmount"]}"),
                                          
                                          Text("Stock Date: ${AllProductInfoData[index]["Date"]}"),



                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                         
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('CANCEL'),
                                        ),

                                       ElevatedButton(
                                          
                                          onPressed: () {Navigator.pop(context);},
                                          child: Text('ACCEPT'),
                                        ),
                                      ],
                                    );});});




                                  }, child: Text("Details")))

                                  ]))),
                    ),
                 ),

                
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




