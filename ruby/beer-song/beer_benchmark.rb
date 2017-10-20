require 'benchmark'
require_relative 'beer_song'
require_relative 'beer_song_ifs'



n = 5000
Benchmark.bm(7) do |x|

  x.report("procs")   do
    n.times {
      BeerSong.new.verses(99, 0)
    }
  end

  x.report("ifs")  do
    n.times {
      BeerSongIFS.new.verses(99, 0)
    }
  end
end


# user     system      total        real
# procs   4.370000   0.000000   4.370000 (  4.381468)
# ifs     4.240000   0.000000   4.240000 (  4.238254)

#procs aren't too much slower - nice!
