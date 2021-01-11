//
//  DetalhesViewController.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 09/01/21.
//

import UIKit

class DetalhesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    

    // MARK: Métodos
    func pegarDetalhesPelo(id:Int ,completion: @escaping(_ filme:[[String:Any]]) -> Void)  {
        APIRequisicao().recuperaFilme() { (movies) in
            let filmeEscolhido = movies.filter({ movieAtual in
            guard let movie = movieAtual["id"] as? Int else { return false }
                return movie == id
            })
            completion(filmeEscolhido)
        }
    }



}
