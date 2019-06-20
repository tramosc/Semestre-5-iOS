//
//  ViewControllerEditarCurso.swift
//  tareacoredata
//
//  Created by Carl on 4/24/19.
//  Copyright © 2019 Carl. All rights reserved.
//

import UIKit

class ViewControllerEditarCurso: UIViewController {
    var curso:Cur? = nil

    @IBOutlet weak var txtednombre: UITextField!
    
    @IBOutlet weak var txtedpropracticas: UITextField!
    
    @IBOutlet weak var txtedprolabs: UITextField!
    
    @IBOutlet weak var txtedexamen: UITextField!
    
    @IBAction func btnEditar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        curso!.nombrecurso = txtednombre.text!
        curso!.promediopracticas = Double(txtedpropracticas.text!)!
        curso!.promediolabs = Double(txtedprolabs.text!)!
        curso!.examenfinal = Double(txtedexamen.text!)!
       
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //anteriorVC.cursos.append(curso)
        //anteriorVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtednombre	.text = curso!.nombrecurso
        txtedpropracticas.text = String(curso!.promediopracticas)
        txtedprolabs.text = String(curso!.promediolabs)
        txtedexamen.text = String(curso!.examenfinal)


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
