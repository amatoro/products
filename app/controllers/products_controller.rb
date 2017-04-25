class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "El producto ha sido creado con éxito"
      redirect_to products_path
    else
      flash[:alert] = "Oh, oh! El producto no ha sido creado con éxito"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "El producto ha sido actualizado con éxito"
      redirect_to products_path
    else
      flash[:alert] = "Oh, oh! El producto no ha sido actualizado con éxito"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "El post ha sido eliminado con éxito"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, category_ids: [])
  end
end
