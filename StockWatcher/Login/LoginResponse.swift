//
//  LoginResponse.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/5/24.
//
struct LoginResponse: Decodable {
    let sessionExpiration: String
    let sessionToken: String
    let email: String
    let externalId: String
    let isConfirmed: Bool
    let username: String

    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum SessionCodingKeys: String, CodingKey {
        case user
        case sessionExpiration = "session-expiration"
        case sessionToken = "session-token"
    }
    
    enum UserCodingKeys : String, CodingKey {
        case email
        case externalId = "external-id"
        case isConfirmed = "is-confirmed"
        case username
    }
    
    init(from decoder: any Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sessionKeysContainer = try container.nestedContainer(keyedBy: SessionCodingKeys.self, forKey: .data)
        
        self.sessionExpiration = try sessionKeysContainer.decode(String.self, forKey: .sessionExpiration)
        self.sessionToken = try sessionKeysContainer.decode(String.self, forKey: .sessionToken)
        
        let userKeysContainer = try sessionKeysContainer.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        
        self.email = try userKeysContainer.decode(String.self, forKey: .email)
        self.externalId = try userKeysContainer.decode(String.self, forKey: .externalId)
        self.isConfirmed = try userKeysContainer.decode(Bool.self, forKey: .isConfirmed)
        self.username = try userKeysContainer.decode(String.self, forKey: .username)
    }
}
