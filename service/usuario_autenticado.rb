require 'cpf_cnpj'
require 'colorize'

class UsuarioAutenticado
  def autenticar_usuario(usuarios_autorizados)
    puts "Digite seu CPF para acessar o sistema:"
    cpf = gets.chomp
    unless usuarios_autorizados.include?(cpf) && CPF.valid?(cpf)
    limpar_tela
      banner = <<-BANNER
        /$$   /$$ /$$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$   /$$$$$$ 
        | $$$ | $$| $$_____/ /$$__  $$ /$$__  $$| $$__  $$ /$$__  $$
        | $$$$| $$| $$      | $$  \\__/| $$  \\ $$| $$  \\ $$| $$  \\ $$
        | $$ $$ $$| $$$$$   | $$ /$$$$| $$$$$$$$| $$  | $$| $$  | $$
        | $$  $$$$| $$__/   | $$|_  $$| $$__  $$| $$  | $$| $$  | $$
        | $$\\  $$$| $$      | $$  \\ $$| $$  | $$| $$  | $$| $$  | $$
        | $$ \\  $$| $$$$$$$$|  $$$$$$/| $$  | $$| $$$$$$$/|  $$$$$$/
        |__/  \\__/|________/ \\______/ |__/  |__/|_______/  \\______/ 
      BANNER
      red_color = :light_red
      dark_red_color = :red

      current_color = dark_red_color

      for i in 1..5 do
        colored_banner = banner.lines.map do |line|
          line.chomp.colorize(current_color)
        end.join("\n")

        system('clear') || system('cls')  # Limpa a tela

        puts colored_banner

        sleep 1  #Espera 1 segundo antes de alternar as cores

        current_color = (current_color == dark_red_color) ? red_color : dark_red_color
      end
      exit
    end
  end
end

def validar_cpf(cpf)
  CPF.valid?(cpf)
end

def limpar_tela
    system('clear') || system('cls')
  end
