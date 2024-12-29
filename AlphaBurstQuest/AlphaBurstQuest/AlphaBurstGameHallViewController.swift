//
//  Home.swift
//  AlphaBurstQuest
//
//  Created by AlphaBurst Quest on 2024/12/29.
//


import UIKit
import StoreKit

class AlphaBurstGameHallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func abc(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LockVC") as! AlphaBurstLockViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Share(_ sender: Any) {
        let objectsToShare = ["AlphaBurst Quest"]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: 300, height: 300)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func Rate(_ sender: Any) {
        SKStoreReviewController.requestReview()
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
