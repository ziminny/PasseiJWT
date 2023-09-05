//
//  JWTCheck.swift
//  
//
//  Created by Vagner Oliveira on 10/06/23.

import Foundation

@propertyWrapper
public class JWTCheck {
    private var value: Bool
    
    public var wrappedValue: Bool {
        get { value }
        set { value = newValue }
    }
    
    public init(wrappedValue: Bool) {
        self.value = wrappedValue
    }
    
    public init(timestamp: TimeInterval) {
        let currentDate = Date()
        let expirationDate = Date(timeIntervalSince1970: timestamp)
        self.value = currentDate > expirationDate
    }
}
