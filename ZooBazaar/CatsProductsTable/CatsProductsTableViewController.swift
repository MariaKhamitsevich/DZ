//
//  CatsProductsTableViewController.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 1.05.22.
//

import UIKit

class CatsProductsTableViewController: UITableViewController {
    
    lazy var allProducts: [[Product]] = {
        var array: [[Product]] = []
        array.append(royalCaninProducts)
        array.append(whiskasProducts)
        
        return array
    }()
    
    var royalCaninProducts: [Product] = [Product(name: "Roayl Canin Sterilized", description: "Royal Canin Sterilized 37 food for sterilized cats from 1 to 7 years old.", image: UIImage(named: "roal canin"), price: "17", isFirstweight: true, isSecondweight: true, isThirdweight: true, isFourthweight: true), Product(name: "Royal Canin Maine Coon", description: "Royal Canin Maine Coon is designed specifically for Maine Coon cats over the age of 15 months.", image: UIImage(named: "Royal Canin Maine Coon"), price: "30.5", isFirstweight: true, isSecondweight: false, isThirdweight: false, isFourthweight: true), Product(name: "Royal Canin Exigent Savour Sensation", description: "Savor sensation is designed for finicky cats. These are two different types of croquette that differ in shape, texture and composition.", image: UIImage(named: "Royal Canin Exigent Savour Sensation"), price: "25.5", isFirstweight: true, isSecondweight: false, isThirdweight: true, isFourthweight: true)]
    
    var whiskasProducts: [Product] = [Product(name: "Whiskas for adult cats (Beef)", description: "Whiskas for sterilized cats (Beef) is a complete dry food for adult cats and cats. Whiskas contains all the necessary vitamins and minerals, proteins, fats and carbohydrates in the right proportions to keep your pet healthy from whiskers to tail.", image: UIImage(named: "Whiskas for adult cats (Beef)"), price: "7.25", isFirstweight: false, isSecondweight: false, isThirdweight: true, isFourthweight: true)]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CatsProductsTableViewCell.self, forCellReuseIdentifier: "CatsProductsTableViewCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allProducts.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProductsTableHeaderView()
        if section == 0 {
            view.title = "Royal Canin"
        }
        else {
            view.title = "Whiskas"
        }
        return view
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return royalCaninProducts.count
        case 1:
            return whiskasProducts.count
        default:
            return 0
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatsProductsTableViewCell") as! CatsProductsTableViewCell
        switch indexPath.section{
        case 0:
            cell.updateValues(product: royalCaninProducts[indexPath.row])
            return cell
            //        case royalCaninProducts.count..<(royalCaninProducts.count + whiskasProducts.count):
        default:
            cell.updateValues(product: whiskasProducts[indexPath.row])
            return cell
            
        }
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
