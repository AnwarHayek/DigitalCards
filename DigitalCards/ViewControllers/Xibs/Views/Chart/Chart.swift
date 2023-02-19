//
//
//  Chart.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 16/02/2023.
//

import UIKit
import PieCharts

class Chart: UIView {

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var chartView: PieChart!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXib()
        setupView()
    }

    private func configureXib() {
        Bundle.main.loadNibNamed(Chart._id, owner: self, options: [:])
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.layoutIfNeeded()
    }

    func setupView() {
        chartView.models = [
            PieSliceModel(value: 2.1, color: "#FFB300"._color),
            PieSliceModel(value: 3, color: "#0090FF"._color),
            PieSliceModel(value: 1, color: "#02B28E"._color)
        ]
    }
}
