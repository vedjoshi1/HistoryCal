//
//  InfoViewController.swift
//  Today2
//
//  Created by Ved Joshi on 2/7/21.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let items = [FAQItem(question: "What is reddit?", answer: "reddit is a source for what's new and popular on the web."),
                    FAQItem(question: "How is a submission's score determined?", answer: "A submission's score is simply the number of upvotes minus the number of downvotes.")]

        let faqView = FAQView(frame: view.frame, title: "Top Queries", items: items)
        view.addSubview(faqView)

        // Do any additional setup after loading the view.
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
