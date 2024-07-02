require 'colorize'
require './utils/limpa_tela'

class UsuarioAutenticado
  def initialize
    @usuarios_autorizados = ['12345678909', '74543726430']
    @limpa_tela = TelaLimpa.new
  end

  def autenticar_usuario
    puts "Digite seu CPF para acessar o sistema:"
    cpf = gets.chomp

    unless @usuarios_autorizados.include?(cpf)
      @limpa_tela.limpar_tela
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

      5.times do
        colored_banner = banner.lines.map { |line| line.chomp.colorize(current_color) }.join("\n")
        @limpa_tela.limpar_tela
        puts colored_banner
        sleep 1
        current_color = (current_color == dark_red_color) ? red_color : dark_red_color
      end

      exit
    end
  end
end
