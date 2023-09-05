//
//  JWTError.swift
//  
//
//  Created by Vagner Oliveira on 10/06/23.
//

enum JWTError:Error {
    case partsError(String)
    case notConvertData(String)
}
