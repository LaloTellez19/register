//
//  API.swift
//  register_Framework
//
//  Created by Miguel Eduardo  Valdez Tellez  on 09/02/21.
//

import Foundation

struct API {
    
    static private var version = ""
    
    struct URLProvider {
        #if PROD
        static let host = ""
        #elseif QA
        static let host = ""
        #else
        static let host = "https://encuentro-cdmx.getsandbox.com:443"
        #endif
        
        struct EndPoint {
            static let appointmentsCatalog = "/catalogs/appointments"
            static let clergy = "/catalogs/clergy"
        }
        
        static func appointmentsCatalog() -> String {
            return host + version + EndPoint.appointmentsCatalog
        }
        
        static func clergy() -> String {
            return host + version + EndPoint.clergy
        }
    }

}
