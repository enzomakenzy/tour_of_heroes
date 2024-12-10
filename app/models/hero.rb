class Hero < ApplicationRecord
  validates :name, :token, presence: :true

  # Sobre o "where" presente abaixo
  #  - Converte o campo "name" e o termo "term" para letras minúsculas com LOWER, tornando a busca case-insensitive.
  # - Usa o operador LIKE para encontrar registros cujo nome contém o termo de pesquisa. O caractere "%"" é um coringa no SQL, significando "qualquer número de caracteres antes ou depois".
  # - A interpolação "?" é usada para evitar SQL Injection, e o valor interpolado (%#{term.downcase}%) é fornecido como o segundo argumento do where.
  scope :search, ->(term) { where("LOWER(name) LIKE ?", "%#{term.downcase}%") if term.present? }
  scope :by_token, ->(token) { where(token: token) } # filtrando por token
  scope :sorted_by_name, -> { order(name: :desc) } # filtrando por ordem decrescente
end
