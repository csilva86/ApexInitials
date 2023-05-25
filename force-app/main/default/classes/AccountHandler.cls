public class AccountHandler {
	     
    public static String geraExtenso(Decimal totDinheiro){
        String a = String.valueOf(totDinheiro); // Convertendo o decimal em string
        List <String> inteiro = a.split('\\.'); // separando os reais dos centavos
        // Tratando os reais
        String result = porExtenso(inteiro[0]) + ' reais';
        // tratando os centavos
        if(Integer.valueOf(inteiro[1]) > 0){
            result = result + ' e ' + dezenaPorExtenso(inteiro[1]) + ' centavos';
        }

        return (result + '.').capitalize();
    }
    
    public static String porExtenso(String valor){
        
		List <String> potenciaMil = new List<String>{'',' mil ',' milhão ',' bilhão ',' trilhão ',' quatrilhão ', ' milhões ',' bilhões ',' trilhões ',' quatrilhoes '};
		Integer auxiliar = 0;
        String extenso = '';

        while(valor.length() >= 3){   // Tratar milhares, milhões, bilhões...
            if(Integer.valueOf(valor.right(3)) > 1 && auxiliar > 1){
                extenso = centenaPorExtenso(valor) + potenciaMil[auxiliar + 4] + extenso;
            }else{
                extenso = centenaPorExtenso(valor) + potenciaMil[auxiliar] + extenso;
            }

            valor = valor.left(valor.length() - 3);
            auxiliar++;
        }
        if(valor.length() < 3 && valor.length() > 0){
            if(Integer.valueOf(valor) == 1 || auxiliar < 2){
                extenso = dezenaPorExtenso(valor) + potenciaMil[auxiliar] + extenso;
            } else {
                extenso = dezenaPorExtenso(valor) + potenciaMil[auxiliar + 4] + extenso;
            }
        }
        
        return extenso;
    }
    
	//Tratando as Dezenas
    public static String dezenaPorExtenso(String valor){
		List <String> unidades = new List<String>{'zero','um','dois','três','quatro','cinco','seis','sete','oito','nove'};
		List <String> dezenas = new List<String>{'dez','vinte','trinta','quarenta','cinquenta','sessenta','setenta','oitenta','noventa'};
		List <String> entreOnzeEDezenove = new List <String>{'onze','doze','treze','quatorze','quinze','desesseis','dezessete','dezoito','dezenove'};        
        List <String> digitos = new List<String>();
        
        String extenso = '';
        digitos = valor.split('');
        // 	De um a dez
        if(Integer.valueOf(valor.right(2)) > 0 && Integer.valueOf(valor.right(2)) < 10){
            extenso = unidades[Integer.valueOf(digitos[digitos.size()-1])];
        }
        
        // 	De onze a dezenove
        if(Integer.valueOf(valor.right(2)) > 10 && Integer.valueOf(valor.right(2)) < 20){
            extenso = entreOnzeEDezenove[Integer.valueOf(digitos[digitos.size()-1]) - 1];
        }
        
        //	De vinte a noventa e nove
        if(Integer.valueOf(valor.right(2)) > 19 && Integer.valueOf(valor.right(2)) < 100){
            if(Integer.valueOf(valor.right(1)) == 0){
                extenso = dezenas[Integer.valueOf(digitos[digitos.size()-2]) - 1];
            }else{
                extenso = dezenas[Integer.valueOf(digitos[digitos.size()-2]) - 1] + ' e ' + unidades[Integer.valueOf(digitos[digitos.size()-1])];
            }       
        }    
        return extenso;
    }
    
    //Tratando Centenas
    public static String centenaPorExtenso(String valor){
        List <String> centenas = new List<String>{'cem','duzentos','trezentos','quatrocentos','quinhentos','seiscentos','setecentos','oitocentos','novecentos','cento'};
    	String extenso = '';
        
        //	100, 200, 300, 400, 500, 600, 700, 800, 900
        if(Integer.valueOf(valor.right(2)) == 0 && Integer.valueOf(valor.right(3)) > 0){
            extenso = centenas[Integer.valueOf(valor.right(3).left(1)) - 1];
        } else 
        //	De 101 a 199
        if(Integer.valueOf(valor.right(3).left(1)) == 1){
            extenso = 'cento e ' + dezenaPorExtenso(valor);
        }
        //	De 201 a 999
        if(Integer.valueOf(valor.right(3).left(1)) > 1){
            extenso = centenas[Integer.valueOf(valor.right(3).left(1)) - 1] + ' e ' + dezenaPorExtenso(valor);
        }
        return extenso;
    }
    
}