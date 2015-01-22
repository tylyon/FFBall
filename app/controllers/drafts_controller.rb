class DraftsController < ApplicationController
  before_action :authenticate, :commissioner_authenticate
  def index
    binding.pry
  end
  def show
    binding.pry
    @pick = Pick.new
  end
  def new
    @league = League.find(params[:league_id])
    @draft = Draft.new
    render layout: false
  end
  def create
    @league = League.find(params[:league_id])
    member_amount = @league.teams.count
    @teams = []
    until member_amount == 0
      @teams << Team.find(params["team_id-#{member_amount}"])
      member_amount -= 1
    end
    @teams.reverse!
    @players = Player.all
    @draft = Draft.new(year: DateTime.now, league_id: @league.id)
    if @draft.save
      @pick = Pick.new
      render :show, layout: false
    else
      flash[:notice] = "Uh-oh. Something went wrong."
      redirect_to league_path(@league)
    end
  end
end
