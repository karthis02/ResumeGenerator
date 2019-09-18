//
//  ResumeInfoInteractor.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class ResumeInfoInteractor: NSObject {
    var presenterDelegate:ResumeInfoPresenterProtocol?
    let url = Constant().kURL
    
    //MARK: - Create Profile json file and save
    func saveUploadedFilesSet(fileName:ResumeInfo) {
        do {
            let jsonData = try JSONEncoder().encode(fileName)
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            print(jsonString)
            if let path = Bundle.main.path(forResource: "Resume", ofType: ".json") {
                // and decode it back
                let pathAsURL = URL(fileURLWithPath: path)
                do {
                    try jsonString.write(to: pathAsURL, atomically: true, encoding: .utf8)
                }
                
            }
            
        } catch {
            print(error)
            
        }
    }
    
    //MARK: - Get Data From Local Json
    func getDataFromLocalJson() -> ResumeInfo? {
        
        if let path = Bundle.main.path(forResource: "Resume", ofType: ".json") {
            // and decode it back
            let pathAsURL = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: pathAsURL, options: .alwaysMapped)
                let resumeInfoModel = try JSONDecoder().decode(ResumeInfo.self, from: data)
                return resumeInfoModel
            }catch {
                print(error)
            }
        }
        return nil
    }
}
extension ResumeInfoInteractor: ResumeInfoInteractorProtocol {
    func saveData(info: ResumeInfo) {
        saveUploadedFilesSet(fileName: info)
    }
    
    func getDataFromLocalData() -> ResumeInfo? {
        return getDataFromLocalJson()
    }
    
    func getSavedData()  {
     
        //Fetch from server
        let serviceHandler = ServiceHandler()
        guard let url = URL.init(string: url) else { return }
        serviceHandler.getResumeInfoFromServer(url: url, completion:({[weak self](data:ResumeInfo?, error:Error?) in
            if let personaInfo = data {
                self?.presenterDelegate?.loadViewWithData(info: personaInfo)
            }else {
                //No data saved in server
                if let _ = error{
                    print("Error while Fetching - Initial Load")
                    self?.presenterDelegate?.loadViewWithData(info: self?.getDataFromLocalData())
                }
            }}))
    }
    
    
}
