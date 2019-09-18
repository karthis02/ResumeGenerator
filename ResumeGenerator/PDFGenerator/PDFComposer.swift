//
//  PDFComposer.swift
//  ResumeGenerator
//
//  Created by Karthi Samigoundanpalayamshanmugam02 on 18/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

class PDFComposer: NSObject {
    
    let pathToMainInfoHTMLTemplate = Bundle.main.path(forResource: "MainInfo", ofType: "html")
    
    let pathToFirstLineHTMLTemplate = Bundle.main.path(forResource: "FirstLine", ofType: "html")
    
    let pathToFinalLineHTMLTemplate = Bundle.main.path(forResource: "FinalLine", ofType: "html")
   
    var pdfFilename: String?
    
    override init() {
        super.init()
    }
    
    func renderResume(resumeInfo:ResumeInfo) -> String? {

        do {
            // Load the Main Info HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToMainInfoHTMLTemplate ?? "" )
            
            // Resume name.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#RESUME_NAME#", with: resumeInfo.firstName + resumeInfo.lastName)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#CONTACT_NUMBER#", with: resumeInfo.mobileNumber)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#CURRENT_COMPANY#", with: resumeInfo.currentCompany)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#D_O_B#", with: resumeInfo.dob)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#Address_Line_1#", with: resumeInfo.addressLine1)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#Address_Line_2#", with: resumeInfo.addressLine2.replacingOccurrences(of: "\n", with: "<br>"))
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#EXP_SUMMARY#", with: "Total Experience:" + resumeInfo.yearOfExp + "years of experince in " + resumeInfo.skillSet + "development")
            
            // The items will be added by using a loop.
            var allItems = ""
            
            let items:[[String:String]] = [["value": resumeInfo.primaryEducationMarks, "item":"Primary Education"], ["value": resumeInfo.secondaryEducationMarks, "item":"Secondary Education"],["value": resumeInfo.higherEducationMarks, "item":"Higher Education"]]
            for i in 0..<items.count {
                var itemHTMLContent: String?
                
                // Determine the proper template file.
                if i != items.count - 1 {
                    itemHTMLContent = try String(contentsOfFile: pathToFirstLineHTMLTemplate ?? "" )
                }
                
                // Replace the description and price placeholders with the actual values.
                itemHTMLContent = itemHTMLContent?.replacingOccurrences(of: "#KEY#", with: items[i]["item"] ?? "")
                
                let firstLine = items[i]["value"]
                itemHTMLContent = itemHTMLContent?.replacingOccurrences(of: "#VALUE#", with: firstLine ?? "")
                
                // Add the item's HTML code to the general items string.
                allItems += itemHTMLContent ?? ""
            }
            
            // Set the items.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#INFO#", with: allItems)
            
            // The HTML code is ready.
            return HTMLContent
            
        }
        catch {
            print("Unable to open HTML files.")
        }
        
        return nil
    }
    
    
    func exportHTMLContentToPDF(HTMLContent: String) {
        let printPageRenderer = PDFPageRender()
        
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("ResumeGenerator.pdf")
        pdfFilename = "\(getDocDir)/Resume.pdf"
        pdfFilename = imagePath
        pdfData?.write(toFile: imagePath, atomically: true)
        
        print(pdfFilename ?? "")
    }
    
    func getDocDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        for i in 0..<printPageRenderer.numberOfPages {
            UIGraphicsBeginPDFPage()
            printPageRenderer.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        
        UIGraphicsEndPDFContext()
        
        return data
    }
    
}
