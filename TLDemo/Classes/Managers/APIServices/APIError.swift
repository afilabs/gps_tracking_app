
import Foundation

struct APIError {
    enum ErrorType: Int {
        case invalidAuthen = 401
        case reservationFuture = 2405
        case reservationInvalid = 2404
        case reservationExpired = 2503
        case formUnverified = 2422
        case guestInfoNotFound = 5404
        case placeNotFound = 6404
        case placeAlreadyUsed = 6423
        case placeAssignTwice = 6424
        case cantLinkDevice = 6422
        case urlNotFound = 404
        case unknown = 9999
        case cantGetData = 8888
        case lostConnection = 6
    }
    
    static func defineError(errorType: ErrorType) -> NSError {
        switch errorType {
        case .invalidAuthen:
            return NSError(domain: "The device hasn't assigned to any user. Please contact admin for more information",
                           code: errorType.rawValue,
                           userInfo: nil)

        case .reservationInvalid:
            return NSError(domain: "error.invalidReservationCode",
                           code: errorType.rawValue,
                           userInfo: nil)
        case .reservationFuture:
            return NSError(domain: "error.reservationCodeFuture",
                           code: errorType.rawValue,
                           userInfo: nil)
        case .reservationExpired:
            return NSError(domain: "error.expiredReservation",
                           code: errorType.rawValue,
                           userInfo: nil)
        case .formUnverified:
            return NSError(domain: "error.formUnverified",
                           code: errorType.rawValue,
                           userInfo: nil)
        case .urlNotFound:
            return NSError(domain: "error.urlNotFound",
                           code: errorType.rawValue,
                           userInfo: nil)
        case .cantGetData:
            return NSError(domain: "error.cantGetData",
                           code: errorType.rawValue,
                           userInfo: nil)
        case .lostConnection:
            return NSError(domain: "error.lostConnection",
                           code: errorType.rawValue,
                           userInfo: nil)
        default:
            return NSError(domain: "error.unknown",
                           code: errorType.rawValue,
                           userInfo: nil)
        }

    }
}
