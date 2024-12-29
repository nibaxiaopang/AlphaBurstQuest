//
//  LockVC.swift
//  AlphaBurstQuest
//
//  Created by AlphaBurst Quest on 2024/12/29.
//


import UIKit

class AlphaBurstLockViewController: UIViewController {

    @IBOutlet weak var imgThird: UIImageView!
    @IBOutlet weak var imgSecond: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
        if val == 1 {
            self.imgSecond.isHidden = false
            self.imgThird.isHidden = false
        } else if val == 2 {
            self.imgSecond.isHidden = true
            self.imgThird.isHidden = false
        } else {
            self.imgSecond.isHidden = true
            self.imgThird.isHidden = true
        }
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapFrst(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ABCPopVC") as! AlphaBurstABCPopViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapSecond(_ sender: Any) {
        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
        if val == 2 || val == 3 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ABCPopVC") as! AlphaBurstABCPopViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else  {
            let alert = UIAlertController(title: "Lock Level", message: "Please complete previous level to play this level.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
    }
    
    @IBAction func tapThird(_ sender: Any) {
        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
        if val == 2 || val == 3 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ABCPopVC") as! AlphaBurstABCPopViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else  {
            let alert = UIAlertController(title: "Lock Level", message: "Please complete previous level to play this level.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
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
