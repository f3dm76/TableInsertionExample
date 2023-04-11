//
//  ViewController.swift
//  table
//
//  Created by Alisa Mylnikova on 02.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    var models: [Model] = []
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.transform = CGAffineTransform(rotationAngle: .pi)

        models = (0..<10).map { _ in Model() }

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }

    @objc func fireTimer() {
        models.insert(Model(), at: 0)

        tableView.performBatchUpdates {
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Cell
        cell?.titleLabel?.text = models[indexPath.row].text
        cell?.bgView?.layer.cornerRadius = 10
        cell?.transform = CGAffineTransform(rotationAngle: .pi)
        return cell ?? UITableViewCell()
    }
}

