//
//  TableViewController.swift
//  SubteBA
//
//  Created by Guadalupe Vlcek on 12/6/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//

//import Cocoa

import UIKit

class TableViewController: UITableViewController {

    var estados = [EstadoSubte]()
    let servicio = ServicioSubte()
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        servicio.buscaDatos {
            [weak self] (estados) in
            self?.estados = estados
            dispatch_async(dispatch_get_main_queue()) {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return estados.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Identifier", forIndexPath: indexPath)
        let e = estados[indexPath.row]
        cell.textLabel?.text = e.linea
        cell.detailTextLabel?.text = e.estado
        cell.imageView?.image = e.icon
        cell.imageView?.contentMode = .ScaleAspectFit
        return cell
    }
    
}
