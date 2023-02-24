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
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    
    var images: [UIImage] = []
    var imageViews = [UIImageView]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: MemoTableViewCell.identifier)
        setUI()
        setConstraints()
        createPopupButton()
        addContentsScrollView()
        createPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MemoTableViewCell {
    private func setUI() {
        [titleLabel, ellipsisButton, scrollView, memoLabel, dateLabel].forEach {
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
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = self
        
        
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
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 300),
            
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
    
    private func addContentsScrollView() {
        guard let pencil = UIImage(systemName: "pencil"), let od = UIImage(systemName: "square.and.arrow.up.circle.fill") else { fatalError() }
        images.append(pencil)
        images.append(od)
        images.append(pencil)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(images.count), height: 300)
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            let x = scrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: scrollView.bounds.width, height: 300)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            
        }
    }
    
    private func createPageControl() {
        pageControl.numberOfPages = images.count
        scrollView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        pageControl.hidesForSinglePage = true
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
        
}
// 오류가 생긴 이유는 테이블뷰도 스크롤뷰라서 겹쳐지는 부분 때문인듯?
extension MemoTableViewCell: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let markListVC = MarkListViewController()
        markListVC.tableView.isScrollEnabled = false
        self.scrollView.isScrollEnabled = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.width
        print(value)
        pageControl.currentPage = Int(round(value)) + 1
    }
    

}
