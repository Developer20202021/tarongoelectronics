import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';





class PerDayDuePaymentAddHistory extends StatefulWidget {
  const PerDayDuePaymentAddHistory({super.key});

  @override
  State<PerDayDuePaymentAddHistory> createState() => _PerDayDuePaymentAddHistoryState();
}

class _PerDayDuePaymentAddHistoryState extends State<PerDayDuePaymentAddHistory> {


  // এখানে Date দিয়ে Data fetch করতে হবে। 

  var VisiblePaymentDate = "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";
  


     void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      // TODO: implement your code here

          if (args.value is PickerDateRange) {

            try {
          final DateTime rangeStartDate = args.value.startDate;
          var adminSetDay = rangeStartDate.day;
          var adminSetMonth = rangeStartDate.month;
          var adminSetYear = rangeStartDate.year;

          var paymentDate = "${adminSetDay}/${adminSetMonth}/${adminSetYear}";

          VisiblePaymentDate = paymentDate;

          print("${adminSetDay}/${adminSetMonth}/${adminSetYear}");


          getData(paymentDate);





          final DateTime rangeEndDate = args.value.endDate;
              
            } catch (e) {
              
            }
         
        } else if (args.value is DateTime) {
          final DateTime selectedDate = args.value;
          print(selectedDate);
        } else if (args.value is List<DateTime>) {
          final List<DateTime> selectedDates = args.value;
          print(selectedDates);
        } else {
          final List<PickerDateRange> selectedRanges = args.value;
          print(selectedRanges);
        }




      
      
    }



 var PaymentDate = "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";


    
  // Firebase All Customer Data Load

List  AllData = [];
    int moneyAdd = 0;
    var DataLoad = "";

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('DuePaymentAddInfo');

Future<void> getData(String paymentDate) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("Date", isEqualTo: paymentDate);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();


     moneyAdd = 0;


     if (AllData.length == 0) {
       setState(() {
        DataLoad = "0";
      });
       
     } else {

      setState(() {
        DataLoad = "";
      });

      for (var i = 0; i < AllData.length; i++) {

       var money = AllData[i]["CashIn"];
      int moneyInt = int.parse(money);

      

      setState(() {
        moneyAdd = moneyAdd + moneyInt;
        AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
       
     }

     print(moneyAdd);
       
     }

     

  

    print(AllData);
}


@override
  void initState() {
    // TODO: implement initState
    getData(PaymentDate);
    super.initState();
  }



   
  Future refresh() async{


    setState(() {
      
  getData(PaymentDate);

    });




  }


 






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(onPressed: (){

        // Navigator.push(
        //                 context,MaterialPageRoute(builder: (context) => DueCollectionPDFPreview(CloseFileData: AllData, TotalMoney: moneyAdd.toString(),)),
        //               );

      }, child: Text("Print"),),
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title:  Text("${VisiblePaymentDate} বকেয়া টাকা উত্তোলন History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
         actions: [
        IconButton(onPressed: (){


          showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            
            color:Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${VisiblePaymentDate} তারিখে ${moneyAdd}৳ টাকা উত্তোলিত হয়েছে।", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),),


            SizedBox(height: 10,),


          Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
          
        
        ],
      );
    });

        }, icon: Icon(Icons.date_range, color: Theme.of(context).primaryColor,))

      ],
        
      ),
      body:DataLoad == "0"? Center(child: Text("No Data Available")): RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
              itemCount: AllData.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
              itemBuilder: (BuildContext context, int index) {
      
                    //  DateTime paymentDateTime = (AllData[index]["PaymentDateTime"] as Timestamp).toDate();
      
      
                return   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(

                  
                             shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                      
                            title: Text("${AllData[index]["CashIn"]}৳", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            trailing: ElevatedButton(onPressed: (){

                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DuePayPDFPreview(PaymentData:[AllData[index]],)));


                            }, child: Text("Print")),
                            subtitle: Column(
      
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Name:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                                    Text("${AllData[index]["CustomerName"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Address:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                                    Text("${AllData[index]["CustomerAddress"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),

                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Phone Numnber:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                                    Text("${AllData[index]["CustomerPhoneNumber"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),
      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Cash In:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green),),

                                    Text("${AllData[index]["CashIn"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),
      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Due:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),),

                                    Text("${AllData[index]["Due"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),


                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Total Cash In:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),),

                                    Text("${AllData[index]["TotalCashIn"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    const Text("Date:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),),

                                    Text("${AllData[index]["Date"]}", style: const TextStyle( fontSize: 13),),

                                  ],
                                ),
                              ],
                            ),
                      
                      
                      
                          ),
                );
              },
            ),
      ));
  }
}