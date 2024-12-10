module Authenticable
  private

  def authenticate_with_token
    # se o token ja tiver valor, ele retorna, senão, ele faz um request e depois retorna
    @token ||= request.headers["Authorization"]

    unless valid_token?
      render json: { errors: "Forneça um header Authorization para se identificar(qualquer um com pelo menos 10 caracteres)" }, status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token.size >= 10
  end
end
