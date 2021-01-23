//
//  TestViewController.swift
//  Today2
//
//  Created by Ved Joshi on 12/23/20.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SadCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
       // tableView
    //    tableView.rowHeight = UITableView.automaticDimension
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
extension TestViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.birthArrGS.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! SadCell
      //  cell.yearLabel.text = String(arr[indexPath.row]);
       // cell.infoLabel.text = String(Constants.birthArrGS[indexPath.row])
      
        cell.label.text = Constants.birthArrGS[indexPath.row]
        cell.yearLabel.text = Constants.birthYearArrGS[indexPath.row]
        return cell;
    }
    
    
    
    
    
}
