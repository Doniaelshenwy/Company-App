//
//  ViewController.swift
//  Company App
//
//  Created by Donia Elshenawy on 25/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var CompanyArray : [Network] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView .dataSource = self
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CompanyAPI().getData { [self] result in
            switch result {
            case .success(let data):
                self.CompanyArray = data!.networks
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CompanyArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SingleNameCompanyTableViewCell
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = UIColor(named: "Color")
        }
        animateTableView(index: indexPath.row, cell: cell)
        cell.nameCompanyLabel.text = CompanyArray[indexPath.row].name
        cell.selectionStyle = .none
        cell.createShadowOfView()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsCompanyViewController") as? DetailsCompanyViewController{
            vc.id = CompanyArray[indexPath.row].id
            vc.country = CompanyArray[indexPath.row].location.country
            vc.city = CompanyArray[indexPath.row].location.city
            vc.latitude = "\(CompanyArray[indexPath.row].location.latitude)"
            vc.longitude = "\(CompanyArray[indexPath.row].location.longitude)"
            vc.name = CompanyArray[indexPath.row].name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func animateTableView(index: Int, cell: SingleNameCompanyTableViewCell){
        cell.alpha = 0
        UIView.animate(withDuration: 0.2, delay: 0.1*Double(index),animations: {
                    cell.alpha = 1
                })
    }
}
