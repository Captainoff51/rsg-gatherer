local Translations = {
    error = {
        you_dont_have_an_axe = "tu n'as pas de hache !",
        your_axe_is_broken = 'votre hache est cassée !',
    },
    success = {
        you_chopped_wood = 'vous avez coupé %{givewood} bois',
    },
    primary = {
        you_are_busy_at_the_moment = 'vous êtes déjà occupé en ce moment !',
    },
    menu = {
        start choppin = 'Démarrer le découpage',
    },
    commands = {
            var = 'text goes here',
    },
    progressbar = {
            var = 'text goes here',
    },
    text = {
        tree = 'Arbres'
    }
}

if GetConvar('rsg_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
