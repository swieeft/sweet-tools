//
//  KeychainController.swift
//  sweet-tools
//
//  Created by 박길남 on 2018. 7. 17..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import Security

// Keychain 관련 쿼리 키 값들
let kSecClassValue                  = NSString(format: kSecClass)
let kSecAttrAccountValue            = NSString(format: kSecAttrAccount)
let kSecValueDataValue              = NSString(format: kSecValueData)
let kSecAttrGenericValue            = NSString(format: kSecAttrGeneric)
let kSecAttrServiceValue            = NSString(format: kSecAttrService)
let kSecAttrAccessValue             = NSString(format: kSecAttrAccessible)
let kSecMatchLimitValue             = NSString(format: kSecMatchLimit)
let kSecReturnDataValue             = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue          = NSString(format: kSecMatchLimitOne)
let kSecAttrAccessGroupValue        = NSString(format: kSecAttrAccessGroup)
let kSecClassGenericPasswordValue   = NSString(format: kSecClassGenericPassword)

class KeychainController : NSObject {
    
    public class func saveToken(serviceIdentifier:NSString, userAccount:NSString, token: NSString) {
        self.save(service: serviceIdentifier, userAccount: userAccount, data: token)
    }
    
    public class func loadToken(serviceIdentifier:NSString, userAccount:NSString) -> NSString? {
        let token = self.load(service: serviceIdentifier, userAccount: userAccount)
        
        return token
    }
    
    private class func save(service: NSString, userAccount:NSString, data: NSString) {
        let dataFromString: NSData = data.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false)! as NSData
        
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, userAccount, dataFromString], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecValueDataValue])
        
        // Delete any existing items
        SecItemDelete(keychainQuery as CFDictionary)
        
        // Add the new keychain item
        let _: OSStatus = SecItemAdd(keychainQuery as CFDictionary, nil)
    }
    
    private class func load(service: NSString, userAccount:NSString) -> NSString? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, userAccount, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
        
        var retrievedData: NSData?
        var dataTypeRef:AnyObject?
        var contentsOfKeychain: NSString?
        
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        
        if (status == errSecSuccess) {
            retrievedData = dataTypeRef as? NSData
            contentsOfKeychain = NSString(data: retrievedData! as Data, encoding: String.Encoding.utf8.rawValue)
        }
        else
        {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }
}
