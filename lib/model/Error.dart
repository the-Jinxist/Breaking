
class Error{

  final int statusCode;

  Error(this.statusCode);

  String getErrorFromStatusCode(){
    switch(this.statusCode){

      case 301: {
        return "This website has been moved permanently!";
      }
      case 302: {
        return "Found. Redirecting...";
      }
      case 303: {
        return "See Other";
      }
      case 304: {
        return "Not Modified";
      }
      case 307: {
        return "Temporarty Redirect";
      }
      case 400: {
        return "Bad Request";
      }
      case 401: {
        return "Unauthorized";
      }
      case 403: {
        return "Forbidden";
      }
      case 404: {
        return "Not Found";
      }
      case 405: {
        return "Method not allowed";
      }
      case 406: {
        return "Not acceptable";
      }
      case 412: {
        return "Precondition Failed";
      }
      case 415: {
        return "Unsupported media type";
      }
      case 500: {
        return "Internal server error";
      }
      case 501: {
        return "Not implemented";
      }
      default: {
        return "Sorry, an error occurred";
      }

    }
  }

}