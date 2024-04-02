//
//  ViewController.swift
//  ListApp
//
//  Created by Melih Dural on 2.04.2024.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var managedObjectContext = appDelegate?.persistentContainer.viewContext
    lazy var entity = NSEntityDescription.entity(forEntityName: "ListItem", in: managedObjectContext!)
    
    @IBOutlet weak var tableView: UITableView!;
    
    var data = [NSManagedObject]();
    var alertController = UIAlertController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        fetchItems();
    }
    
    func fetchItems(){
        data = try! managedObjectContext!.fetch(NSFetchRequest<NSManagedObject>(entityName: "ListItem"))
        self.tableView.reloadData();
    }
    
    
    @IBAction func onAddButtonClick(_ sender: UIBarButtonItem){
        showAlert(title: "Yeni Eleman Ekle",
                  message: nil,
                  cancelButtonTitle: "Vazgeç",
                  submitButtonTitle: "Ekle",
                  hasTextField: true,
                  defaultButtonHandler: { [self]_ in
            let text = self.alertController.textFields?.first?.text;
            
            if text != "" {
                let listItem = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
                listItem.setValue(text, forKey: "title")
                try? managedObjectContext?.save();
                fetchItems();
            }
            else {
                self.showAlert(title: "Uyarı",
                               message: "Liste Elemanı Boş Bırakılamaz!",
                               cancelButtonTitle: "Tamam")
            }
        }
                  
        )
    }
    
    @IBAction func onRemoveButtonClick(_ sender: UIBarButtonItem){
        showAlert(title: "Uyarı",
                  message: "Listedeki tüm elemanlar silinecek. Onaylıyor musunuz?", cancelButtonTitle: "Vazgeç",
                  submitButtonTitle: "Sil"
        ){ [self] _ in
            for item in self.data {
                managedObjectContext?.delete(item)
            }
            
            try? managedObjectContext?.save()
            fetchItems();
        }
    }
    
    func showAlert(
        title: String?,
        message: String?,
        cancelButtonTitle: String?,
        submitButtonTitle: String? = nil,
        hasTextField: Bool = false,
        defaultButtonHandler: ((UIAlertAction) -> Void)? = nil) {
            
            alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            if hasTextField {
                alertController.addTextField();
            }
            
            let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .default)
            alertController.addAction(cancelButton);
            
            if defaultButtonHandler != nil {
                let defaultButton = UIAlertAction(title: submitButtonTitle, style: .default, handler: defaultButtonHandler)
                alertController.addAction(defaultButton);
            }
            
            present(alertController, animated: true);
        }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let listItem = data[indexPath.row];
        tableCell.textLabel?.text = listItem.value(forKey: "title") as? String;
        
        return tableCell;
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "Sil"){ [self]
            _,_, _ in
            managedObjectContext?.delete(self.data[indexPath.row])
            try? managedObjectContext?.save();
            fetchItems();
        }
        deleteAction.backgroundColor = .systemRed;
        
        let editAction = UIContextualAction(style: .normal, title: "Düzenle"){
            _,_, _ in
            self.showAlert(title: "Elemanı Düzenle",
                           message: nil,
                           cancelButtonTitle: "Vazgeç",
                           submitButtonTitle: "Kaydet",
                           hasTextField: true,
                           defaultButtonHandler: { [self]_ in
                var text = self.alertController.textFields?.first?.text;
                if text != "" {
                    self.data[indexPath.row].setValue(text, forKey: "title");
                    if managedObjectContext!.hasChanges{
                        try? managedObjectContext?.save();
                        fetchItems();
                    }
                }
                else {
                    self.showAlert(title: "Uyarı",
                                   message: "Liste Elemanı Boş Bırakılamaz!",
                                   cancelButtonTitle: "Tamam")
                }
            }
            )
        }
        editAction.backgroundColor = .systemYellow;
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction]);
        
        return config;
    }
}

