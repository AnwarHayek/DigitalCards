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
            PieSliceModel(value: 2.1, color: color_FFB300),
            PieSliceModel(value: 3, color: color_0090FF),
            PieSliceModel(value: 1, color: color_02B28E)
        ]
    }
}
