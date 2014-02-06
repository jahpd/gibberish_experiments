# Gibberish Experiments

_Gibberish Experiments_ é um servidor [Rails](http://rubyonrails.org/) dedicado ao ensino de síntese sonora e design sonoro em _browsers_
que suportem HTML5, utilizando a biblioteca [Gibberish.js](http://github.com/charlieroberts/Gibberish)

# Baixando este software

Para baixar este _software_, na linha de comando (supondo que já se tem [GIT]() instalado)

```
	$ git clone https://github.com/jahpd/gibberish_experiments
```

ou se você não ganhou a confiança desses comandos, simplismente baixe o .zip ao lado

# Dependencias

## Linux

### Debian e sabores

``` 
	$ sudo apt-get install ruby
```

## Windows
Este servidor está sendo desenvolvido sob código [Ruby-2.0.0](https://www.ruby-lang.org/pt/downloads/) e, 
portanto, a primeira coisa a fazer é instalá-lo; para usuários de windows, sugiro baixar no site [RubyInstallers](rubyinstaller.org)

## MacOSX

Siga esse [tutorial](http://code.tutsplus.com/tutorials/how-to-install-ruby-on-a-mac--net-21664)
ou [esse](https://rvm.io/rvm/install)  

## Servidor Rails

Uma vez instalado o Ruby, devemos instalar algumas dependencias (GEMas); 
para isso vá até a linha de comando:

```
	$ gem install rails
```

Para os que gostam de trabalhar offline

``` 
	$ gem install rails --rdoc	
```

Este comando irá baixar outras dependências, então paciencia

# Rodando

Vá até a pasta do _software_

```
	$ cd gibberish_experiments
```

e rode:

```
	$ rails server
```

Isso criará um servidor rails com suporte a sintese sonora

# Testes

Todos os testes estão sendo feitos na pasta _tests_ (duhh); é só rodar:

```
	$ ruby tests/arquivo_de_teste.rb
```

# Códigos Gibberish

Para facilitar a vida dos desenvolvedores, códigos funcionais do gibberish estão em _public/scripts_ com extensão .gb;
Na verdade são códigos javascript, mas sem a enrolação de ficar invocando tags _<script/>_

##### Desenvolvedores: Importante!

NUNCA RODE CÓDIGOS GIBBERISH COM ATRIBUTOS _language_
 
```html
	<script language="text/javascript">
	/* nao faça o codigo...*/
	</script>
```

Não sei porque, mas o Gibberish nunca roda adequadamente (levei 4 horas p descobrir isso...);
tirando este atributo, o Gibberish roda adequadamente.

# TODO

Hackeie, ajude-me a desenvolver um servidor seguro e com qualidade de audio :)

# Versões

- 0.0.1
  - Desenvolvido a base do servidor sinatra
  - Adicionados simples códigos: sine, triangle, saw, pwm, band limited saw, white noise
- 0.0.11
  - Servidor Rails iniciado
