//
//  PopularityViewController.swift
//  Today2
//
//  Created by Ved Joshi on 1/18/21.
//

import UIKit

class PopularityViewController: UIViewController {

    @IBOutlet weak var popularityTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popularityTableView.dataSource = self
        popularityTableView.register(UINib(nibName: "PopularityTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
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


extension PopularityViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = Constants.birthPopCountGS
        return arr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PopularityTableViewCell
        let arr = Constants.birthPopNameGS;
        let aboomer = Constants.birthPopCountGS;
     
        cell.nameLabel.text = arr[indexPath.row];
        return cell;
        
    }
    
    
    
    
    
    
}
