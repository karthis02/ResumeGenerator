//
//  HomeRouter.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class HomeRouter: NSObject {
    var view: HomeViewController? = nil
    init(view:HomeViewController) {
        self.view = view
    }
}

extension HomeRouter:HomeRouterProtocol {
    func pushToResumeInfo() {
        let resumeInfoViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResumeVC") as? ResumeInfoViewController
        let presenter = ResumeInfoPresenter()
        let interactor = ResumeInfoInteractor()
        let router = ResumeInfoRouter(view: resumeInfoViewController!)
        interactor.presenterDelegate = presenter
        presenter.interactorDelegate = interactor
        presenter.view = resumeInfoViewController
        presenter.routerDelegate = router
        resumeInfoViewController!.presenterDelegate = presenter
        self.view?.navigationController?.pushViewController(resumeInfoViewController!, animated: true)
    }
}
