class AwardsController < ApplicationController
  # GET /awards
  # GET /awards.json
  
  before_filter :get_student
  def index
    @awards = @student.awards

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @awards }
    end
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
    @award = @student.awards.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @award }
    end
  end

  # GET /awards/new
  # GET /awards/new.json
  def new
    @award = @student.awards.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @award }
    end
  end

  # GET /awards/1/edit
  def edit
    @award = @student.awards.find(params[:id])
  end

  # POST /awards
  # POST /awards.json
  def create
    @award = @student.awards.build(params[:award])

    respond_to do |format|
      if @award.save
        format.html { redirect_to student_awards_url(@student), notice: 'Award was successfully created.' }
        format.json { render json: @award, status: :created, location: @award }
      else
        format.html { render action: "new" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /awards/1
  # PUT /awards/1.json
  def update
    @award = @student.awards.find(params[:id])

    respond_to do |format|
      if @award.update_attributes(params[:award])
        format.html { redirect_to student_awards_url(@student), notice: 'Award was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award = @student.awards.find(params[:id])
    @award.destroy

    respond_to do |format|
      format.html { redirect_to student_awards_path(@student) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_student
    @student = Student.find(params[:student_id])
  end
  
end
