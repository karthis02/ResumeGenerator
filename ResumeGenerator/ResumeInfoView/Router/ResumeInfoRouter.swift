//
//  ResumeInfoRouter.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class ResumeInfoRouter: NSObject {
    let view:ResumeInfoViewController?
    init(view:ResumeInfoViewController ) {
        self.view = view
    }
    
}
extension ResumeInfoRouter: ResumeInfoRouterProtocol {

    func pushToPreviewPdfView(resumeInfoModel:ResumeInfo) {
        let pdfViewController = PDFViewController()
        pdfViewController.resumeInfo = resumeInfoModel
        view?.navigationController?.pushViewController(pdfViewController, animated: true)
    }
        
        
}
