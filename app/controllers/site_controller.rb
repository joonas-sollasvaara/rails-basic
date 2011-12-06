class SiteController < ApplicationController
  
  def isbn
    if request.post?
      @isbn = params[:isbn]
      if IsbnValidator.new.validate(@isbn)
        flash[:notice] = "#{@isbn} is a valid ISBN!"
        redirect_to isbn_validator_path
      else
        flash.now[:error] = "#{@isbn} is not a valid ISBN!"
        render :isbn
      end
    end
  end

end
