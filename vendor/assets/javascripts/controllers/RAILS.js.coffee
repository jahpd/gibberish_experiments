console = window.console

window.RAILS = 

  initialized: false
  
  editor: null
          
  clean: (callback) ->
    console.log 'Operating cleaning...'
    if window.RAILS.initialized or false
      Gibberish.clear()
    callback()

  init: (callback) ->
    console.log 'Initializing Gibberails audio-client...'
    try 
      Gibberish.init()
      Gibberish.Time.export()
      Gibberish.Binops.export()
      if callback then callback()
    catch e
      alert e  
  
  execute: (compile, data, callback) ->
    try
      js = unescape(data)
      js = compile js, bare:true
      js = unescape js
      if callback then callback !js, js
    catch e
      window.RAILS.initialized = false
      alert "#{compile.prototype.name}:\n#{e}"
      
  run: (callback)->
    console.log 'Operating compilation...'
    RAILS.execute CoffeeScript.compile, RAILS.editor.getValue(), (err, js) ->
      if callback then callback err, eval js else eval js

  checkfloats: (k, v)->
    b = false
    for t in ['freq', 'amp', 'pulsewidth', 'chance', 'pitchMin', 'pitchMax', 'pitchChance', 'cutoff', 'Q', 'roomSize', 'dry', 'wet']
      if (typeof(v) is 'object') and k == t
        b = true
        break
    b
  
  checkints: (k, v)->
    b = false
    for t in ['mode', 'rate', 'amount']
      if (typeof(v) is 'object') and k == t
        b = true
        break
    b
    
  # As funções abaixo são apenas para serem utilizadas
  # dentro do ambiente dado pela função `eval()` durante
  # o processo do JIT
  
  # Após inicializar, limpe, re-inicie o servidor de audio e execute a função
  # dada pelo usuario depois de um tempo determinado
  INIT: (time, callback) -> 
    setTimeout -> 
      RAILS.clean -> RAILS.init ->
        console.log "! RUnNINg !"
        RAILS.initialized = true
        callback() 
    , time

  # Um gerador de audio
  # ```coffee
  # sinG = new Gibberish.Sine(445, 0.71)
  # sin = RAILS.GEN "Sine", amp:440, freq: 0.71 # similar ao anterior
  # sinG.connect()  
  # sin.connect()
  # ```
  # @return Gibberish.Ugen
  GEN: (n, o, c) ->
    try
      u = new Gibberish[n]
      console.log "#{u} #{n}:"
      (console.log "  #{k}:#{v}" ; u[k] = v) for k, v of o
      if c then c u else u
    catch e
      alert e
  # Um gerador de audio, mas com valores randomicos; é interessante notar que
  # se você quiser um número randômico, forneça um Array de dois valores; se você
  # não quiser, deixe como quiser
  # ```coffee
  # sinG = new Gibberish.Sine(Gibberish.rndf(440, 445), 0.71)
  # sin = RAILS.GEN_RANDOM "Sine", amp: 0.71, freq: [440, 445] # similar ao anterior
  # sinG.connect()  
  # sin.connect()
  # ```
  # @return Gibberish.Ugen  
  GEN_RAND: (n, o, c) ->
    for k, v of o
      if RAILS.checkfloats(k, v)
        o[k] = Gibberish.rndf v[0], v[v.length-1] 
      else if RAILS.checkints(k, v)
        o[k] = Gibberish.rndi v[0], v[v.length-1]
      else
        o[k] = v
         
    RAILS.GEN n, o, c

  # Um gerador de audio, mas com valores dados por uma função; é interessante notar que
  # se você quiser um número algoritico, forneça uma função geradora que retorne um
  # objeto (Hash) com as propriedades necessárias para a Unidade geradora de audio; se você
  # não quiser, deixe como quiser
  # ```coffee
  # freq = Gibberish.rndf(440, 445)
  # amp = 1/o.freq 
  # sinG = new Gibberish.Sine(freq, amp)
  # sin = RAILS.GEN_FN "Sine", freq: -> Gibberish.rndf(440, 445), amp: (freq)-> 1/freq
  # sinG.connect()  
  # sin.connect()
  # ```
  # @return Gibberish.Ugen   
  GEN_FN: (n, o, c) ->
    for k, v of o
      if (typeof(v) is 'Function') 
        o[k] = v()
    RAILS.GEN n, o, c

  # Um simples sequenciador
  # @return Gibberish.Sequencer
  GEN_SEQ: (o, c) ->
    _o = target: o.target, key: o.key, keysAndValues: null, durations: null
    _o.keysAndValues[k] = fn() for k, fn in o.keysAndValues
    _o.durations[k] = fn() for k, fn in o.durations
    u = Gibberish.Sequencer _o
    if c then c u else u