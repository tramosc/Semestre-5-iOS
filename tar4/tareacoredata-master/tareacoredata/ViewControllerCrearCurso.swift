//
//  ViewControllerCrearCurso.swift
//  tareacoredata
//
//  Created by Carl on 4/24/19.
//  Copyright © 2019 Carl. All rights reserved.
//

import UIKit

class ViewControllerCrearCurso: UIViewController {
    var anteriorVC = ViewController()
    @IBOutlet weak var txtnombrecurso: UITextField!
    @IBOutlet weak var txtpromediopractica: UITextField!
    @IBOutlet weak var txtpromediolabs: UITextField!
    @IBOutlet weak var txtexamen: UITextField!
    
    @IBAction func btnagregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Cur(context: context)
        curso.nombrecurso = txtnombrecurso.text!
        curso.promediopracticas = Double(txtpromediopractica.text!)!
        curso.promediolabs = Double(txtpromediolabs.text!)!
        curso.examenfinal = Double(txtexamen.text!)!
       
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //anteriorVC.cursos.append(curso)
        //anteriorVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
