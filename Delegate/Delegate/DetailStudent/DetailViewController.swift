//
//  DetailViewController.swift
//  Delegate
//
//  Created by Dong Duong V. on 08/04/2022.
//

import UIKit
protocol DetailDelegate: class {
    func update(student:Student)
}
class DetailViewController: UIViewController {
    var student :Student = Student(id: 0, name: "")
    weak var delegate: DetailDelegate?
    
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = student.name
        
        // Do any additional setup after loading the view.
    }


    @IBAction func tapButton(_ sender: Any)
    {
        print("tap in save!")
        student.name = nameText.text ?? ""
        delegate?.update(student: student)
        navigationController?.popViewController(animated: true)
    }
}
