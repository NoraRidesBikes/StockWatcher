//
//  LoginRequest.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/5/24.
//
struct LoginRequest: Encodable {
    let username: String
    let password: String

    enum CodingKeys : String, CodingKey {
       case username = "login"
       case password
    }
}
