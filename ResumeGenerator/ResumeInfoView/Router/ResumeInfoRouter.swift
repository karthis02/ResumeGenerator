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
 
    
        // Push to Preview
    func pushToPreviewPdfView(resumeInfoModel:ResumeInfo) {
        //let previewViewController = PreviewViewController()
        //previewViewController.invoiceInfo = personalModel
        //view?.navigationController?.pushViewController(previewViewController, animated: true)
    }
        
        
}
