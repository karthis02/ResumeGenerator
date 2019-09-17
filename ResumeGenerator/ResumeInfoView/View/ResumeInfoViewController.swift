//
//  ResumeInfoViewController.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class ResumeInfoViewController: UIViewController {

    
    @IBOutlet weak var tableView : UITableView?
    
    var presenterDelegate:ResumeInfoPresenter?
    let resumeFieldPlaceholderTextArray = Constant().kPlaceHolderArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constant().kPersonalInformation
        self.setUpNavigationBarItem()
        self.tableView?.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
      
    }
    
    @objc fileprivate func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: Notification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            self.tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    // MARK: - Set Up Navigationbaritem
    private func setUpNavigationBarItem() {
        let previewBarButtonItem = UIBarButtonItem.init(title: Constant().kPreview, style: .done, target: self, action: #selector(previewBarButtonAction))
        self.navigationItem.rightBarButtonItem = previewBarButtonItem
        
    }
    
    // MARK: - Save personal data locally.
    @objc func previewBarButtonAction() {
        //presenterDelegate?.saveData(info: createPeronalInfoModel())
        //presenterDelegate?.navigateToPersonal()
    }
    

}
extension ResumeInfoViewController :UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resumeFieldPlaceholderTextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: "ResumeInfoCell", for: indexPath)
            as! ResumeDetailTableViewCell
        cell.detailTextField.placeholder = "\(self.resumeFieldPlaceholderTextArray[indexPath.row])"
        return cell
    }
    
    
}

extension ResumeInfoViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
