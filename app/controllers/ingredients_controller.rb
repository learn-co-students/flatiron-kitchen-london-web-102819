class IngredientsController < ApplicationController

    before_action :set_ingredient

    def new
        @ingredient = Ingredient.new
    end

    def create

        @ingredient = Ingredient.new(i_params)

        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end

    end

    def update

        if @ingredient.update(i_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end

    end


    private

    def i_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient
        if params[:id]
            @ingredient = Ingredient.find(params[:id])
        end
    end


end