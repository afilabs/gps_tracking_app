

import Foundation
import UIKit
import CoreLocation

func App() -> AppDelegate {    
    return UIApplication.shared.delegate as! AppDelegate;
}

func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

func E(_ val: String?) -> String {
    return (val != nil) ? val! : "";
}

func SF(_ val: String?, para:CVarArg? = nil) -> String{
    return String(format: E(val), para!)
}

func SF(_ val: String?, _ para: CVarArg) -> String{
    return String(format: E(val), para)
}

func isEmpty(_ val: String?) -> Bool {
    return val == nil ? true : val!.isEmpty;
}

func ClassName(_ object: Any) -> String {
    return String(describing: type(of: object))
}

func MURL(_ server: String, _ path: String) -> String{
    return server.appending(path);
}

func ToString(_ data: Any) -> String{
    return String(describing: data);
}

func URLENCODE(_ str: String) -> String{
    return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? str;
}

func URLDECODE(_ str: String) -> String{
    return str.removingPercentEncoding ?? str;
}

func MAX<T>(_ x: T, _ y: T) -> T where T : Comparable {
    return x > y ? x : y
}

func MIN<T>(_ x: T, _ y: T) -> T where T : Comparable {
    return x < y ? x : y
}

func ABS<T>(_ x: T) -> T where T : Comparable, T : SignedNumeric {
    return x < 0 ? -x : x
}

/// Network constants
struct Network {
    static let googleAPIKey = "AIzaSyAXOEJRc7Q8tSUohz_sRRqrBnkryZDOOCs"
}

struct UserDefaultsKey {
    static let pushToken = "pushToken"
    static let voIPPushToken = "voIPPushToken"

}

enum FontType:Int {
    case Regular = 0
    case Bold = 1
    case Medium = 2
}


/// Constants
struct Constants {
  static let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
  static let toolbarHeight: CGFloat = 44.0
  static let pickerViewHeight: CGFloat = 216.0
  static let maxSizeForImageUploading = 500000
  static let messageTabIndex: Int = 3
  static let packageTabIndex: Int = 1

  static let refreshTimeInterval: Double = 15

  static let NAVIGATION_BAR_HEIGHT: CGFloat = 64.0
  static let SCALE_VALUE_HEIGHT_DEVICE: CGFloat = ScreenSize.SCREEN_HEIGHT/768.0
  static let SCALE_VALUE_WIDTH_DEVICE: CGFloat  = ScreenSize.SCREEN_WIDTH/1024
  
  static let FONT_SCALE_VALUE: CGFloat       = ScreenSize.SCREEN_HEIGHT/768.0
  
  static let RATIO_WIDTH               = ScreenSize.SCREEN_WIDTH/1024
  static let RATIO_HEIGHT              = ScreenSize.SCREEN_HEIGHT/768.0
  
  static let REQUEST_LOCATION_INTERVAL: Double = 60.0
    
  static let ROUTE_WIDTH: CGFloat              = 4.8
    
  static let defaultLocation  = CLLocation(latitude: 49.251664, longitude: -123.114979)
}

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
        isSim = true
        #endif
        return isSim
    }()
}

enum ModeScreen: Int {
    case modeNew = 0;
    case modeEdit = 1;
    case modeView = 2;
}

enum ModeBottomBar: Int {
    case modeList = 0
    case modeMain
    case modeGuess
}

enum EventModeView: Int {
    case modeCalendar = 0
    case modeGeneral
    case modeList
}

enum AnnouncementModeView: Int {
    case modeCalendar = 0
    case modeGeneral
    case modeList
}

//MARK: - SERVER_URL
struct SERVER_URL {
    
    static var API: String{
        get{
            return "SDBuildConf.serverUrlString()"
        }
    }
    
    static var API_FILE:String  {
        get{
            return "SDBuildConf.serverFileUrlString()"
        }
    }
}


// Window size
struct ScreenSize {
  static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
  static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
  static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
  static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

// Device type
struct DeviceType {
  static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
  static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
  static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
  static let IS_IPHONE_6_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH <= 667.0
  static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
  static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
  static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedDescending
}



struct USER_DEFAULT_KEY {
    static let HF_TOKEN_USER = "HF_TOKEN_USER"
    static let HF_FCM_TOKEN = "HF_FCM_TOKEN"
    static let HF_DEVICE_TOKEN = "HF_DEVICE_TOKEN"
    static let HF_REMEBER = "HF_REMEBER"
    static let HF_USER = "HF_USER"
    static let HF_CURRENT_SHIFT = "HF_CURRENT_SHIFT"
    static let HF_USER_PASS = "HF_USER_PASS"
    static let HF_TENANTS = "HF_TENANTS"
    static let HF_NOTI_AGAINT = "NotifyAgain"
    static let HF_ALLOW_TRACKING_LOCATION = "HF_ALLOW_TRACKING_LOCATION"
    static let LAST_UPDATE_LOCATION = "LAST_UPDATE_LOCATION"

}


struct NotificationName {
    static let shouldUpdateMessageNumbers = "shouldUpdateMessageNumbers"
}

extension NSNotification.Name {
    static let shouldReloadListShift = Notification.Name("shouldReloadListShift")
    static let createStopSuccessfully = Notification.Name("createStopSuccessfully")
    static let updateStopSuccessfully = Notification.Name("updateStopSuccessfully")


}



struct SegueIdentifier {
  static let showHome = "showHomeSegue"
  static let showOrderDetail = "orderDetailSegue"
  static let showMapView = "showMapView"
  static let showReasonList = "showReasonList"
  static let showScanBarCode = "showScanBarCode"
}

public enum SBName : String {
    case Main = "Main";
    case Profile = "Profile";
    case Login = "Login";
    case Route = "Route";
    case Map = "Map";
    case Commons = "Commons";

};


typealias ResponseDictionary = [String: Any]
typealias ResponseArray = [Any]


