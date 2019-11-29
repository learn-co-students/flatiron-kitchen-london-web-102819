class RecipesController < ApplicationController

    before_action :set_recipe

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(r_params)

        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end

    end

    def update

        if @recipe.update(r_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
        
    end


    private

    def r_params
        params.require(:recipe).permit(:name, ingredient_attributes: [:name], ingredient_ids:[])
    end

    def set_recipe
        @recipe = Recipe.find(params[:id]) if params[:id]
    end
end
