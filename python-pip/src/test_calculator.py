import calculator

class TestCalculator:
    def test_addition(self):
        assert calculator.add(5, 6) == 11
    
    def test_subtraction(self):
        assert calculator.subtract(10, 3) == 7