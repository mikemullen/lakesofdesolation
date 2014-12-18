module LakesHelper

  def randlake
  	@lakes = Lake.all
    @lakessorted = @lakes.sort_by { |l| l.alphaname }
    @lakesvisited = @lakessorted.delete_if { |l| l.visited == false }
    @maxindex = @lakesvisited.count - 1
  	@randolakeindex = rand(@maxindex)
    @randolake = @lakesvisited[@randolakeindex]
  end

end