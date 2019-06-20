//
//  ViewController.swift
//  tareacoredata
//
//  Created by Carl on 4/24/19.
//  Copyright © 2019 Carl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var cursos:[Cur] = []
    var indexSeleccionado:Int = 0
    var promediofinal:Double = 0

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func agregarsegue(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cursos = self.cursos[indexPath.row]
        let propracticas = cursos.promediopracticas
        let prolabs = cursos.promediolabs
        let examen = cursos.examenfinal
        var resultpracticas:Double = 0
        var resultlabs:Double = 0
        var resultexa:Double = 0
    
        resultpracticas = propracticas*0.3
        resultlabs = prolabs*0.6
        resultexa = examen*0.1
        
        promediofinal = (resultpracticas+resultlabs+resultexa)
        if(promediofinal>=13 && promediofinal<=20){
            cell.textLabel?.text = "\(cursos.nombrecurso!)"
            cell.backgroundColor = UIColor.green
    }
    else{
            cell.textLabel?.text = "\(cursos.nombrecurso!)"
            cell.backgroundColor = UIColor.red
    }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "CursoSeleccionadoSegue", sender: curso)
    }
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print(promediofinal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            cursos = try context.fetch(Cur.fetchRequest()) as! [Cur]
        }catch{
            print("error en la coredata")
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == .delete){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            self.indexSeleccionado = indexPath.row
            let curso = self.cursos[indexPath.row]
            context.delete(curso)
            cursos.remove(at: indexPath.row)
            tableView.reloadData()
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "agregarSegue"{
         let siguienteVC = segue.destination as! ViewControllerCrearCurso
         siguienteVC.anteriorVC = self}*/
        if (segue.identifier == "CursoSeleccionadoSegue") {
            let siguienteVC = segue.destination as! ViewControllerEditarCurso
            siguienteVC.curso = sender as! Cur
            //siguienteVC.anteriorVC = self
            
        }
        
    }
    //no
    
  


}

