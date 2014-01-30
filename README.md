# Gibberish Experiments

_Gibberish Experiments_ é um servidor [Sinatra]() dedicado ao ensino de síntese sonora e design sonoro em _browsers_
que suportem HTML5, utilizando a biblioteca [Gibberish.js](http://github.com/charlieroberts/Gibberish)

# Dependencias

Este servidor roda sob código [Ruby-2.0.0]() e, portanto, a primeira coisa a fazer é instalar o [Ruby]();
Para usuários de windows (como inicialmente desenvolvido), sugiro baixar no site [RubyInstallers](), que oferece todo suporte de instalação
rápida; é aconselhavel também baixar o [devkit](). Para Instalções em MacOSX e Linux, sugiro ir ao próprio site
do [Ruby] e verificar a documentação para instalação apropriada. Aconselho baixar nessas plataformas o _software_
[RVM]()

Uma vez instalado, devemos instalar algumas dependencias (GEMs); para isso vá até a linha de comando:

```
	$ gem install sinatra
```

Este comando irá baixar outras dependências, então paciencia

# Baixando este software

Para baixar este _software_, na linha de comando (supondo que já se tem [GIT]() instalado)

```
	$ git clone https://github.com/jahpd/gibberish_experiments
```

ou se você é novato, simplismente baixe o .zip ao lado

# Rodando

Vá até a pasta do _software_

```
	$ cd gibberish_experiments
```

e rode:

```
	$ ruby app.rb
```

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
