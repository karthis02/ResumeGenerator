//
//  HomePresenter.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {
     var routerDelegate: HomeRouterProtocol?
}
extension HomePresenter: HomePresenterProtocol {
    func navigateToResumeInfo() {
        routerDelegate?.pushToResumeInfo()
    }
    
    
}
