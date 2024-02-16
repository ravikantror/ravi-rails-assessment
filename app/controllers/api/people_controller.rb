class Api::PeopleController < Api::ApiController
	# app/controllers/api/people_controller.rb
    before_action :set_person, only: [:show, :update, :destroy]

    # GET /api/people
    def index
      @people = Person.all
      render json: @people
    end

    # GET /api/people/1
    def show
      render json: @person
    end

    # POST /api/people
    def create
      @person = Person.new(person_params)

      if @person.save
        render json: @person, status: :created
      else
        render json: @person.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/people/1
    def update
      if @person.update(person_params)
        render json: @person
      else
        render json: @person.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/people/1
    def destroy
      @person.destroy
    end

    private
      def set_person
        @person = Person.find(params[:id])
      end

      def person_params
        params.require(:person).permit(:name)
      end
  
end
