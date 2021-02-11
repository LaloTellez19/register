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
            static let clergyCatalog = "/catalogs/clergy"
            static let activitiesCatalog = "/catalogs/activities"
            static let registerPost = "/priests"
        }
        
        static func clergyCatalog() -> String {
            return host + version + EndPoint.clergyCatalog
        }
        
        static func appointmentsCatalog() -> String {
            return host + version + EndPoint.activitiesCatalog
        }
        
        static func registerPost() -> String {
            return host + version + EndPoint.registerPost
        }
        
    }

}
