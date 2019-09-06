//
//  ViewController.swift
//  News & Currency Converter
//
//  Created by cysparrow on 8/3/19.
//  Copyright © 2019 SweetestProductionsLLC. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UIPickerViewDelegate,
    UIPickerViewDataSource, UITextFieldDelegate
{
    
    //UITextDisplay.. to show our data of text News..
    @IBOutlet weak var UITextDisplay: UITextView!
    
    //UITextField for placing your USD currency

    @IBOutlet weak var USDCurrency: UITextField!
    
    //Testing UITextField..
    @IBOutlet weak var textBox1: UITextField!
    //Testing UITextField2
    @IBOutlet weak var textBox2: UITextField!
    
    //Testing UIPickers 1,2
    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    
    //fake data..
    //var age = ["20-30", "50-60", "70-100"]
    var genderType = ["male", "female", "hybrid"]
    
    //Testing with real data..
    //var rateKey: [String] = []
    //var rateData: [Double] = []
    
    var age = []
    
    
    
    
    //Testing purposes
    //var currencyData: [ratesValues] = []
    
    //Testing purposes 2
    var curentRatesRates: [Double] = []
    var currentNameName: [String] = []
    
    
    //For Finanaces API
    var financeCurrentData: [String] = []
    
    //Caller when it needs the number of components..
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    //When the user press the button..
    @IBAction func emailButton(_ sender: Any)
    {
        //This needs to be ran on device, custom function below..
        
    }
    
    func showMailComposer()
    {
        //If the current device can send email, will return true
        //Call this method before trying to display the mail composition..
        guard MFMailComposeViewController.canSendMail() else
        {
            //Show alert informing the user..
            
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        
        //Composing email to the one you actually want.
        composer.setCcRecipients(["chris.amaury@hotmail.com"])
        composer.setSubject("Help me out")
        composer.setMessageBody("I love your app, but it would be nice if..", isHTML: false)
        
        present(composer, animated: true)
    }
    
    
    
    
    //How many rows we would like..
    //It should be equal to the amount of data..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        var countRows: Int = age.count
        if pickerView == pickerView2
        {
            countRows = self.genderType.count
        }
        
        return countRows
    }
    
   //Title for a give row in a component..
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == pickerView1
        {
            let titleRow = age[row]
            return titleRow
        }
        else if pickerView == pickerView2
        {
            let titleRow = genderType[row]
            return titleRow
        }
        
        return " "
    }
    
    //when the select a row..
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == pickerView1
        {
            self.textBox1.text = self.age[row]
            //Hidden picker view
            self.pickerView1.isHidden = true
        }
        else if pickerView == pickerView2
        {
            self.textBox2.text = self.genderType[row]
            self.pickerView2.isHidden = true
        }
    }
    
    //Editing begam in the specified text field..
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if(textField == textBox1)
        {
            self.pickerView1.isHidden = false
        }
        else if textField == textBox2
        {
            self.pickerView2.isHidden = false
        }
    }
    //UIButton.. for refreshing the data
    @IBAction func RefreshButton(_ sender: Any)
    {
        //Refreshing the data finance.. 
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //API website..
        let jsonURL = "https://openexchangerates.org/api/latest.json?app_id=1da31d0edcff44dcb1426311c447f304"
        let jsonNewsURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f920f2a47077445184807d23ccba2a52"
        
        
        //We gotta guard it in order to use it on the URLsession.. if it doesn't work,
        guard let url = URL(string: jsonURL) else {return}
        URLSession.shared.dataTask(with: url)
        {
            //We get back the data object from the website..
            (data, response, err) in
            
            //perphas check error
            //Also check response, status 200 ok
            guard let data = data else {return}
            
            //do-try..
            do
            {
                //It can potentially throw an error, so try
                //let currencyInfo = try JSONDecoder().decode(jsonObject.self, from: data)
                
                //Testing
                let currencyInfo = try JSONDecoder().decode(jsonObject.self, from: data)
                
                //print(currencyInfo.base)
                
                if let rates = currencyInfo.rates as? NSDictionary
                {
                    for(key, values) in rates
                    {
                        self.currentNameName.append((key as? String)!)
                        self.curentRatesRates.append((values as? Double)!)
                    }
                    
                   //print(self.currentNameName, self.curentRatesRates)
                }
            }
            catch let jsonError
            {
                print ("Error serialliazition", jsonError)
            }
        }
        //To fire it off..
        .resume()
        
        //Guarding new URLSession..
        guard let urlFinance = URL(string: jsonNewsURL) else {return}
        URLSession.shared.dataTask(with: urlFinance)
        {
            //We get back the data object from the website
            (data, response, err) in
            
            //perhaps check for error that might coming in..
            guard let data = data else {return}
            
            //do-try to catch any error that might come up..
            do
            {
                let financesNewsData = try JSONDecoder().decode(NewsApiObject.self, from: data)
                
                //print data..
                print([financesNewsData.status])
            }
            catch let financeThrowError
            {
                print("Didn't pull up", financeThrowError)
            }
        }
        .resume()
    
    }
}

//To conform to the MFMailComposerViewControllerDelegate
extension ViewController: MFMailComposeViewControllerDelegate
{
    //When the email has been actually sent out..
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        if let _ = error
        {
            //Show error alert..
            controller.dismiss(animated: true)
        }
        
        switch result
        {
        case.cancelled:
            print("It has been cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("It has been sent")
        case .sent:
            print("Sent out")
            
        }
        //Dismmissing view Controller..
        controller.dismiss(animated: true)
    }
}

