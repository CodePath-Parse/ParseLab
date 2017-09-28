//
//  ChatViewController.swift
//  ParseLab
//
//  Created by Phan, Ngan on 9/27/17.
//  Copyright © 2017 Phan, Ngan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSend(_ sender: Any) {
        let message = Message()
        message.text = chatTextField.text
        message.saveInBackground { (success, error) in
            if success {
                print("message saved")
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
