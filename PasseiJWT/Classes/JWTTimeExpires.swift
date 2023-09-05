//
//  JWTTimeExpires.swift
//  
//
//  Created by Vagner Oliveira on 10/06/23.
//

import Foundation

/// Classe para tratar o token
public class JWTTimeExpires {
    @JWTCheck
    public var isExpired: Bool
    
    public init(timestamp: TimeInterval) {
        self.isExpired = JWTCheck(timestamp: timestamp).wrappedValue
    }
}
