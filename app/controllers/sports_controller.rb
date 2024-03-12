class SportsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    def index
        @sports = Sport.all
    end

    def new
        @sport = Sport.new
      end
    
      def create
        sport = Sport.new(sport_params)
        if sport.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @sport = Sport.find(params[:id])
      end

      def edit
        @sport = Sport.find(params[:id])
      end

      def update
        sport = Sport.find(params[:id])
        if sport.update(sport_params)
          redirect_to :action => "show", :id => sport.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        sport = Sport.find(params[:id])
        sport.destroy
        redirect_to action: :index
      end

      private
      def sport_params
        params.require(:sport).permit(:theme, :about, :image)
      end
end
