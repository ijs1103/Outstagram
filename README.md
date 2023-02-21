# Outstagram

## Feed
![Simulator Screen Recording - iPhone 11 Pro Max - 2023-02-21 at 18 00 33](https://user-images.githubusercontent.com/42196410/220310303-e81e03ac-0d2a-4fd8-9b8c-1de0d6145ae2.gif)

1) 피드 레이아웃은 UITableView 

2) BarButtonItem 클릭시 `UIImagePickerController` 화면으로 전환

3) 앨범의 사진 클릭시 이미지 편집 가능한 화면으로 이동 (`imagePickerController.allowsEditing = true`)

4) choose 버튼 클릭시 이미지 업로드폼 화면으로 이동

## Profile
![Simulator Screen Recording - iPhone 11 Pro Max - 2023-02-21 at 18 00 50](https://user-images.githubusercontent.com/42196410/220310327-9d09f06e-c4ea-41f4-af42-50a66596fd6a.gif)

1) `UICollectionView - FlowLayout`으로 3줄의 column인 Grid를 표시

2) BarButtonItem 클릭시 `UIAlertController - actionSheet` 화면으로 이동

## 🧩 개요
- UIImagePickerController
- UIAlertController의 actionSheet
- 사진앨범 접근권한 설정
- UITextView 커스텀 placeholder
- UIButton 이미지 크기 이슈 해결
- CGFloat Type 명시하기

## 🤔 배운 내용

### ✔️ 사진앨범 접근권한 설정

`info.plist`에서 `Private-Photo Library Usage Description` 항목 추가

### ✔️ UITextView 커스텀 placeholder

UITextField의 placeholder를 사용하지 않고 커스텀 placeholder를 만드는 이유는 

줄바꿈을 가능케 하고, placeholder의 텍스트를 왼쪽정렬 하기 위함이다. (textField의 placeholder는 한줄만 작성가능하고, 자동으로 중앙정렬이 된다)

```swift
private lazy var textView: UITextView = {
        let textView = UITextView()
        // 커스텀 placeholder
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self

        return textView
    }()

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        // 커스텀 placeholder 지우고, text 색깔 진하게 변경
        textView.text = nil
        textView.textColor = .label
    }
}

```

### ✔️ UIButton 이미지 크기 이슈 해결

버튼에 이미지 설정시, 사이즈가 제각각인 이슈 해결을 위한 extension

```swift
extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
```

### ✔️ CGFloat 타입 명시하기

```swift
// 1
let inset = 16.0
// 2
let inset: CGFloat = 16.0
```

1과 같은 코드작성시 컴파일 타임에 inset값이 Double인지 CGFloat인지 구분하는데 시간이 소요된다.

따라서 CGFloat인 경우, 타입을 명시하는게 좋다. `Int`와 `uint` 타입도 마찬가지의 경우이다.
