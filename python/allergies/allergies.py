class Allergies(object):

    def __init__(self, score):
        self.score = bin(score)[2:].rjust(8, "0")[::-1]

    def is_allergic_to(self, item):
        return item in self.lst

    @property
    def lst(self):
        allergies = ['eggs', 'peanuts', 'shellfish', 'strawberries', 
                     'tomatoes', 'chocolate', 'pollen', 'cats']
        return [al for i, al in enumerate(allergies) if self.score[i] == "1"]
        
