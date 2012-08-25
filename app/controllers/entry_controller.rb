class EntryController < ApplicationController
 
  #def sign_in
   # @previuos_name = cookies[:name]
    #@name = params[:visitor_name]
    #cookies[:name] = @name
    
  #end
  
  def sign_in
    
    @names = session[:names]
    
    unless @names
      @names = []
    end
    
    @name = params[:visitor_name]
    
    if !@name.blank?
      unless @names.include?(@name)
      @names << @name
      end
    end
    
    session[:names] =@names
  end
end
