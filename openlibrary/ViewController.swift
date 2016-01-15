//
//  ViewController.swift
//  openlibrary
//
//  Created by Daniel Rodríguez Pérez on 15/1/16.
//  Copyright © 2016 Daniel Rodríguez Pérez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textISBN: UITextField!
    @IBOutlet weak var textResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchISBN(sender: AnyObject) {
        
        self.resignFirstResponder()
        
        let urlISBN = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + self.textISBN.text!
        let url = NSURL(string: urlISBN)
        
        
        guard let datos:NSData? = NSData(contentsOfURL: url!) else {
            return
        }
        
        if datos == nil {
            self.textResult.text = ""
            
            let alertController = UIAlertController(title: "Error", message: "No se ha podido obtener los datos", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            self.textResult.text = texto as! String
        }
    }
    
    @IBAction func clearSearch(sender: AnyObject) {
        self.textISBN.text = ""
        self.textResult.text = ""
    }
}

