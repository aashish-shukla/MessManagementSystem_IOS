import UIKit

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var qualitySegment: UISegmentedControl!
    @IBOutlet weak var mealSegment: UISegmentedControl!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mess Feedback"
        setupUI()
    }

    func setupUI() {
        commentsTextView.layer.borderColor = UIColor.systemGray4.cgColor
        commentsTextView.layer.borderWidth = 1.0
        commentsTextView.layer.cornerRadius = 8
        commentsTextView.text = ""

        submitButton.layer.cornerRadius = 8
    }

    @IBAction func submitFeedback(_ sender: UIButton) {
        let quality = qualitySegment.titleForSegment(at: qualitySegment.selectedSegmentIndex) ?? "N/A"
        let meal = mealSegment.titleForSegment(at: mealSegment.selectedSegmentIndex) ?? "N/A"
        let comments = commentsTextView.text ?? ""

        let feedbackSummary = """
        🔹 Food Quality: \(quality)
        🔹 Needs Improvement: \(meal)
        🔹 Additional Comments: \(comments)
        """

        print("Feedback Submitted:\n\(feedbackSummary)")

        showAlert(message: "Thank you! Your feedback has been submitted.")
        commentsTextView.text = ""
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Feedback", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
