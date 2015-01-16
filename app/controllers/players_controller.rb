class PlayersController < ApplicationController
  before_action :authenticate

  def index
    @league = League.find(params[:league_id])
    current_user.teams.each do |team|
      if team.league_id == @league.id
        @team = team
      end
    end
    @players = []
    Player.all.each do |player|
      if player.team_id.nil?
        @players << player
      end
    end
  end

  def update
    @league = League.find(params[:league_id])
    current_user.teams.each do |team|
      if team.league_id == @league.id
        @team = team
      end
    end
    @player = Player.find(params[:id])
    @player.team_id = @team.id
    if @player.save
      flash[:notice] = "#{@player.first_name} #{@player.last_name} added"
      redirect_to league_team_path(@league, @team)
    else
      @error = "Uh-oh. Something is wrong. Leave feedback or come back later."
      render :index
    end
  end
end
