//
//  HowPlay.swift
//  AlphaBurstQuest
//
//  Created by AlphaBurst Quest on 2024/12/29.
//


import UIKit

class AlphaBurstHowPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func TapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
