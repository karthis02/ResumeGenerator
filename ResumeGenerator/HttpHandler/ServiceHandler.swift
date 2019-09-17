//
//  ServiceHandler.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import Foundation

class ServiceHandler: NSObject, URLSessionDelegate {
    
    func getResumeInfoFromServer(url: URL, completion: @escaping (ResumeInfo?, Error?) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print(error ?? "Request Error")
                completion(nil,error)
                return
            }
            
            guard let responseData = data else {
                completion(nil,error)
                return
            }
            do {
                let resumeInfoModel = try JSONDecoder().decode(ResumeInfo.self, from: responseData)
                print(resumeInfoModel)
                completion(resumeInfoModel, nil)
            } catch {
                completion(nil,error)
            }
            
        }
        task.resume()
    }
}

