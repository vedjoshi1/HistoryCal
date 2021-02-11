//
//  EventViewController.swift
//  Today2
//
//  Created by Ved Joshi on 12/12/20.
//

import UIKit

class EventViewController: UIViewController {
    var arr = Constants.eventYearArrGS;
    var textArr = Constants.eventArrGS;
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
          // tableView.estimatedRowHeight = 50
          // tableView.rowHeight = UITableView.automaticDimension
    //    print("here")
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UINib(nibName: "SadCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     /Users/vedjoshi/Desktop/Swift_Projects/Today2/Today2
        // Pass the selected object to the new view controller.
    }
    */
    func descendSort(){
        arr.reverse()
        textArr.reverse()
        
        tableView.reloadData();
    }
    @IBAction func barButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "My AlertController", message: "choose your sort type", preferredStyle: UIAlertController.Style.actionSheet)

      
       
        let numDesAction = UIAlertAction(title: "Reverse", style: .default) { (action: UIAlertAction) -> Void in
                    
            self.descendSort();
                alertController.dismiss(animated: true, completion: nil)
            }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) -> Void in
                alertController.dismiss(animated: true, completion: nil)
            }
       
     //   alertController.addAction(numAscAction)
        
        alertController.addAction(numDesAction)
        
            alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
        
        
    }
}
extension EventViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count;
      //  return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
            as! SadCell
     //   print(indexPath[1]);
     //   var i = 0;
        if(indexPath.row == 0){
            
            cell.yearLabel.text = "Year:";
            cell.label.text = "Event:";
            return cell;
        }
        
        
            cell.yearLabel.text = String(arr[indexPath.row]);
            cell.label.text = textArr[indexPath.row]
           
     
          //  cell.label.lineBreakMode = .byWordWrapping;
        
        
        
        
        
         //   cell.infoLabel.fitTextToBounds();
            
       
        return cell;
    }
 /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   /*
        if let cell = tableView.cellForRow(at: indexPath) as? MessageCell{
            print("2")
            
            let line = cell.infoLabel.calculateMaxLines()
            return CGFloat(100*line)
            
            
        }
        
        return 20
     */
        let lines = (textArr[indexPath.row].count)
        print(lines);
        print((lines/50) + 1)
        print(indexPath.row)
        print("-------------")
        let finalLines = (lines/50) + 1;
        
        
        return CGFloat(80 + 5*finalLines);
      //  return UITableView.automaticDimension
      //  print(String(line))
     //   print ("---------------------")
        
    }
    
*/
    
    
    
    
}

extension EventViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   print(indexPath.row)
    }
   
}
