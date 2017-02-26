//
//  DetalleSubte.swift
//  SubteBA
//
//  Created by Guadalupe Vlcek on 18/6/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//

import UIKit

class DetalleSubteViewController: UIViewController {
    
    @IBOutlet weak var leibelLabel: UILabel!
    @IBOutlet weak var lineaLabel: UILabel!
    @IBOutlet weak var lineaImageView: UIImageView!
    
    var estadoSubte: EstadoSubte!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leibelLabel.text = estadoSubte.estado
        lineaLabel.text  = estadoSubte.linea
        lineaImageView.image = estadoSubte.icon
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
