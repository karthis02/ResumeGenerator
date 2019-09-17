//
//  ResumeInfoProtocols.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 17/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import Foundation
import UIKit

protocol ResumeInfoViewProtocol {
    func loadViewWithSavedorFetchedData(info: ResumeInfo?)
}

protocol ResumeInfoPresenterProtocol {
    func navigateToPersonal()
    func getModelClass()
    func saveData(info:ResumeInfo)
    func loadViewWithData(info:ResumeInfo?)
}

protocol ResumeInfoInteractorProtocol {
    func saveData(info: ResumeInfo)
    func getModelClass()
    func getDataFromLocalData() -> ResumeInfo?
}

protocol ResumeInfoRouterProtocol {
    func pushToPreviewPdfView(resumeInfoModel:ResumeInfo)
}




