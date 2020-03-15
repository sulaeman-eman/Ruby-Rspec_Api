class BookstoresController < ApplicationController

    before_action :set_bookstore, only: [:show, :update, :destroy]

    def index
        @bookstores = Bookstore.all
        json_response(@bookstores)
    end

    def create
        @bookstore = Bookstore.create!(bookstore_params)
        json_response(@bookstore, :created)
    end

    def show
        json_response(@bookstore)
    end

    def update
        @bookstore.update(bookstore_params)
        head :no_content
    end

    def destroy
        @bookstore.destroy
        head :no_content
    end


    private

    def bookstore_params
        params.permit(:title, :deskripsi)
    end

    def set_bookstore
        @bookstore = Bookstore.find(params[:id])
    end


end