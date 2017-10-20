require 'benchmark'
require_relative 'beer_song_procs'
require_relative 'beer_song_ifs'
require_relative 'beer_song'



n = 5000
Benchmark.bm(7) do |x|

  x.report("lambda")  do
    n.times {
      BeerSong.new.verses(99, 0)
    }
  end

  x.report("procs")   do
    n.times {
      BeerSongProcs.new.verses(99, 0)
    }
  end

  x.report("ifs")  do
    n.times {
      BeerSongIFS.new.verses(99, 0)
    }
  end

end


#user     system      total        real
#
#lambda   4.250000   0.000000   4.250000 (  4.258555)
#procs    4.420000   0.000000   4.420000 (  4.419230)
#ifs      4.260000   0.000000   4.260000 (  4.272677)
             


