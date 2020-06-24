import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {


  TextEditingController _newMessageController = TextEditingController();

  FirebaseUser user;

  @override
  initState(){
    super.initState();
    FirebaseAuth.instance.currentUser().then((value) => user = value).catchError((er)=> Navigator.of(context).pop());

  }
  
  
  sendMessage()async {
    if(_newMessageController.text.isNotEmpty){
      Firestore.instance.collection("chats").document(user.uid).collection("userChats").add({
        "timeStamp": DateTime.now().millisecondsSinceEpoch,
        "message": _newMessageController.text,
        "userId": user?.uid
      }).then((value) => _newMessageController.value = TextEditingValue(text: ""));
    }
  }


  _getMessages() async {
    if(user == null)user = await FirebaseAuth.instance.currentUser();
    return Firestore.instance.collection("chats").document(user?.uid).collection('userChats').orderBy('timeStamp').snapshots();
  }
  
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            height: 48,
            alignment: Alignment.center,
            child: Text("contact us".toUpperCase(),style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ),
        title: Image.asset("assets/images/small_logo.png"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
          ),
        ),
      ),
        body: Container(
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                child: StreamBuilder(
                  stream: _getMessages(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      if(snapshot.data.documents.length < 1){
                        return Center(child: Text("No Chats Yet"),);
                      }
                      else{
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context,ind){
                              return ListTile(
                                leading: snapshot.data.documents[ind]["userId"] != user.uid?CircleAvatar(
                                  child: Text("A"),
                                ): null,
                                trailing: snapshot.data.documents[ind]["userId"] == user.uid?CircleAvatar(
                                  child: Text("U"),
                                ): null,
                                title: Container(
                                  width: width * 0.3,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Text("${snapshot.data.documents[ind]['message']}"),
                                ),

                              );
                            });
                      }
                    }
                    else{
                      return Center(child: CircularProgressIndicator());
                    }

                  },
                )
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  width: width,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width * .8,
                        child: TextField(
                          controller: _newMessageController,
                          decoration: InputDecoration(
                            hintText: "Your message"
                          ),
                        ),
                      ),
                      FittedBox(
                          fit: BoxFit.fitWidth,
                          child: InkWell(
                              onTap: ()=> sendMessage(),
                              child: Text("Send".toUpperCase())))
                    ],
                  ),
                ),
              )
            ],
          ),

        ));
  }
}
