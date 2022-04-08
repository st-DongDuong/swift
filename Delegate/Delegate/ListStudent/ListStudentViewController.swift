//
//  ListStudentViewController.swift
//  Delegate
//
//  Created by Dong Duong V. on 08/04/2022.
//

import UIKit

class ListStudentViewController: UIViewController, DetailDelegate {
    func update(student: Student) {
        if student.id == 0{
            name1.text = student.name
        }else{
            name2.text = student.name
            
        }
   
    }
    
    
    var listStudent : [Student] = []

    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var id1: UILabel!
    
    
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var id2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Student"
        listStudent = [Student(id: 0, name: "CHí Phèo"), Student(id: 1, name: "thị nở")]
        // Do any additional setup after loading the view.
        listStudent.forEach{ student in
            if student.id == 0 {
                id1.text = " \(student.id)"
                name1.text = student.name
            }else{
                id2.text = "\(student.id)"
                name2.text = student.name

}
    }
}
    @IBAction func edit_action(_ button: UIButton) {
        let index = button.tag
        if button.tag == 0 {
            print("mở hs thứ 1")
        }else{
            print("mở hs thứ 2")
        }
        let detail = DetailViewController()
        detail.student = listStudent[index]
        detail.delegate = self
        navigationController?.pushViewController(detail, animated: true)
    }

}
