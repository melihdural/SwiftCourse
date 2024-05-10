//
//  CRUD.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import Foundation

class CRUD {
    var baseUrl = "http://localhost:5053"
    
    func addContact(contact: Kisi, completion: @escaping (Bool, String) -> Void) {
        let url = URL(string: "\(baseUrl)/AddContact")!
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        
        do {
            let jsonData = try JSONEncoder().encode(contact)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(false, "Error encoding JSON: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(false, "Server error or not found")
                return
            }
            
            if let error = error {
                completion(false, "HTTP Request Failed \(error)")
                return
            }
            
            completion(true, "Contact deleted successfully")
        }
        
        task.resume()
    }
    
    func getContacts(completion: @escaping (Bool, [Kisi]?, String) -> Void) {
        let url = URL(string: "\(baseUrl)/ListContact")!
        var request = URLRequest(url: url);
        request.httpMethod = "GET";
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(false, nil, "Error: \(error)")
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(false, nil, "Invalid response or status code")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(false, nil, "No data received")
                }
                return
            }
            
            do {
                let contacts = try JSONDecoder().decode([Kisi].self, from: data)
                DispatchQueue.main.async {
                    completion(true, contacts, "Contacts fetched successfully")
                }
            } catch {
                DispatchQueue.main.async {
                    completion(false, nil, "JSON decoding failed: \(error)")
                }
            }
        }
        task.resume()
        
    }
    
    func updateContact(contact: Kisi, completion: @escaping (Bool, String) -> Void) {
        let url = URL(string: "\(baseUrl)/UpdateContact")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        do {
            let jsonData = try JSONEncoder().encode(contact)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(false, "Error encoding JSON: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(false, "Server error or not found")
                return
            }
            
            if let error = error {
                completion(false, "HTTP Request Failed \(error)")
                return
            }
            
            completion(true, "Contact deleted successfully")
        }
        
        task.resume()
    }
    
    func deleteContact(contactId: Int, completion: @escaping (Bool, String) -> Void) {
        let url = URL(string: "\(baseUrl)/DeleteContact")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let parameters = ["id": contactId];
        do {
            let jsonData = try JSONEncoder().encode(parameters)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(false, "Error encoding JSON: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(false, "Server error or not found")
                return
            }
            
            if let error = error {
                completion(false, "HTTP Request Failed \(error)")
                return
            }
            
            completion(true, "Contact deleted successfully")
        }
        
        task.resume()
    }
}

