//
//  ChatViewController.swift
//  ParseLab
//
//  Created by Phan, Ngan on 9/27/17.
//  Copyright © 2017 Phan, Ngan. All rights reserved.
//

import UIKit
import Parse
import ParseLiveQuery

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var client: ParseLiveQuery.Client!
    var subscription: Subscription<Message>!

    var messages: [Message] = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        var messageQuery: PFQuery<Message> {
            return (Message.query()!
                .whereKeyExists("text")
            .order(byAscending: "createdAt")) as! PFQuery<Message>
        }
        client = ParseLiveQuery.Client()
        subscription = client.subscribe(messageQuery)
            .handle(Event.created) { (_, message) in
                self.messages.append(message)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
    }

    @IBAction func onSend(_ sender: Any) {
        let message = Message()
        message.text = chatTextField.text
        message.saveInBackground { (success, error) in
            if success {
                print("message saved")
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as? MessageCell {
            cell.message = messages[indexPath.row]
            return cell
        }
        return UITableViewCell()
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
