module ApplicationHelper
    
    def calcularPtoArtigos (artigo)
        lista = VotosArtigo.where('artigo_id = ?', artigo.id)
        total = 0
        lista.each do |voto|
             if(voto.voto)
                total = total + 1
             else
                total = total - 1
             end
        end
        return total
    end
    
end
