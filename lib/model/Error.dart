
class Error{

  final int statusCode;

  Error(this.statusCode);

  String getErrorFromStatusCode(){
    switch(this.statusCode){
      case 123: {
        return "The monkey is fire";
      }
      default: {
        return "";
      }

    }
  }

}