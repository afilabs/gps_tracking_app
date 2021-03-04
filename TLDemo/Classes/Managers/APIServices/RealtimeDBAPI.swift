
import UIKit
import SwiftyJSON
import FirebaseDatabase
import CoreLocation

public enum APIResult {
    case success(data: Any?)
    case error(error: Error?)
}

typealias GenericAPICallback<RESULT, ERROR> = (_ result: APIResult) -> Void
typealias APICallback<RESULT> = GenericAPICallback<RESULT, Error>



let STATUS_SUCCESS = 200
let STATUS_SUCCESS_2 = 304

//MARK: Support Functions
class RealtimeDBAPI: NSObject  {
    
    static let shared = RealtimeDBAPI()
    var ref: DatabaseReference!

     enum StatusCode: Int {
         case success = 200
         case invalidInput = 400
         case notAuthorized = 401
         case serverError = 721
         case tokenFail = 603
     }
    
    override init() {
        ref = Database.database().reference()
    }
          
    
    func trackingLocation(location:CLLocationCoordinate2D, callback:@escaping (_ result: APIResult) -> Void) {
        let user_id = UIDevice.current.identifierForVendor?.uuidString ?? ""
        let value = ["location": ["lat":location.latitude,"lng":location.longitude]]
        self.ref.child("users").child(user_id).setValue(value) { (error, dbRef) in
            if (error == nil){
                callback(.success(data: dbRef.database))
            }else {
                callback(.error(error: error))
            }
        }
    }
}
