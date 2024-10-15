//
//  SecondVC.swift
//  table-tea
//
//  Created by Jaimin Raval on 17/09/24.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    
    var currentJoke: JokeModel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("-/-/-/-/--/-/-/-/-/-/-/viewWillAppear Loaded")
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        print("-/-/-/-/--/-/-/-/-/-/-/viewDidAppear Loaded")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setJokeData()
//        print("-/-/-/-/--/-/-/-/-/-/-/viewDidLoad Loaded")
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("-/-/-/-/--/-/-/-/-/-/-/viewWillDisappear Loaded")
//    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        print("-/-/-/-/--/-/-/-/-/-/-/viewDidDisappear Loaded")
//    }

    func setJokeData() {
        idLabel.text = String(currentJoke.id)
        typeLabel.text = currentJoke.type
        setupLabel.text = currentJoke.setup
        punchlineLabel.text = currentJoke.punchline
        
    }
    
}
