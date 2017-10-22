import UIKit

final class PhotoLibraryToolbar: UIView {
    
    // MARK: - Subviews
    private let discardButton = UIButton()
    private let confirmButton = UIButton()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        discardButton.addTarget(self, action: #selector(onDiscardButtonTap(_:)), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(onConfirmButtonTap(_:)), for: .touchUpInside)
        
        addSubview(discardButton)
        addSubview(confirmButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PhotoLibraryToolbar
    var onDiscardButtonTap: (() -> ())?
    var onConfirmButtonTap: (() -> ())?
    
    func setDiscardButtonIcon(_ icon: UIImage?) {
        discardButton.setImage(icon, for: .normal)
    }
    
    func setConfirmButtonIcon(_ icon: UIImage?) {
        confirmButton.setImage(icon, for: .normal)
    }
    
    // MARK: - UIView
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 50)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        discardButton.size = CGSize.minimumTapAreaSize
        discardButton.center = CGPoint(
            x: bounds.left + bounds.width / 4,
            y: bounds.top + bounds.height / 2
        )
        
        confirmButton.size = CGSize.minimumTapAreaSize
        confirmButton.center = CGPoint(
            x: bounds.right - bounds.width / 4,
            y: bounds.top + bounds.height / 2
        )
    }
    
    // MARK: - Private
    @objc private func onDiscardButtonTap(_: UIButton) {
        onDiscardButtonTap?()
    }
    
    @objc private func onConfirmButtonTap(_: UIButton) {
        onConfirmButtonTap?()
    }
}