//
//  TravelService.swift
//  iTravel_iOS_Challenge
//
//  Created by convidado on 08/04/23.
//

import Foundation
import HUGraphQL

class TravelService{
    
    var service = HUGService(enableLog: true)

    func searchPackage(local:String = "Rio de Janeiro", completion: @escaping (Result<HUGraphQL.SearchPackageQuery.Data, Error>) -> Void){
        
        let query = HUGraphQL.SearchPackageQuery(q: local, filters: nil, pagination: .init(
            page: 1,
            limit: 20,
            sort: .price,
            sortOrder: .desc), l10n: .init(pos: "br", locale: "pt", currency: "BRL"))
        
        service.client.fetch(query: query) { res in
            switch res {
            case .failure(let error):
                completion(.failure(error))
                // error
            case .success(let graphQLValue):
                completion(.success(graphQLValue.data!))
                //success
                
            }
            
        }

    }
    

}
