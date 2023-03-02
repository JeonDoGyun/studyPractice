//
//  MemoTableViewCell.swift
//  trip
//
//  Created by 전도균 on 2023/02/23.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MemoTableViewCell.self)
    
    
    let titleLabel = UILabel()
    let memoLabel = UILabel()
    let dateLabel = UILabel()
    let ellipsisButton = UIButton(type: .system)
    
    lazy var scrollView = UIScrollView()
    let pageControl = UIPageControl()
    var images: [UIImageView] = []
    
    let colors = [UIColor.red, UIColor.blue, UIColor.green]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: MemoTableViewCell.identifier)
        setUI()
        setConstraints()
        createPopupButton()
        createPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MemoTableViewCell {
    private func setUI() {
        [titleLabel, ellipsisButton, scrollView, pageControl, memoLabel, dateLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
                
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        
        titleLabel.backgroundColor = .red
        titleLabel.text = "A"
        titleLabel.sizeToFit()
        
        ellipsisButton.backgroundColor = .white
        ellipsisButton.tintColor = .lightGray
        ellipsisButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        
        scrollView.backgroundColor = .lightGray
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: UIScreen.main.bounds.size.width, height: 300)
        scrollView.contentSize.width = UIScreen.main.bounds.size.width * CGFloat(colors.count)
        
        memoLabel.backgroundColor = .systemPink
        memoLabel.numberOfLines = 2
        memoLabel.text = "B"
        
        dateLabel.backgroundColor = .yellow
        dateLabel.numberOfLines = 1
        dateLabel.text = "C"
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            ellipsisButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            ellipsisButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ellipsisButton.widthAnchor.constraint(equalToConstant: 50),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 300),
            
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            memoLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            memoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            memoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: memoLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func createPopupButton() {
        let edit = UIAction(title: "편집하기", image: UIImage(systemName: "square.and.pencil"), handler: { _ in
            print("편집")
        })
        let delete = UIAction(title: "삭제하기", image: UIImage(systemName: "trash"), handler: { _ in
            print("삭제")
        })
        ellipsisButton.menu = UIMenu(identifier: nil,
                                     options: .displayInline,
                                     children: [edit, delete])
        ellipsisButton.menu?.preferredElementSize = .medium
        ellipsisButton.showsMenuAsPrimaryAction = true
    }

    private func createPage() {
        pageControl.numberOfPages = colors.count
        pageControl.hidesForSinglePage = true
        
        for i in 0..<colors.count {
            let imageView = UIImageView()
            imageView.backgroundColor = colors[i]
            imageView.contentMode = .scaleAspectFit
            
            let xPos = UIScreen.main.bounds.width * CGFloat(i)
            print(xPos)
        
            imageView.frame = CGRect(x: xPos, y: scrollView.contentOffset.y, width: UIScreen.main.bounds.width, height: 300)
            scrollView.addSubview(imageView)
        }

    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
}

extension MemoTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.width
        print(value)
        pageControl.currentPage = Int(round(value))
    }
}
