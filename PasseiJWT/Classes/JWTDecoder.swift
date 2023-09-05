//
//  JWTDecoder.swift
//  
//
//  Created by Vagner Oliveira on 10/06/23.
//

import Foundation
import PasseiLogManager

/// Decodifica o token de acesso
 
public class JWTDecoder {
    
    private let jwt:String
    
    public init(withJwt jwt:String) {
        self.jwt = jwt
    }
     
    /// Retorna o payload decodificado
    public func decode<T:Decodable>(ofType:T.Type) throws -> T {
    
        let parts = self.jwt.components(separatedBy: ".")
        
        if parts.count != 3 {
            LogManager.dispachLog("Erro ao tentar decodificar o json em 3 partes")
           throw JWTError.partsError("Erro ao tentar decodificar o json em 3 partes")
        }
        
        let _ = parts[0] // header
        let payload = parts[1]
        let _ = parts[2] //signature
        
        // Erro ao tentar decodificar
         var dictionary = try? decodeJWTPart(payload: payload)
        
        if dictionary == nil {
            dictionary = try decodeJWTPart2(payload: payload)
        }
        
        
        guard let dictionary = dictionary else {
            LogManager.dispachLog("Erro ao tentar converte o dicionario em modelo")
            throw JWTError.notConvertData("Erro ao tentar converte o dicionario em modelo")
        }
        
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary)
    
        
        guard let payloadClass = try? JSONDecoder().decode(ofType, from: jsonData) else {
            LogManager.dispachLog("Erro ao tentar converte o dicionario em modelo")
            throw JWTError.notConvertData("Erro ao tentar converte o dicionario em modelo")
        }
        return payloadClass   
    }
    
    private func base64StringWithPadding(encodedString:String) -> String {
        var stringToEncode = encodedString.replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "_", with: "/")
  
        let paddingCount = encodedString.count % 4
        
        for _ in 0..<paddingCount {
            stringToEncode += "+"
        }
      
        return stringToEncode
    }
    
    private func decodeJWTPart(payload: String) throws -> [String: Any]? {
        // Remover espaços em branco no final da string
        let trimmedPayload = payload.trimmingCharacters(in: .whitespacesAndNewlines)

        guard let payloadData = Data(base64Encoded: trimmedPayload) else {
            LogManager.dispachLog("Erro ao tentar converter para data")
            throw JWTError.notConvertData("Erro ao tentar converter para data")
        }

        guard let payloadDictionary = try JSONSerialization.jsonObject(with: payloadData, options: []) as? [String: Any] else {
            LogManager.dispachLog("Erro ao tentar converter para dicionário")
            throw JWTError.notConvertData("Erro ao tentar converter para dicionário")
        }

        return payloadDictionary
    }
    
    private func decodeJWTPart2(payload: String) throws -> [String: Any]? {
        // Remover espaços em branco no final da string
        let trimmedPayload = payload.trimmingCharacters(in: .whitespacesAndNewlines)

        // Calcular a quantidade de caracteres de preenchimento necessários para que a string base64 tenha um tamanho múltiplo de 4
        let paddingLength = 4 - (trimmedPayload.count % 4) % 4

        // Criar uma string com o payload e adicionar os sinais de igual necessários ao final
        let payloadPaddingString = trimmedPayload + String(repeating: "=", count: paddingLength)

        guard let payloadData = Data(base64Encoded: payloadPaddingString) else {
            LogManager.dispachLog("Erro ao tentar converter para data")
            throw JWTError.notConvertData("Erro ao tentar converter para data")
        }

        guard let payloadDictionary = try JSONSerialization.jsonObject(with: payloadData, options: []) as? [String: Any] else {
            LogManager.dispachLog("Erro ao tentar converter para dicionário")
            throw JWTError.notConvertData("Erro ao tentar converter para dicionário")
        }

        return payloadDictionary
    }
    
}

