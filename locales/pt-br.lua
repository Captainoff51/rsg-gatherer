local Translations = {
error = {
    you_dont_have_an_axe = "você não tem um machado!",
    your_axe_is_broken = 'seu machado está quebrado!',
},
success = {
    you_chopped_wood = 'você cortou %{givewood} madeira',
},
primary = {
    you_are_busy_at_the_moment = 'você está ocupado no momento!',
},
menu = {
    start_choping = 'Começar a cortar',
},
commands = {
    var = 'o texto vai aqui',
},
progressbar = {
    var = 'o texto vai aqui',
},
text = {
    tree = 'Árvore',
}
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
