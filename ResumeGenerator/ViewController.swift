//
//  ViewController.swift
//  ResumeGenerator
//
//  Created by Karthi Samigoundanpalayamshanmugam02 on 11/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var createNewResumeButton: UIButton!
    @IBOutlet weak var editSavedResumeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = Constant().kHomeViewTitle
    }


    @IBAction func createNewResumeButtonAction(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "LocalData")
        self.pushToHomeView()
    }
    
    @IBAction func editSavedResumeButtonAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "LocalData")
        self.pushToHomeView()
    }
    
    private func pushToHomeView(){
        let homeViewController =  UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
        let presenter = HomePresenter()
        let router = HomeRouter(view:homeViewController!)
        presenter.routerDelegate = router
        homeViewController!.presenterDelegate = presenter
        self.navigationController?.pushViewController(homeViewController!, animated:true)
    }
}

