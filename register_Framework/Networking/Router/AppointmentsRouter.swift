//
//  RegisterRouter.swift
//  register_Framework
//
//  Created by Miguel Eduardo  Valdez Tellez  on 09/02/21.
//

import Foundation
import Alamofire

struct AppointmentsRequest: Codable
{
    var id: String
    var tag: String
    var description: String
}

enum AppointmentsRouter: BaseRouter {

    case appointments(request: AppointmentsRequest)
    
    var method: HTTPMethod {
        switch self {
        case .appointments:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .appointments:
            return API.URLProvider.appointmentsCatalog()
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
        case .appointments(let request):
            return request
        }
    }
    
}
