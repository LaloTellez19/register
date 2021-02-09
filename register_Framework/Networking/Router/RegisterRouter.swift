//
//  RegisterRouter.swift
//  register_Framework
//
//  Created by Miguel Eduardo  Valdez Tellez  on 09/02/21.
//

import Foundation
import Alamofire

struct AppointmentsResponse: Codable
{
    var id: Int
    var tag: String
    var description: String
}

struct ClergyResponse: Codable {
    var id: Int
    var tag: String
    var description: String
}

enum RegisterRouter: BaseRouter {

    case appointments
    case clergy
    
    var method: HTTPMethod {
        switch self {
        case .appointments:
            return .get
        case .clergy:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .appointments:
            return API.URLProvider.appointmentsCatalog()
        case .clergy:
            return API.URLProvider.clergyCatalog()
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var body: Any? {
        switch self {
        case .appointments:
            return nil
        case .clergy:
            return nil
        }
    }
    
}
