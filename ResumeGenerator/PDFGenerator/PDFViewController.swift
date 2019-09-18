//
//  PDFViewController.swift
//  ResumeGenerator
//
//  Created by Karthi Samigoundanpalayamshanmugam02 on 18/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {
    
    var pdfWebView = UIWebView()
    var resumeInfo: ResumeInfo?
    var pdfComposer: PDFComposer!
    var HTMLContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(pdfWebView)
        pdfWebView.scalesPageToFit = true
        pdfWebView.backgroundColor = .gray
        // Do any additional setup after loading the view.
        pdfWebView.translatesAutoresizingMaskIntoConstraints = false
        pdfWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pdfWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pdfWebView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        pdfWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createResumeHTML()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func exportToPDF() {
        pdfComposer.exportHTMLContentToPDF(HTMLContent: HTMLContent ?? "")
    }
    
    func createResumeHTML() {
        pdfComposer = PDFComposer()
        if let resumeInfoModel = resumeInfo {
            if let resumeHTML = pdfComposer.renderResume(resumeInfo: resumeInfoModel) {
                
                pdfWebView.loadHTMLString(resumeHTML, baseURL: NSURL(string:pdfComposer.pathToMainInfoHTMLTemplate ?? "") as URL?)
                HTMLContent = resumeHTML
            }
        }
        
    }

}
