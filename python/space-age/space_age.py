class SpaceAge(object):
    RELATIVE_YEAR =  { 'earth' : 1.0,
                       'mercury': 0.2408467,
                       'venus': 0.61519726,
                       'mars': 1.8808158,
                       'jupiter': 11.862615,
                       'saturn': 29.447498,
                       'uranus': 84.016846,
                       'neptune': 164.79132
                      }

    def __init__(self, seconds):
        self.seconds = seconds
        self.earth_age = self.seconds / 31557600

        def make_method(planet, rel):
            def _method(self):
                return float("%.2f" % (self.earth_age / rel))
            return _method

        for planet, rel in self.RELATIVE_YEAR.items():
            setattr(self.__class__, "on_" + planet, make_method(planet, rel))
