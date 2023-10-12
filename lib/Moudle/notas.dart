

class Notaas{

  int?  columnId ;
  String?  name ;
  String?  phone ;
  String?   email ;
  String?  note;

Notaas(this.columnId ,this.name ,this.phone , this.email , this.note );



Notaas.fromMap(Map<String, dynamic> map) {
    columnId = map["id"];
    name = map["name"];
    phone = map["phone"];
    email = map["email"];
    note = map["note"];
    
  }


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    if (columnId != null) {
      map["id"] = columnId;
    }
    map["name"] = name;
    map["phone"] = phone;
    map["email"] = email;
    map["note"] = note;
    return map;
  }
  
  }