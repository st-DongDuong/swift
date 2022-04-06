//
//  HomeViewController.swift
//  test1
//
//  Created by Dong Duong V. on 01/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    override func viewDidLoad() {
    super.viewDidLoad()
        let frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        let ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.frame = frame
        ball.contentMode = .scaleToFill
        view.addSubview(ball)
    
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           if let touch = touches.first {
               if touch.view == ball {
                   let location = touch.location(in: view)
                   ball.center = location
               }
           }
       }
}
