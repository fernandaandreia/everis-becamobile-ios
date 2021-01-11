//
//  DetalhesViewController.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 11/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class DetalhesViewController: UIViewController {

    // MARK: Variáveis
    var filmeEscolhido:[String:Any]? = nil
    let recuperarDadosFilmeAPI = APIRequisicao()
    
    // MARK: IBOutlets
    @IBOutlet weak var imagemPoster: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var sinopse: UILabel!
    @IBOutlet weak var dataDaEstreia: UILabel!
    
    // MARK: IBAction
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        trazerFilmesEmTela()

    }
    
    // MARK: Método para Recuperar os Detalhes

    func trazerFilmesEmTela(){
        
        guard let movie = filmeEscolhido as? [String:Any] else { return }
        guard let id = movie["id"] as? Int else { return print("erro ao buscar id") }
        guard let tituloFilme = movie["titulo"] as? String else { return }
        guard let poster = movie["poster"] as? UIImage else { return }
        
        recuperarDadosFilmeAPI.exibeDetalheFilme(id) { (resposta) in
            guard let dataEstreia = resposta["release_date"] as? String else { return }
            guard let sinopseFilme = resposta["overview"] as? String else { return }
            
            self.titulo.text = tituloFilme
            self.sinopse.text = sinopseFilme
            self.dataDaEstreia.text = dataEstreia
            self.imagemPoster.image = poster
            
        }
        
    }
    
    
   
}
