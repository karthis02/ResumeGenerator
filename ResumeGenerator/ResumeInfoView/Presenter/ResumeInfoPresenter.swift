//
//  ResumeInfoPresenter.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class ResumeInfoPresenter: NSObject {
    var view: ResumeInfoViewController?
    var routerDelegate: ResumeInfoRouterProtocol?
    var interactorDelegate: ResumeInfoInteractorProtocol?
}


extension ResumeInfoPresenter: ResumeInfoPresenterProtocol {
    func loadViewWithData(info: ResumeInfo?) {
        DispatchQueue.main.async {
            //self.view?.loadViewWithSavedorFetchedData(info: info)
        }
        
    }
    
    func saveData(info: ResumeInfo) {
        interactorDelegate?.saveData(info: info)
    }
    
    func navigateToPersonal() {
        if let resumeInfoModel = interactorDelegate?.getDataFromLocalData() {
            routerDelegate?.pushToPreviewPdfView(resumeInfoModel: resumeInfoModel)
        }
    }
    
    func getModelClass()  {
        interactorDelegate?.getModelClass()
    }
    
    
}

