class Api::TemplatesController < ApiController
  def get 
    render template: 'api/templates/'+params[:template]+'_template'
  end
end
