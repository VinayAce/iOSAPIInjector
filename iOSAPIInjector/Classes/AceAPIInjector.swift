//
//  AceAPIInjector.swift
//  iOSAPIInjector
//
//  Created by Apple on 08/09/20.
//

import UIKit

public class AceAPIInjector {
    
    static var  instance : AceAPIInjector? = nil
    
    public static func getInstance() -> AceAPIInjector{
        if instance == nil {
            instance = AceAPIInjector()
        }
        return instance!
    }
    
    public func postValues(url:String,postdata: [AnyHashable: Any],callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)){
        var request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        let postData = try! JSONSerialization.data(withJSONObject: postdata, options: .prettyPrinted)
        request.httpBody = postData
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
        }
        dataTask.resume()
    }
    
    public func getValues(url:String,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)){
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
            print(error ?? "no error")
            
        }
        dataTask.resume()
    }
}

public func parseJson(_ data:Data)->[String:Any]{
    if let data =  try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
        return data ?? ["":(Any).self]
    }else{
        print(data.base64EncodedString())
        print(String(bytes: data, encoding: .utf8) ?? "empty")
        return [:]
    }
}
