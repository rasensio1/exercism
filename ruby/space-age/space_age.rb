class SpaceAge
  RELATIVE_ORBITALS = { earth: 1,
                        mercury: 0.2408467,
                        venus: 0.61519726,
                        mars: 1.8808158,
                        jupiter: 11.862615,
                        saturn: 29.447498,
                        uranus: 84.016846,
                        neptune: 164.79132 }

  EARTH_ORBITAL = 31557600.to_f

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(m)
    planet = m.to_s.gsub("on_", "").to_sym
    (@seconds / EARTH_ORBITAL) / RELATIVE_ORBITALS[planet]
  end

end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
