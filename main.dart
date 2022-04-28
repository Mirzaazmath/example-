

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
class homepage extends StatefulWidget {
   homepage({Key? key}) : super(key: key);


  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  TextEditingController Email= TextEditingController();
  TextEditingController phone= TextEditingController();
  String email1="";
  String mobile="";

  List<String> totalEm=[];
  List<String> totalNo=[];

  int total=0;



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("DEMO",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
        child:SingleChildScrollView(

          child:Form(
            child:   Column(
              children: [
                SizedBox(height: 25,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:    TextField(
                        controller: Email,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                          hintText: "Enter Email",
                          label: Text("Email",style: TextStyle(color: Colors.purpleAccent),),

                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:    TextField(
                        keyboardType: TextInputType.phone,
                          controller: phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            hintText: "Enter NUMBER",
                            label: Text("MOBILE NO:",style: TextStyle(color: Colors.purpleAccent),),

                          )

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25,),
                Padding(padding: EdgeInsets.all(50),

                    child: Container(
                      height: 50,
                      width: 550,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child:  RaisedButton(
                        elevation: 10,

                        color: Colors.deepPurple,
                        onPressed:  (){
                          validation(context);
                        }, child:  Text("SAVE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
                    )



                ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:totalEm.length,
                itemBuilder: (context, int index){
                  return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child:
                    index==0?SizedBox():
                    Container(
                        height: 75,

                        child:Card(

                          color:Colors.grey[300] ,
                          elevation: 1,

                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),

                                      child: Text(totalEm[index],style: TextStyle(fontSize: 20),),

                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5),
                                      child:     Text(totalNo[index],style: TextStyle(fontSize: 10)),
                                    ),


                                  ],
                                ), ),


                              Padding(padding: EdgeInsets.all(5),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child:Icon(Icons.delete),
                                ),

                              )


                            ],



                          ),






                        )


                    ),

                  );


                }),


              ],
            ),
                        )


        ),
      )

    );
}
  validation(BuildContext context)
  {
    String phone1= phone.text;
    var email = Email.text;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(emailValid &&  phone1.length==10)
    {
      setState(() {

        totalEm.insert(total, email);
        totalNo.insert(total, phone1);
        total++;

        //email1=email;
       // mobile=phone1;
      });

    }
    else{
      final snackBar = SnackBar(
        content: const Text('Check your Email Amd Mobile no:'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);



    }



  }

}


