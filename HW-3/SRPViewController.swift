
import UIKit

enum ProportionType {
    case paleo
    case keto
}
enum CaloriesCalculationType {
    case mifflin
    case harrisBenedict
}

struct Nutrients {
    var carbs: Int
    var fats: Int
    var proteins: Int
}

protocol NutrientCalculatorProtocol {
    func calculateDailtyNutrients(proportionType: ProportionType,
                                  caloriesCalculatorType: CaloriesCalculationType) -> Nutrients
}

struct NutrientCalculator: NutrientCalculatorProtocol {
    func calculateDailtyNutrients(proportionType: ProportionType,
                                  caloriesCalculatorType: CaloriesCalculationType) -> Nutrients {
        let targetCalories: Int
        let nutrients: Nutrients
        
        switch caloriesCalculatorType {
        case .mifflin:
            targetCalories = 1200
        case .harrisBenedict:
            targetCalories = 1400
        }
        
        switch proportionType {
        case .paleo:
            nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
        return nutrients
    }
    
}

final class ViewController: UIViewController {
    
    private var calculator: NutrientCalculatorProtocol = NutrientCalculator()
    
    init(calculator: NutrientCalculatorProtocol) {
        self.calculator = calculator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

