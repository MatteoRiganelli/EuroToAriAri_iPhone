//
//  ViewController.swift
//  AriEuroConverter
//
//  Created by Matteo Riganelli on 02/07/2018.
//  Copyright © 2018 Matteo Riganelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        insertedLabel.adjustsFontSizeToFitWidth = true;
        resultLabel.adjustsFontSizeToFitWidth = true;
        UINavigationItem.title = "Euro → AriAri";
       
    }
    
    var ariAriValuta = 3806.0;
    var convertEuro = true;
    var insertedDot = false;
    var converted = false;
    
    @IBOutlet weak var insertedLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var insertedCurrencyLabel: UILabel!;
    @IBOutlet weak var resultCurrencyLabel: UILabel!;
    
    @IBOutlet weak var UINavigationItem: UINavigationItem!;
    
    @IBOutlet weak var segmentControl: UISegmentedControl!;
    
    @IBAction func numbers(_ sender: UIButton) {
        if(converted == true)
        {
            converted = false;
            insertedLabel.text = "";
            resultLabel.text = "";
        }
        
        if(sender.tag == 10 && insertedDot == false)
        {
            insertedDot = true;
            print("Dot inserted");
            insertedLabel.text = insertedLabel.text! + "." ;
        }
        else{
            insertedLabel.text = insertedLabel.text! + String(sender.tag) ;
        }
    }
    
    @IBAction func DeleteAll(_ sender: Any) {
        print("reset ALL");
        resultLabel.text = "0";
        insertedLabel.text = "0";
        converted = true;
    }
    
    @IBAction func changeConvertion(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            //NSLog("Popular selected")
            convertEuro = true;
            print(convertEuro);
            insertedCurrencyLabel.text = "EUR";
            resultCurrencyLabel.text = "MGA";
            UINavigationItem.title = "Euro → AriAri";
        //show popular view
        case 1:
            //NSLog("History selected")
        //show history view
            convertEuro = false;
            print(convertEuro);
            insertedCurrencyLabel.text = "MGA";
            resultCurrencyLabel.text = "EUR";
            UINavigationItem.title = "Euro ← AriAri";
        default:
            break;
        }
       
    }
    
    @IBAction func convertValueButton(_ sender: Any) {
        converted = true;
        if(convertEuro){
            print("converto EURO in ARI ARI");
            let convertValue = Double(insertedLabel.text!)! * ariAriValuta;
            resultLabel.text = String(convertValue);
        }
        else
        {
            print("converto ARI ARI in EURO");
            let convertValue = Double(insertedLabel.text!)! / ariAriValuta;
            resultLabel.text = String(convertValue);
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

