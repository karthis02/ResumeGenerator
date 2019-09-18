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
    var resumeInfoModel = ResumeInfo()

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
    
    // MARK: - Save Resume data locally.
    @objc func previewBarButtonAction() {
        presenterDelegate?.saveData(info: resumeInfoModel)
        presenterDelegate?.navigateToResumeInfo()
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
        cell.detailTextField.tag = indexPath.row
        return cell
    }
    
    
}

extension ResumeInfoViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        
        let kActualText = (textField.text ?? "") + string
        switch textField.tag
        {
        case 0:
            resumeInfoModel.firstName = kActualText;
        case 1:
            resumeInfoModel.lastName = kActualText;
        case 2:
            resumeInfoModel.emailId = kActualText;
        case 3:
            resumeInfoModel.mobileNumber = kActualText;
        case 4:
            resumeInfoModel.addressLine1 = kActualText;
        case 5:
            resumeInfoModel.addressLine2 = kActualText;
        case 6:
            resumeInfoModel.dob = kActualText;
        case 7:
            resumeInfoModel.currentCompany = kActualText;
        case 8:
            resumeInfoModel.yearOfExp = kActualText;
        case 9:
            resumeInfoModel.skillSet = kActualText;
        case 10:
            resumeInfoModel.primaryEducationMarks = kActualText;
        case 11:
            resumeInfoModel.secondaryEducationMarks = kActualText;
        case 12:
            resumeInfoModel.higherEducationMarks = kActualText;
        default:
            print("It is nothing");
        }
        return true;
    }
}
