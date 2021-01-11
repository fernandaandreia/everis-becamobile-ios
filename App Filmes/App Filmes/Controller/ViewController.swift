//
//  ViewController.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 07/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
  
    
  
    // MARK: Atributos
    var mostraFilmeCollection:[[String:Any]] = [[:]]
    let filmesAPI = APIRequisicao()
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        recuperaImages()
//        FilmeTrendingAPI().requisicaoAPITrending()
//        FilmesDetalhesAPI().requisicaoAPIDetalhes()
        
    }

    // MARK: IBOutlets
    @IBOutlet weak var colecaoFilmes: UICollectionView!

    
    // MARK: IBActions
    
    
    
    // MARK: Métodos Collection
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mostraFilmeCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! HomeCollectionViewCell
        celulaFilme.layer.borderWidth = 0.5
   
        let filmeEscolhido = mostraFilmeCollection[indexPath.item]
        

        guard let posterFilme = filmeEscolhido["imagem"] as? UIImage else { return celulaFilme }
        
        celulaFilme.poster.image = posterFilme

       
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetalhe = mostraFilmeCollection[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesFilmes") as! DetalhesViewController
        
        controller.filmeEscolhido = movieDetalhe
        
        self.present(controller, animated: true, completion: nil)
        
    }
    // MARK: Métodos
    
     func recuperaImages() {
        APIRequisicao().recuperaImagem { (movies) in
            self.mostraFilmeCollection = movies
            self.colecaoFilmes.reloadData()
        }
       
        }

    
    
 
}



