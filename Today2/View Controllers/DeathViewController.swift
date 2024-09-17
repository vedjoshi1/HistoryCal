//
//  DeathViewController.swift
//  Today2
//
//  Created by Ved Joshi on 12/20/20.
//

import UIKit

class DeathViewController: UIViewController{
   
    var aboom = Constants.deathEventArrGS;
    var countArr : [(Int)] = [];
    let dayte = Day();
    var testArrayString : [(String)] = [];
    var testArrayInt : [(Int)] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        testArrayString = [];
        testArrayInt = [];
        tableView.dataSource = self;
        tableView.delegate = self
        tableView.register(UINib(nibName: "SadCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
          
      //  getPopularity();
       
    }
    

    
    
    func sort(sortArr:[Event]) -> ([Event]){
       
        let descendingStrings = sortArr.sorted { $0.count > $1.count }
        
        return descendingStrings
    
        
    }
    
    
    

    func descendSort(){
      
        aboom.reverse()
        
        tableView.reloadData();
    }
    
    
    
    @IBAction func onPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Sort Type Selector", message: "choose your sort type", preferredStyle: UIAlertController.Style.actionSheet)

      
        let numAscAction = UIAlertAction(title: "By Popularity", style: .default) { [self] (action: UIAlertAction) -> Void in
                    alertController.dismiss(animated: true, completion: nil)
            
              aboom = sort(sortArr: aboom);
            tableView.reloadData();
              print("am here")
 
            
            }
        let numDesAction = UIAlertAction(title: "Reverse", style: .default) { (action: UIAlertAction) -> Void in
                    
            self.descendSort();
                alertController.dismiss(animated: true, completion: nil)
            }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) -> Void in
                alertController.dismiss(animated: true, completion: nil)
            }
       
        alertController.addAction(numAscAction)
        
        alertController.addAction(numDesAction)
        
            alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
}

extension DeathViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboom.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
            as! SadCell
      
        if(indexPath.row == 0){
            
            cell.yearLabel.text = "Year:";
                cell.label.text = "Person who unfortunately(or maybe fortunately) passed away";
            cell.label.textColor = UIColor.black
            cell.label.attributedText = NSAttributedString(string: cell.label.text!)

            
            return cell;
        }else{
        
        
        
            cell.yearLabel.text = String(aboom[indexPath.row - 1].year);
            cell.label.text = String(aboom[indexPath.row - 1].description);
        cell.label.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        cell.label.attributedText = NSAttributedString(string: cell.label.text!, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
            
        return cell;
    }
    }
}
extension DeathViewController:UITableViewDelegate{
    
    
    func tableView(_ tableView1: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            return;
            
        }
        
        let cell = tableView1.cellForRow(at: indexPath) as! SadCell
        var nameString = cell.label.text
        let urlstring = "https://en.wikipedia.org/wiki/"
        
        if let index = nameString?.firstIndex(of: ","){
            
            nameString = String(nameString![..<index])
        }
        if let index = nameString?.firstIndex(of: "("){
            
            nameString = String(nameString![..<index])
        }
        
        
        var name = nameString!;
        
        name = (name.trimmingCharacters(in: .whitespaces));
        name = name.replacingOccurrences(of: " ", with: "_")

        
        name = name.folding(options: .diacriticInsensitive,
                                                     locale: Locale.current)
        
        
        if let url = URL(string: "https://en.wikipedia.org/wiki/\(name)") {
            UIApplication.shared.open(url)
        }else{
            print("cannot")
        }
    }
}
    
    
    

