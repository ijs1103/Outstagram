//
//  FeedViewController.swift
//  Outstagram
//
//  Created by Eunyeong Kim on 2021/08/13.
//

import SnapKit
import UIKit

final class FeedViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self

        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")

        return tableView
    }()

    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        // 이미지 크롭 기능
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self

        return imagePickerController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTableView()
    }

}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.selectionStyle = .none
        cell?.setup()

        return cell ?? UITableViewCell()
    }
}

// UIImagePickerControllerDelegate, UINavigationControllerDelegate 두개의 프로토콜은 반드시 같이 사용
extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 이미지의 choose 버튼을 눌렀을때 실행되는 함수
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectImage: UIImage?

        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originalImage
        }

        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewController(uploadImage: selectImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen

            self?.present(navigationController, animated: true)
        }
    }
}

private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Outstagram"

        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton)
        )
        navigationItem.rightBarButtonItem = uploadButton
    }

    @objc func didTapUploadButton() {
        present(imagePickerController, animated: true)
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
