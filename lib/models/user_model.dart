class User {
  String uid;
  String username;
  String email;
  int type;

  User(
    this.uid,
    this.username,
    this.email,
    this.type,
  );


  User.fromJson(Map<dynamic, dynamic> json){
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
    type = json['type'];
  }


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'username': username,
    'email': email,
    'type': type,
  };
}
