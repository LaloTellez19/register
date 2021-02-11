//
//  RegisterRouter.swift
//  register_Framework
//
//  Created by Miguel Eduardo  Valdez Tellez  on 09/02/21.
//

import Foundation
import Alamofire

struct ClergyResponse: Codable {
    var id: Int
    var name: String
    var description: String
}

struct ActivitiesResponse: Codable
{
    var id: Int
    var name: String
    var description: String
}

struct RegisterPriestRequest: Codable {
    var userId: Int
    var name: String
    var fatherSurname: String
    var motherSurname: String
    var description: String
    var birthDate: String
    var ordinationDate: String
    var email: String
    var clergy: String
    var activity: Array<Int>
    var channelStream: String
}

struct RegisterPriestResponse: Codable {
    var status: String
}

enum RegisterRouter: BaseRouter {

    case activities
    case clergy
    case register(request: RegisterPriestRequest)
    
    var method: HTTPMethod {
        switch self {
        case .activities:
            return .get
        case .clergy:
            return .get
        case .register:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .activities:
            return API.URLProvider.appointmentsCatalog()
        case .clergy:
            return API.URLProvider.clergyCatalog()
        case .register:
            return API.URLProvider.registerPost()
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
        case .activities:
            return nil
        case .clergy:
            return nil
        case .register(let request):
            return request
        }
        
    }
    
}


